const installedApp = {};

const registerExtension = function(i, e, d) {
  installedApp.init = i;
  installedApp.enable = e;
  installedApp.disable = d;
};

function init() {
  if (installedApp.init) {
    installedApp.init();
  }
}
function enable() {
  if (installedApp.enable) {
    installedApp.enable();
  }
}

function disable() {
  if (installedApp.disable) {
    installedApp.disable();
  }
}
 /* Polyfill from Mozilla. */

  // https://tc39.github.io/ecma262/#sec-array.prototype.find
if (!Array.prototype.find && Object.defineProperty) {
  Object.defineProperty(Array.prototype, 'find', {
    value: function(predicate) {
     // 1. Let O be ? ToObject(this value).
      if (this == null) {
        throw new TypeError('"this" is null or not defined');
      }

      var o = Object(this);

      // 2. Let len be ? ToLength(? Get(O, "length")).
      var len = o.length >>> 0;

      // 3. If IsCallable(predicate) is false, throw a TypeError exception.
      if (typeof predicate !== 'function') {
        throw new TypeError('predicate must be a function');
      }

      // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
      var thisArg = arguments[1];

      // 5. Let k be 0.
      var k = 0;

      // 6. Repeat, while k < len
      while (k < len) {
        // a. Let Pk be ! ToString(k).
        // b. Let kValue be ? Get(O, Pk).
        // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
        // d. If testResult is true, return kValue.
        var kValue = o[k];
        if (predicate.call(thisArg, kValue, k, o)) {
          return kValue;
        }
        // e. Increase k by 1.
        k++;
      }

      // 7. Return undefined.
      return undefined;
    }
  });
}

if (!Array.prototype.findIndex && Object.defineProperty) {
  Object.defineProperty(Array.prototype, 'findIndex', {
    value: function(predicate) {
     // 1. Let O be ? ToObject(this value).
      if (this == null) {
        throw new TypeError('"this" is null or not defined');
      }

      var o = Object(this);

      // 2. Let len be ? ToLength(? Get(O, "length")).
      var len = o.length >>> 0;

      // 3. If IsCallable(predicate) is false, throw a TypeError exception.
      if (typeof predicate !== 'function') {
        throw new TypeError('predicate must be a function');
      }

      // 4. If thisArg was supplied, let T be thisArg; else let T be undefined.
      var thisArg = arguments[1];

      // 5. Let k be 0.
      var k = 0;

      // 6. Repeat, while k < len
      while (k < len) {
        // a. Let Pk be ! ToString(k).
        // b. Let kValue be ? Get(O, Pk).
        // c. Let testResult be ToBoolean(? Call(predicate, T, « kValue, k, O »)).
        // d. If testResult is true, return k.
        var kValue = o[k];
        if (predicate.call(thisArg, kValue, k, o)) {
          return k;
        }
        // e. Increase k by 1.
        k++;
      }

      // 7. Return -1.
      return -1;
    }
  });
}
/* Logging
 * Written by Sergey
*/
let debug = false;
/**
 * If called with a false argument, log statements are suppressed.
 */
function setLoggingEnabled(enabled) {
    debug = enabled;
}
/**
 * Log logs the given message using the gnome shell logger (global.log) if the
 * debug variable is set to true.
 *
 * Debug messages may be viewed using the bash command `journalctl
 * /usr/bin/gnome-shell` and grepping the results for 'gTile'.
 */
function log(message) {
    if (debug) {
        global.log("gTile " + message);
    }
}

/* Determine if gnome-shell version newer than required
 * Written by Sergey
*/
function getConfig() {
    return imports.misc.config;
}
const VERSION_34 = { major: 3, minor: 34 };
const VERSION_36 = { major: 3, minor: 36 };
/**
 * ShellVersion is used to parse the version string
 */
class ShellVersion {
    constructor(version) {
        const parts = version.split('.').map((part) => Number(part));
        if (parts.length < 2) {
            throw new Error(`invalid version supplied: ${version}`);
        }
        this.major = parts[0];
        this.minor = parts[1];
        // Tolerate "40.alpha.1" for example. See https://github.com/gTile/gTile/issues/187.
        if (isNaN(this.minor)) {
            this.minor = 0;
        }
        if (isNaN(this.major)) {
            throw new Error(`invalid version supplied: ${JSON.stringify(version)}; got major = ${this.major}, minor = ${this.minor}`);
        }
        this.rawVersion = version;
    }
    static defaultVersion() {
        return ShellVersion.parse(getConfig().PACKAGE_VERSION);
    }
    static parse(version) {
        return new ShellVersion(version);
    }
    version_at_least_34() {
        return versionGreaterThanOrEqualTo(this, VERSION_34);
    }
    version_at_least_36() {
        return versionGreaterThanOrEqualTo(this, VERSION_36);
    }
    print_version() {
        log("Init gnome-shell version " + this.rawVersion + " major " + this.major + " minor " + this.minor);
    }
}
/**
 * Returns true if a is >= b.
 */
function versionGreaterThanOrEqualTo(a, b) {
    return a.major > b.major || (a.major === b.major && a.minor >= b.minor);
}

// Library imports
const Main = imports.ui.main;
const Meta = imports.gi.Meta;
const Shell = imports.gi.Shell;
// Extension imports
const Me = imports.misc.extensionUtils.getCurrentExtension();
const Settings = Me.imports.settings;
// Globals
const mySettings = Settings.get();
function bind(keyBindings) {
    log("Binding keys");
    keyBindings.forEach((callback, key) => {
        //const key = keyString as KeyBindingSettingName;
        if (Main.wm.addKeybinding && Shell.ActionMode) { // introduced in 3.16
            Main.wm.addKeybinding(key, mySettings, Meta.KeyBindingFlags.NONE, Shell.ActionMode.NORMAL, callback);
        }
        else if (Main.wm.addKeybinding && Shell.KeyBindingMode) { // introduced in 3.7.5
            Main.wm.addKeybinding(key, mySettings, Meta.KeyBindingFlags.NONE, Shell.KeyBindingMode.NORMAL | Shell.KeyBindingMode.MESSAGE_TRAY, callback);
        }
        else {
            global.display.add_keybinding(key, mySettings, Meta.KeyBindingFlags.NONE, callback);
        }
    });
}
function unbind(keyBindings) {
    log("Unbinding keys");
    for (let key of keyBindings.keys()) {
        if (Main.wm.removeKeybinding) { // introduced in 3.7.2
            Main.wm.removeKeybinding(key);
        }
        else {
            global.display.remove_keybinding(key);
        }
    }
}

/* Edited by Sergey after
https://github.com/tpyl/gssnaptoneighbors
 by Timo Pylvanainen <tpyl@iki.fi>
 */
const Meta$1 = imports.gi.Meta;
const WorkspaceManager = global.screen || global.workspace_manager;
const OVERLAP_TOLERANCE = 5;
const SCAN_BOX_SIZE = 50;
/**
 * Return all windows on the currently active workspace
 */
function getWindowsOnActiveWorkspace() {
    let windows = [];
    let windowActors = global.get_window_actors();
    let curWorkSpace = WorkspaceManager.get_active_workspace();
    for (let i = 0; i < windowActors.length; i++) {
        let win = windowActors[i].meta_window;
        if (win.located_on_workspace(curWorkSpace) &&
            !win.minimized &&
            win.get_frame_type() == 0) {
            windows.push(win);
        }
    }
    return windows;
}
/**
 * Find the maximum horzontal expansion from x and
 * returns minx, maxx. The initial maximum x is given
 * as argument, and the expansion is never larger than
 * that.
 *
 * The upper and lower limits define the y coordinate
 * range to check for overlapping windows.
 */
function expandHorizontally(x, upper, lower, minx, maxx, windows) {
    for (let i = 0; i < windows.length; i++) {
        let rect = windows[i].get_frame_rect();
        let wt = rect.y;
        let wb = rect.y + rect.height;
        let wl = rect.x;
        let wr = rect.x + rect.width;
        // Check only  if the window overlaps vertically
        if (wb > upper && wt < lower) {
            if (wr < x && minx < wr) {
                minx = wr;
            }
            if (wl > x && wl < maxx) {
                maxx = wl;
            }
        }
    }
    return { min: minx, max: maxx };
}
/**
 * Find the maximum vertical expansion from  y, and
 * returns miny, maxy. The initial maximum y is given
 * as argument, and the expansion is never larger than
 * that.
 *
 * The left and right limits define the x coordinate
 * range to check for overlapping windows.
 */
function expandVertically(y, left, right, miny, maxy, windows) {
    for (let i = 0; i < windows.length; i++) {
        let rect = windows[i].get_frame_rect();
        let wt = rect.y;
        let wb = rect.y + rect.height;
        let wl = rect.x;
        let wr = rect.x + rect.width;
        // Check only  if the window overlaps horizontally
        if (wr > left && wl < right) {
            if (wb < y && miny < wb) {
                miny = wb;
            }
            if (wt > y && wt < maxy) {
                maxy = wt;
            }
        }
    }
    return { min: miny, max: maxy };
}
/**
 * Resize & move the *window* so it touches adjacent windows or
 * screen edge top, bottom, left and right. The top-left corner
 * of the window defines the expansion point.
 *
 * There is an L-ambiguity where the window could be expanded
 * both vertically and horizontally. The expnasion that results
 * in closer to 1 aspect ratio is selected.
 */
function snapToNeighbors(window) {
    log("snapToNeighbors " + window.get_title());
    // Unmaximize first
    if (window.maximized_horizontally || window.maximized_vertically)
        window.unmaximize(Meta$1.MaximizeFlags.HORIZONTAL | Meta$1.MaximizeFlags.VERTICAL);
    let workArea = window.get_work_area_current_monitor();
    let myrect = window.get_frame_rect();
    let windows = getWindowsOnActiveWorkspace();
    // Scan for overlapping windows in a thin bar around the top of the 
    // window. The vertical height of the window will be adjusted later. 
    let maxHorizw = expandHorizontally(myrect.x + Math.min(SCAN_BOX_SIZE, myrect.width / 2), myrect.y + Math.min(SCAN_BOX_SIZE, myrect.height / 2), myrect.y + Math.min(SCAN_BOX_SIZE, myrect.height / 2) + SCAN_BOX_SIZE, workArea.x, workArea.x + workArea.width, windows);
    let maxHorizh = expandVertically(myrect.y + Math.min(SCAN_BOX_SIZE, myrect.height / 2), maxHorizw.min + OVERLAP_TOLERANCE, maxHorizw.max - OVERLAP_TOLERANCE, workArea.y, workArea.y + workArea.height, windows);
    let maxVerth = expandVertically(myrect.y + Math.min(SCAN_BOX_SIZE, myrect.height / 2), myrect.x + Math.min(SCAN_BOX_SIZE, myrect.width / 2), myrect.x + Math.min(SCAN_BOX_SIZE, myrect.width / 2) + SCAN_BOX_SIZE, workArea.y, workArea.y + workArea.height, windows);
    let maxVertw = expandHorizontally(myrect.x + Math.min(SCAN_BOX_SIZE, myrect.width / 2), maxVerth.min + OVERLAP_TOLERANCE, maxVerth.max - OVERLAP_TOLERANCE, workArea.x, workArea.x + workArea.width, windows);
    if ((maxHorizw.max - maxHorizw.min) * (maxHorizh.max - maxHorizh.min) >
        (maxVertw.max - maxVertw.min) * (maxVerth.max - maxVerth.min)) {
        window.move_resize_frame(true, maxHorizw.min, maxHorizh.min, maxHorizw.max - maxHorizw.min, maxHorizh.max - maxHorizh.min);
    }
    else {
        window.move_resize_frame(true, maxVertw.min, maxVerth.min, maxVertw.max - maxVertw.min, maxVerth.max - maxVerth.min);
    }
}

const MAX_TUPLE_MEMBER_VALUE = Number.MAX_SAFE_INTEGER;
/**
 * TileSpec represents a rectangular area on display by means of specifying a
 * number of evenly spaced tiles and two corners.
 */
class TileSpec {
    constructor(gridWidth, gridHeight, luc, rdc) {
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
        this.luc = luc;
        this.rdc = rdc;
    }
    toString() {
        return [[this.gridWidth, this.gridHeight].join('x'),
            [this.luc.x, this.luc.y].join(':'),
            [this.rdc.x, this.rdc.y].join(':')].join(' ');
    }
    toFrameRect(workArea) {
        const elemSize = new Size(Math.floor(workArea.size.width / this.gridWidth), Math.floor(workArea.size.height / this.gridHeight));
        return new Rect(new XY(workArea.origin.x + this.luc.x * elemSize.width, workArea.origin.y + this.luc.y * elemSize.height), new Size((this.rdc.x + 1 - this.luc.x) * elemSize.width, (this.rdc.y + 1 - this.luc.y) * elemSize.height));
    }
    get gridSize() {
        return new GridSize(this.gridWidth, this.gridHeight);
    }
    viewSize() {
        const sizeXY = this.rdc.minus(this.luc);
        return new GridSize(sizeXY.x + 1, sizeXY.y + 1);
    }
    isFullscreen() {
        return this.viewSize().equals(this.gridSize);
    }
}
class GridSize {
    constructor(
    // Number of columns.
    width, 
    // Number of rows.
    height) {
        this.width = width;
        this.height = height;
    }
    toString() {
        return `${this.width}x${this.height}`;
    }
    equals(other) {
        return this.width === other.width && this.height == other.height;
    }
}
function parseGridSizesIgnoringErrors(s) {
    return s.split(',').flatMap((part) => {
        const size = parseGridSizeIgnoringErrors(part.trim());
        return size ? [size] : [];
    });
}
function parseGridSizeIgnoringErrors(s) {
    const parts = s.split("x").map(Number);
    if (parts.length !== 2 || !parts.every(x => !isNaN(x))) {
        return null;
    }
    return new GridSize(parts[0], parts[1]);
}
class XY {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    clone() {
        return new XY(this.x, this.y);
    }
    toString() {
        return 'XY(' + [this.x, this.y].join(', ') + ')';
    }
    dot(b) {
        return this.x * b.x + this.y * b.y;
    }
    unit() {
        const norm = this.l2norm();
        return new XY(this.x / norm, this.y / norm);
    }
    l2norm() {
        return Math.sqrt(this.l2normSquared());
    }
    l2normSquared() {
        return this.dot(this);
    }
    scale(s) {
        return new XY(this.x * s, this.y * s);
    }
    project(b) {
        return b.scale(this.dot(b) / b.l2normSquared());
    }
    scalarProjection(b) {
        return this.dot(b.unit());
    }
    minus(b) {
        return new XY(this.x - b.x, this.y - b.y);
    }
    plus(b) {
        return new XY(this.x + b.x, this.y + b.y);
    }
}
const ADJOIN_DOT_PRODUCT_TOL = .02;
class LineSegment {
    constructor(a, b) {
        this.a = a;
        this.b = b;
    }
    static fromTwoPoints(a, b) {
        return new LineSegment(a, b);
    }
    direction() {
        return this.b.minus(this.a).unit();
    }
    adjoins(other, distTol) {
        return this.parallels(other) && this.lineDistance(other) < distTol;
    }
    parallels(other) {
        const unitDot = this.direction().dot(other.direction());
        return withinTol(Math.abs(unitDot), 1, ADJOIN_DOT_PRODUCT_TOL);
    }
    // The distance between the lines of two line segments. If lines are not
    // (close to) parallel, 0 is returned
    lineDistance(other) {
        return this.perpVectorBetweenLines(other).l2norm();
    }
    // The perpendicular vector between the lines of two line segments. If lines
    // are not (close to) parallel, [0, 0] is returned
    perpVectorBetweenLines(other) {
        const otherDir = other.direction();
        const unitDot = this.direction().dot(otherDir);
        if (!withinTol(Math.abs(unitDot), 1, ADJOIN_DOT_PRODUCT_TOL)) {
            return new XY(0, 0);
        }
        // Basically parallel. Now measure the perpendicular distance between
        // this.a->other.a and other.a->other.b.
        const d = other.a.minus(this.a);
        return d.minus(d.project(otherDir));
    }
}
class Size {
    constructor(width, height) {
        this.width = width;
        this.height = height;
    }
    clone() {
        return new Size(this.width, this.height);
    }
    toString() {
        return [this.width, this.height].join('x');
    }
    area() {
        return this.width * this.height;
    }
}
/**
 * A screen rectangle. A (0, 0) origin represents the top left of a display
 * area. Units are typically pixels.
 */
class Rect {
    constructor(origin, size) {
        this.origin = origin;
        this.size = size;
    }
    clone() {
        return new Rect(this.origin.clone(), this.size.clone());
    }
    toString() {
        return [this.origin, this.size].join(' ');
    }
    equal(r, tol) {
        const close = (a, b) => Math.abs(a - b) <= tol;
        return (close(this.origin.x, r.origin.x) &&
            close(this.origin.y, r.origin.y) &&
            close(this.size.width, r.size.width) &&
            close(this.size.height, r.size.height));
    }
    inset(s) {
        return new Rect(new XY(this.origin.x + s.width, this.origin.y + s.height), new Size(this.size.width - 2 * s.width, this.size.height - 2 * s.height));
    }
    edges() {
        const down = new XY(0, this.size.height);
        const right = new XY(this.size.width, 0);
        const seg = (a, b) => LineSegment.fromTwoPoints(a, b);
        // a---b
        // c---d
        const a = this.origin;
        const b = a.plus(right);
        const c = a.plus(down);
        const d = c.plus(right);
        const rv = new Edges({
            top: seg(a, b),
            right: seg(b, d),
            bottom: seg(c, d),
            left: seg(a, c)
        });
        return rv;
    }
    translate(vec) {
        return new Rect(this.origin.plus(vec), this.size);
    }
    // Increases or decreases the size of the rectangle by moving one of its
    // edges d units along the postive x or y axis, where positive x is right
    // and positive y is down.
    translateEdge(side, d) {
        const [w, h] = [this.size.width, this.size.height];
        switch (side) {
            case Side.Top:
                return new Rect(this.origin.plus(new XY(0, d)), new Size(w, h - d));
            case Side.Bottom:
                return new Rect(this.origin, new Size(w, h + d));
            case Side.Right:
                return new Rect(this.origin, new Size(w + d, h));
            case Side.Left:
                return new Rect(this.origin.plus(new XY(d, 0)), new Size(w - d, h));
            default:
                throw TypeError('bad side type ' + side);
        }
    }
    topLeft() {
        return this.origin;
    }
    topRight() {
        return this.origin.plus(new XY(this.size.width, 0));
    }
    bottomRight() {
        return this.origin.plus(new XY(this.size.width, this.size.height));
    }
    bottomLeft() {
        return this.origin.plus(new XY(0, this.size.height));
    }
    intersection(other) {
        // Not optimized, but that's not necessary.
        const origin = new XY(Math.max(this.topLeft().x, other.topLeft().x), Math.max(this.topLeft().y, other.topLeft().y));
        const br = new XY(Math.min(this.bottomRight().x, other.bottomRight().x), Math.min(this.bottomRight().y, other.bottomRight().y));
        const sizeXY = br.minus(origin);
        const size = new Size(sizeXY.x, sizeXY.y);
        if (size.width < 0 || size.height < 0) {
            return new Rect(new XY(0, 0), new Size(0, 0));
        }
        return new Rect(origin, size);
    }
    valid() {
        return this.size.width >= 0 && this.size.height >= 0;
    }
}
var Side;
(function (Side) {
    Side["Top"] = "TOP";
    Side["Right"] = "RIGHT";
    Side["Bottom"] = "BOTTOM";
    Side["Left"] = "LEFT";
})(Side || (Side = {}));
class Edges {
    constructor(obj) {
        this.top = obj.top;
        this.left = obj.left;
        this.bottom = obj.bottom;
        this.right = obj.right;
    }
    getSide(s) {
        switch (s) {
            case Side.Top: return this.top;
            case Side.Right: return this.right;
            case Side.Bottom: return this.bottom;
            case Side.Left: return this.left;
        }
    }
}
/**
 * parsePreset parses a sequence of TileSpec objects from a string like "8x8 0:0
 * 0:7, 8x10 0:0 2:7" or "8x8 0:0 0:7, 0:0 2:7"
 *
 * The 8x8 and 8x10 values above are the "grid size." The grid size may be
 * omitted in all but the first component of the preset.
 */
function parsePreset(preset) {
    const parts = preset.split(',').map(x => x.trim());
    let mostRecentSpec = null;
    return parts.map((part, index) => {
        if (hasImpliedGridSize(part)) {
            if (mostRecentSpec === null) {
                throw new Error(`preset component[${index}] ${part} of ${preset} is missing grid size (e.g., '3x3')`);
            }
            part = `${mostRecentSpec.gridWidth}x${mostRecentSpec.gridHeight} ${part}`;
        }
        const parsed = parseSinglePreset(part);
        mostRecentSpec = parsed;
        return parsed;
    });
}
function parseSinglePreset(preset) {
    const ps = preset.trim().split(" ");
    if (ps.length != 3) {
        throw new Error(`Bad preset: ${JSON.stringify(preset)}`);
    }
    const gridFormat = parseTuple(ps[0], "x");
    const luc = parseTuple(ps[1], ":");
    const rdc = parseTuple(ps[2], ":");
    if (gridFormat.x < 1 || luc.x < 0 || rdc.x < 0
        || gridFormat.y < 1 || luc.y < 0 || rdc.y < 0
        || gridFormat.x <= luc.x || gridFormat.x <= rdc.x
        || gridFormat.y <= luc.y || gridFormat.y <= rdc.y
        || luc.x > rdc.x || luc.y > rdc.y) {
        throw new Error(`Bad preset: ${JSON.stringify(preset)}`);
    }
    return new TileSpec(gridFormat.x, gridFormat.y, luc, rdc);
}
function hasImpliedGridSize(singlePreset) {
    return singlePreset.trim().split(" ").length === 2;
}
/**
 * Parses a value like like 6x4 or 1:2 into {X: 6, Y: 4} or {X: 1, Y: 2}.
 */
function parseTuple(unparsed, delim) {
    // parsing grid size in unparsed XdelimY, like 6x4 or 1:2
    const gssk = unparsed.split(delim);
    if (gssk.length !== 2) {
        throw new Error("Failed to split " + unparsed + " by delimiter " + delim + " into two numbers");
    }
    const numbers = gssk.map(Number);
    if (numbers.some(n => isNaN(n) || n < 0 || n > MAX_TUPLE_MEMBER_VALUE)) {
        throw new Error(`All elements of tuple must be intgers in [0, ${MAX_TUPLE_MEMBER_VALUE}]: ${JSON.stringify(unparsed)}`);
    }
    return new XY(numbers[0], numbers[1]);
}
function withinTol(a, b, tol) {
    return Math.abs(a - b) <= tol;
}

/**
 * @fileoverview This file contains incomplete typings for gnome shell types.
 *
 * Probably the best source of definitive API documentation is here:
 * https://gjs-docs.gnome.org/
 *
 * However, there are also some ways the GJS works that make the API docs above
 * slightly incomplete.
 * https://wiki.gnome.org/Projects/GnomeShell/Extensions/StepByStepTutorial
 * mentions that constructors can take a property map as an argument. This file
 * does not correctly type the constructors for these types.
 */
/**
 * From https://gjs-docs.gnome.org/meta4~4_api/meta.frametype.
 */
var FrameType;
(function (FrameType) {
    FrameType[FrameType["NORMAL"] = 0] = "NORMAL";
    FrameType[FrameType["DIALOG"] = 1] = "DIALOG";
    FrameType[FrameType["MODAL_DIALOG"] = 2] = "MODAL_DIALOG";
    FrameType[FrameType["UTILITY"] = 3] = "UTILITY";
    FrameType[FrameType["MENU"] = 4] = "MENU";
    FrameType[FrameType["BORDER"] = 5] = "BORDER";
    FrameType[FrameType["ATTACHED"] = 6] = "ATTACHED";
    FrameType[FrameType["LAST"] = 7] = "LAST";
})(FrameType || (FrameType = {}));
var WindowType;
(function (WindowType) {
    WindowType[WindowType["NORMAL"] = 0] = "NORMAL";
    WindowType[WindowType["DESKTOP"] = 1] = "DESKTOP";
    WindowType[WindowType["DOCK"] = 2] = "DOCK";
    WindowType[WindowType["DIALOG"] = 3] = "DIALOG";
    WindowType[WindowType["MODAL_DIALOG"] = 4] = "MODAL_DIALOG";
    WindowType[WindowType["TOOLBAR"] = 5] = "TOOLBAR";
    WindowType[WindowType["MENU"] = 6] = "MENU";
    WindowType[WindowType["UTILITY"] = 7] = "UTILITY";
    WindowType[WindowType["SPLASHSCREEN"] = 8] = "SPLASHSCREEN";
    WindowType[WindowType["DROPDOWN_MENU"] = 9] = "DROPDOWN_MENU";
    WindowType[WindowType["POPUP_MENU"] = 10] = "POPUP_MENU";
    WindowType[WindowType["TOOLTIP"] = 11] = "TOOLTIP";
    WindowType[WindowType["NOTIFICATION"] = 12] = "NOTIFICATION";
    WindowType[WindowType["COMBO"] = 13] = "COMBO";
    WindowType[WindowType["DND"] = 14] = "DND";
    WindowType[WindowType["OVERRIDE_OTHER"] = 15] = "OVERRIDE_OTHER";
})(WindowType || (WindowType = {}));
var MaximizeFlags;
(function (MaximizeFlags) {
    MaximizeFlags[MaximizeFlags["HORIZONTAL"] = 1] = "HORIZONTAL";
    MaximizeFlags[MaximizeFlags["VERTICAL"] = 2] = "VERTICAL";
    MaximizeFlags[MaximizeFlags["BOTH"] = 3] = "BOTH";
})(MaximizeFlags || (MaximizeFlags = {}));

/*****************************************************************

  This extension has been developed by vibou

  With the help of the gnome-shell community

  Edited by Kvis for gnome 3.8
  Edited by Lundal for gnome 3.18
  Edited by Sergey to add keyboard shortcuts and prefs dialog

 ******************************************************************/
/*****************************************************************
  CONST & VARS
 *****************************************************************/
// Library imports
const St = imports.gi.St;
const Main$1 = imports.ui.main;
const Shell$1 = imports.gi.Shell;
const Lang = imports.lang;
const PanelMenu = imports.ui.panelMenu;
const Meta$2 = imports.gi.Meta;
const Clutter = imports.gi.Clutter;
const Signals = imports.signals;
const Workspace = imports.ui.workspace;
// Getter for accesing "get_active_workspace" on GNOME <=2.28 and >= 2.30
const WorkspaceManager$1 = (global.screen || global.workspace_manager);
// Extension imports
const Me$1 = imports.misc.extensionUtils.getCurrentExtension();
const Settings$1 = Me$1.imports.settings;
// Globals
const SETTINGS_GRID_SIZES = 'grid-sizes';
const SETTINGS_AUTO_CLOSE = 'auto-close';
const SETTINGS_ANIMATION = 'animation';
const SETTINGS_SHOW_ICON = 'show-icon';
const SETTINGS_GLOBAL_PRESETS = 'global-presets';
const SETTINGS_MOVERESIZE_ENABLED = 'moveresize-enabled';
const SETTINGS_WINDOW_MARGIN = 'window-margin';
const SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED = 'window-margin-fullscreen-enabled';
const SETTINGS_MAX_TIMEOUT = 'max-timeout';
const SETTINGS_MAIN_WINDOW_SIZES = 'main-window-sizes';
const SETTINGS_INSETS_PRIMARY = 'insets-primary';
const SETTINGS_INSETS_PRIMARY_LEFT = 'insets-primary-left';
const SETTINGS_INSETS_PRIMARY_RIGHT = 'insets-primary-right';
const SETTINGS_INSETS_PRIMARY_TOP = 'insets-primary-top';
const SETTINGS_INSETS_PRIMARY_BOTTOM = 'insets-primary-bottom';
const SETTINGS_INSETS_SECONDARY = 'insets-secondary';
const SETTINGS_INSETS_SECONDARY_LEFT = 'insets-secondary-left';
const SETTINGS_INSETS_SECONDARY_RIGHT = 'insets-secondary-right';
const SETTINGS_INSETS_SECONDARY_TOP = 'insets-secondary-top';
const SETTINGS_INSETS_SECONDARY_BOTTOM = 'insets-secondary-bottom';
const SETTINGS_DEBUG = 'debug';
const gridSettings = {
    [SETTINGS_GRID_SIZES]: [],
    [SETTINGS_AUTO_CLOSE]: null,
    [SETTINGS_ANIMATION]: null,
    [SETTINGS_SHOW_ICON]: null,
    [SETTINGS_GLOBAL_PRESETS]: null,
    [SETTINGS_MOVERESIZE_ENABLED]: null,
    [SETTINGS_WINDOW_MARGIN]: 0,
    [SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED]: false,
    [SETTINGS_MAX_TIMEOUT]: null,
    [SETTINGS_MAIN_WINDOW_SIZES]: [],
    [SETTINGS_INSETS_PRIMARY]: 0,
    [SETTINGS_INSETS_PRIMARY_LEFT]: 0,
    [SETTINGS_INSETS_PRIMARY_RIGHT]: 0,
    [SETTINGS_INSETS_PRIMARY_TOP]: 0,
    [SETTINGS_INSETS_PRIMARY_BOTTOM]: 0,
    [SETTINGS_INSETS_SECONDARY]: 0,
    [SETTINGS_INSETS_SECONDARY_LEFT]: 0,
    [SETTINGS_INSETS_SECONDARY_RIGHT]: 0,
    [SETTINGS_INSETS_SECONDARY_TOP]: 0,
    [SETTINGS_INSETS_SECONDARY_BOTTOM]: 0,
    [SETTINGS_DEBUG]: null,
};
let launcher;
let tracker;
let nbCols = 0;
let nbRows = 0;
let focusMetaWindow = null;
let focusConnect = false;
let settings = Settings$1.get();
settings.connect('changed', changed_settings);
let keyControlBound = false;
let enabled = false;
let mainWindowSizes = new Array();
let monitorsChangedConnect = false;
const SHELL_VERSION = ShellVersion.defaultVersion();
const lastResizeInfo = {
    variantIndex: 0,
    lastCallTime: new Date(),
    presetName: '',
    windowTitle: '',
};
// Hangouts workaround
let excludedApplications = new Array("Unknown");
const keyBindings = new Map([
    ['show-toggle-tiling', () => { globalApp.toggleTiling(); }],
    ['show-toggle-tiling-alt', () => { globalApp.toggleTiling(); }],
]);
const key_bindings_tiling = new Map([
    ['move-left', () => { keyMoveResizeEvent('move', 'left'); }],
    ['move-right', () => { keyMoveResizeEvent('move', 'right'); }],
    ['move-up', () => { keyMoveResizeEvent('move', 'up'); }],
    ['move-down', () => { keyMoveResizeEvent('move', 'down'); }],
    ['resize-left', () => { keyMoveResizeEvent('resize', 'left'); }],
    ['resize-right', () => { keyMoveResizeEvent('resize', 'right'); }],
    ['resize-up', () => { keyMoveResizeEvent('resize', 'up'); }],
    ['resize-down', () => { keyMoveResizeEvent('resize', 'down'); }],
    ['move-left-vi', () => { keyMoveResizeEvent('move', 'left'); }],
    ['move-right-vi', () => { keyMoveResizeEvent('move', 'right'); }],
    ['move-up-vi', () => { keyMoveResizeEvent('move', 'up'); }],
    ['move-down-vi', () => { keyMoveResizeEvent('move', 'down'); }],
    ['resize-left-vi', () => { keyMoveResizeEvent('resize', 'left'); }],
    ['resize-right-vi', () => { keyMoveResizeEvent('resize', 'right'); }],
    ['resize-up-vi', () => { keyMoveResizeEvent('resize', 'up'); }],
    ['resize-down-vi', () => { keyMoveResizeEvent('resize', 'down'); }],
    ['cancel-tiling', () => { keyCancelTiling(); }],
    ['set-tiling', () => { keySetTiling(); }],
    ['change-grid-size', () => { keyChangeTiling(); }],
    ['autotile-main', () => { AutoTileMain(); }],
    ['autotile-1', () => { autoTileNCols(1); }],
    ['autotile-2', () => { autoTileNCols(2); }],
    ['autotile-3', () => { autoTileNCols(3); }],
    ['autotile-4', () => { autoTileNCols(4); }],
    ['autotile-5', () => { autoTileNCols(5); }],
    ['autotile-6', () => { autoTileNCols(6); }],
    ['autotile-7', () => { autoTileNCols(7); }],
    ['autotile-8', () => { autoTileNCols(8); }],
    ['autotile-9', () => { autoTileNCols(9); }],
    ['autotile-10', () => { autoTileNCols(10); }],
    ['snap-to-neighbors', () => { snapToNeighborsBind(); }],
    ['snap-to-neighbors', () => { snapToNeighborsBind(); }],
]);
const key_bindings_presets = new Map([
    ['preset-resize-1', () => { presetResize(1, 'resize1'); }],
    ['preset-resize-2', () => { presetResize(2, 'resize2'); }],
    ['preset-resize-3', () => { presetResize(3, 'resize3'); }],
    ['preset-resize-4', () => { presetResize(4, 'resize4'); }],
    ['preset-resize-5', () => { presetResize(5, 'resize5'); }],
    ['preset-resize-6', () => { presetResize(6, 'resize6'); }],
    ['preset-resize-7', () => { presetResize(7, 'resize7'); }],
    ['preset-resize-8', () => { presetResize(8, 'resize8'); }],
    ['preset-resize-9', () => { presetResize(9, 'resize9'); }],
    ['preset-resize-10', () => { presetResize(10, 'resize10'); }],
    ['preset-resize-11', () => { presetResize(11, 'resize11'); }],
    ['preset-resize-12', () => { presetResize(12, 'resize12'); }],
    ['preset-resize-13', () => { presetResize(13, 'resize13'); }],
    ['preset-resize-14', () => { presetResize(14, 'resize14'); }],
    ['preset-resize-15', () => { presetResize(15, 'resize15'); }],
    ['preset-resize-16', () => { presetResize(16, 'resize16'); }],
    ['preset-resize-17', () => { presetResize(17, 'resize17'); }],
    ['preset-resize-18', () => { presetResize(18, 'resize18'); }],
    ['preset-resize-19', () => { presetResize(19, 'resize19'); }],
    ['preset-resize-20', () => { presetResize(20, 'resize20'); }],
    ['preset-resize-21', () => { presetResize(21, 'resize21'); }],
    ['preset-resize-22', () => { presetResize(22, 'resize22'); }],
    ['preset-resize-23', () => { presetResize(23, 'resize23'); }],
    ['preset-resize-24', () => { presetResize(24, 'resize24'); }],
    ['preset-resize-25', () => { presetResize(25, 'resize25'); }],
    ['preset-resize-26', () => { presetResize(26, 'resize26'); }],
    ['preset-resize-27', () => { presetResize(27, 'resize27'); }],
    ['preset-resize-28', () => { presetResize(28, 'resize28'); }],
    ['preset-resize-29', () => { presetResize(29, 'resize29'); }],
    ['preset-resize-30', () => { presetResize(30, 'resize30'); }],
]);
const keyBindingGlobalResizes = new Map([
    ['action-change-tiling', () => { keyChangeTiling(); }],
    ['action-contract-bottom', () => { keyMoveResizeEvent('contract', 'bottom', true); }],
    ['action-contract-left', () => { keyMoveResizeEvent('contract', 'left', true); }],
    ['action-contract-right', () => { keyMoveResizeEvent('contract', 'right', true); }],
    ['action-contract-top', () => { keyMoveResizeEvent('contract', 'top', true); }],
    ['action-expand-bottom', () => { keyMoveResizeEvent('expand', 'bottom', true); }],
    ['action-expand-left', () => { keyMoveResizeEvent('expand', 'left', true); }],
    ['action-expand-right', () => { keyMoveResizeEvent('expand', 'right', true); }],
    ['action-expand-top', () => { keyMoveResizeEvent('expand', 'top', true); }],
    ['action-move-down', () => { keyMoveResizeEvent('move', 'down', true); }],
    ['action-move-left', () => { keyMoveResizeEvent('move', 'left', true); }],
    ['action-move-right', () => { keyMoveResizeEvent('move', 'right', true); }],
    ['action-move-up', () => { keyMoveResizeEvent('move', 'up', true); }],
    ['action-move-next-monitor', () => { moveWindowToNextMonitor(); }],
]);
class App {
    constructor() {
        this.gridsByMonitorKey = {};
        this.gridShowing = false;
        this.gridWidget = null;
    }
    enable() {
        this.gridShowing = false;
        tracker = Shell$1.WindowTracker.get_default();
        initSettings();
        const gridWidget = (new St.BoxLayout({ style_class: 'grid-preview' }));
        this.gridWidget = gridWidget;
        Main$1.uiGroup.add_actor(gridWidget);
        this.initGrids(gridWidget);
        log("Create Button on Panel");
        launcher = new GTileStatusButton('tiling-icon');
        if (gridSettings[SETTINGS_SHOW_ICON]) {
            Main$1.panel.addToStatusArea("GTileStatusButton", launcher);
        }
        bind(keyBindings);
        if (gridSettings[SETTINGS_GLOBAL_PRESETS]) {
            bind(key_bindings_presets);
        }
        if (gridSettings[SETTINGS_MOVERESIZE_ENABLED]) {
            bind(keyBindingGlobalResizes);
        }
        if (monitorsChangedConnect) {
            Main$1.layoutManager.disconnect(monitorsChangedConnect);
        }
        log("Connecting monitors-changed");
        monitorsChangedConnect = Main$1.layoutManager.connect('monitors-changed', () => {
            log("Reinitializing grids on monitors-changed");
            this.destroyGrids();
            this.initGrids(gridWidget);
        });
        enabled = true;
        log("Extention enable completed");
    }
    getGrid(monitor) {
        return this.gridsByMonitorKey[getMonitorKey(monitor)];
    }
    initGrids(gridWidget) {
        log("initGrids");
        log("initGrids nobCols " + nbCols + " nbRows " + nbRows);
        const monitors = activeMonitors();
        for (let monitorIdx = 0; monitorIdx < monitors.length; monitorIdx++) {
            log("New Grid for monitor " + monitorIdx);
            let monitor = monitors[monitorIdx];
            let grid = new Grid(gridWidget, monitorIdx, monitor, "gTile", nbCols, nbRows);
            const key = getMonitorKey(monitor);
            this.gridsByMonitorKey[key] = grid;
            log("initGrids adding grid key " + key);
            // TODO: addChrome is poorly documented. I can't find any reference
            // to it in the gjs-docs site.
            Main$1.layoutManager.addChrome(grid.actor, { trackFullscreen: true });
            grid.actor.set_opacity(0);
            grid.hide(true);
            log("Connect hide-tiling for monitor " + monitorIdx);
            grid.connectHideTiling = grid.connect('hide-tiling', () => this.hideTiling());
        }
        log("Init grid done");
    }
    destroyGrids() {
        log("destroyGrids");
        for (let gridKey in this.gridsByMonitorKey) {
            const grid = this.gridsByMonitorKey[gridKey];
            grid.hide(true);
            Main$1.layoutManager.removeChrome(grid.actor);
            log("Disconnect hide-tiling for monitor " + grid.monitor_idx);
            grid.disconnect(grid.connectHideTiling);
            delete this.gridsByMonitorKey[gridKey];
        }
        log("destroyGrids done");
        for (let gridKey in this.gridsByMonitorKey) {
            log("ERROR: gridKey still found in this.gridsByMonitorKey: " + gridKey);
        }
    }
    refreshGrids() {
        log("refreshGrids");
        for (let gridIdx in this.gridsByMonitorKey) {
            const grid = this.gridsByMonitorKey[gridIdx];
            log("refreshGrids calling refresh on " + gridIdx);
            grid.refresh();
        }
        log("refreshGrids done");
    }
    setGridSize(gridSize) {
        nbCols = gridSize.width;
        nbRows = gridSize.height;
        this.refreshGrids();
    }
    moveGrids() {
        log("moveGrids");
        if (!this.gridShowing) {
            return;
        }
        let window = focusMetaWindow;
        if (window) {
            for (let gridKey in this.gridsByMonitorKey) {
                let grid = this.gridsByMonitorKey[gridKey];
                let pos_x;
                let pos_y;
                const monitor = grid.monitor;
                if (!monitor) {
                    return;
                }
                if (window.get_monitor() == grid.monitor_idx) {
                    pos_x = window.get_frame_rect().width / 2 + window.get_frame_rect().x;
                    pos_y = window.get_frame_rect().height / 2 + window.get_frame_rect().y;
                    let [mouse_x, mouse_y, mask] = global.get_pointer();
                    let act_x = pos_x - grid.actor.width / 2;
                    let act_y = pos_y - grid.actor.height / 2;
                    if (mouse_x >= act_x
                        && mouse_x <= act_x + grid.actor.width
                        && mouse_y >= act_y
                        && mouse_y <= act_y + grid.actor.height) {
                        log("Mouse x " + mouse_x + " y " + mouse_y +
                            " is inside grid actor rectangle, changing actor X from " + pos_x + " to " + (mouse_x + grid.actor.width / 2) +
                            ", Y from " + pos_y + " to " + (mouse_y + grid.actor.height / 2));
                        pos_x = mouse_x + grid.actor.width / 2;
                        pos_y = mouse_y + grid.actor.height / 2;
                    }
                }
                else {
                    pos_x = monitor.x + monitor.width / 2;
                    pos_y = monitor.y + monitor.height / 2;
                }
                pos_x = Math.floor(pos_x - grid.actor.width / 2);
                pos_y = Math.floor(pos_y - grid.actor.height / 2);
                if (window.get_monitor() == grid.monitor_idx) {
                    pos_x = (pos_x < monitor.x) ? monitor.x : pos_x;
                    pos_x = ((pos_x + grid.actor.width) > (monitor.width + monitor.x)) ? monitor.x + monitor.width - grid.actor.width : pos_x;
                    pos_y = (pos_y < monitor.y) ? monitor.y : pos_y;
                    pos_y = ((pos_y + grid.actor.height) > (monitor.height + monitor.y)) ? monitor.y + monitor.height - grid.actor.height : pos_y;
                }
                let time = (gridSettings[SETTINGS_ANIMATION]) ? 0.3 : 0.1;
                grid.actor.ease({
                    time: time,
                    x: pos_x,
                    y: pos_y,
                    transition: Clutter.AnimationMode.EASE_OUT_QUAD,
                });
            }
        }
    }
    updateRegions() {
        var _a;
        /*Main.layoutManager._chrome.updateRegions();*/
        log("updateRegions");
        this.refreshGrids();
        for (let idx in this.gridsByMonitorKey) {
            (_a = this.gridsByMonitorKey[idx].elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
        }
    }
    logState() {
        let count = 0;
        let states = '';
        for (let gridKey in this.gridsByMonitorKey) {
            states += `; ${this.gridsByMonitorKey[gridKey].state()}`;
            count++;
        }
        log(`${count} grids; showing = ${this.gridShowing}: ${states}`);
    }
    showTiling() {
        // TODO(#168): See https://github.com/gTile/gTile/issues/168. Without
        // these two lines, the grid UI does not properly respond to mouseover
        // and other events except for the first time it is shown.
        log("showTiling with fix");
        this.hideTiling();
        this.destroyGrids();
        this.initGrids(this.gridWidget);
        this.logState();
        log("issue#168/showTiling with fix");
        const window = getFocusApp();
        // TODO: remove this global side effect
        focusMetaWindow = window;
        if (!this.gridWidget) {
            return;
        }
        const shouldShowTiling = (() => {
            if (!window) {
                // The tiling UI is for manipulating a particular window.
                return false;
            }
            const wmType = window.get_window_type();
            const layer = window.get_layer();
            return wmType !== WindowType.DESKTOP && layer > 0;
        })();
        if (!shouldShowTiling) {
            return;
        }
        this.gridWidget.visible = true;
        const monitors = activeMonitors();
        for (let monitorIdx = 0; monitorIdx < monitors.length; monitorIdx++) {
            const monitor = monitors[monitorIdx];
            const grid = this.getGrid(monitor);
            if (grid === null) {
                log(`issue#168/showTiling ERROR: did not find grid for monitor ${getMonitorKey(monitor)}`);
                continue;
            }
            let pos_x;
            let pos_y;
            if (window && window.get_monitor() === monitorIdx) {
                // Set pos_x, pos_y to center of the selected window initially.
                pos_x = window.get_frame_rect().width / 2 + window.get_frame_rect().x;
                pos_y = window.get_frame_rect().height / 2 + window.get_frame_rect().y;
                // Old logic with no justifying comments: If the mouse is active
                // and within the rectangle,  set pos_x and pos_y  at mouse
                // position + half the size of the Grid window.
                let [mouse_x, mouse_y, mask] = global.get_pointer();
                let act_x = pos_x - grid.actor.width / 2;
                let act_y = pos_y - grid.actor.height / 2;
                if (mouse_x >= act_x
                    && mouse_x <= act_x + grid.actor.width
                    && mouse_y >= act_y
                    && mouse_y <= act_y + grid.actor.height) {
                    log("Mouse x " + mouse_x + " y " + mouse_y +
                        " is inside grid actor rectangle, changing actor X from " + pos_x + " to " + (mouse_x + grid.actor.width / 2) +
                        ", Y from " + pos_y + " to " + (mouse_y + grid.actor.height / 2));
                    pos_x = mouse_x + grid.actor.width / 2;
                    pos_y = mouse_y + grid.actor.height / 2;
                }
            }
            else {
                pos_x = monitor.x + monitor.width / 2;
                pos_y = monitor.y + monitor.height / 2;
            }
            grid.set_position(Math.floor(pos_x - grid.actor.width / 2), Math.floor(pos_y - grid.actor.height / 2));
            grid.show();
        }
        this.gridShowing = true;
        this.onFocus();
        launcher === null || launcher === void 0 ? void 0 : launcher.activate();
        bindKeyControls();
        this.moveGrids();
    }
    disable() {
        log("Extension disable begin");
        enabled = false;
        if (monitorsChangedConnect) {
            log("Disconnecting monitors-changed");
            Main$1.layoutManager.disconnect(monitorsChangedConnect);
            monitorsChangedConnect = false;
        }
        unbind(keyBindings);
        unbind(key_bindings_presets);
        unbind(keyBindingGlobalResizes);
        if (keyControlBound) {
            unbind(key_bindings_tiling);
            keyControlBound = false;
        }
        launcher === null || launcher === void 0 ? void 0 : launcher.destroy();
        launcher = null;
        Main$1.uiGroup.remove_actor(this.gridWidget);
        this.destroyGrids();
        resetFocusMetaWindow();
        log("Extention disable completed");
    }
    hideTiling() {
        var _a;
        log("hideTiling");
        for (let key in this.gridsByMonitorKey) {
            const grid = this.gridsByMonitorKey[key];
            (_a = grid.elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
            grid.hide(false);
        }
        if (this.gridWidget) {
            this.gridWidget.visible = false;
        }
        resetFocusMetaWindow();
        launcher === null || launcher === void 0 ? void 0 : launcher.deactivate();
        this.gridShowing = false;
        unbindKeyControls();
    }
    toggleTiling() {
        if (this.gridShowing) {
            this.hideTiling();
        }
        else {
            this.showTiling();
        }
        return this.gridShowing;
    }
    /**
     * onFocus is called when the global focus changes.
     */
    onFocus() {
        log("_onFocus ");
        resetFocusMetaWindow();
        const window = getFocusApp();
        if (window && this.gridShowing) {
            log("_onFocus " + window.get_title());
            focusMetaWindow = window;
            let app = tracker.get_window_app(focusMetaWindow);
            let title = focusMetaWindow.get_title();
            const monitors = activeMonitors();
            for (let monitorIdx = 0; monitorIdx < monitors.length; monitorIdx++) {
                let monitor = monitors[monitorIdx];
                let grid = this.getGrid(monitor);
                if (app) {
                    grid === null || grid === void 0 ? void 0 : grid.topbar.setApp(app, title);
                }
                else {
                    grid === null || grid === void 0 ? void 0 : grid.topbar.setTitle(title);
                }
            }
            this.moveGrids();
        }
        else {
            if (this.gridShowing) {
                log("No focus window, hide tiling");
                this.hideTiling();
            }
            else {
                log("tiling window not active");
            }
        }
    }
}
const globalApp = new App();
function changed_settings() {
    log("changed_settings");
    if (enabled) {
        disable();
        enable();
    }
    log("changed_settings complete");
}
const GTileStatusButton = new Lang.Class({
    Name: 'GTileStatusButton',
    Extends: PanelMenu.Button,
    _init: function (classname) {
        this.parent(0.0, "gTile", false);
        //Done by default in PanelMenuButton - Just need to override the method
        if (SHELL_VERSION.version_at_least_34()) {
            this.add_style_class_name(classname);
            this.connect('button-press-event', Lang.bind(this, this._onButtonPress));
        }
        else {
            this.actor.add_style_class_name(classname);
            this.actor.connect('button-press-event', Lang.bind(this, this._onButtonPress));
        }
        log("GTileStatusButton _init done");
    },
    reset: function () {
        this.activated = false;
        if (SHELL_VERSION.version_at_least_34()) {
            this.remove_style_pseudo_class('activate');
        }
        else {
            this.actor.remove_style_pseudo_class('activate');
        }
    },
    activate: function () {
        if (SHELL_VERSION.version_at_least_34()) {
            this.add_style_pseudo_class('activate');
        }
        else {
            this.actor.add_style_pseudo_class('activate');
        }
    },
    deactivate: function () {
        if (SHELL_VERSION.version_at_least_34()) {
            this.remove_style_pseudo_class('activate');
        }
        else {
            this.actor.remove_style_pseudo_class('activate');
        }
    },
    _onButtonPress: function (actor, event) {
        log(`_onButtonPress Click Toggle Status on system panel ${this}`);
        globalApp.toggleTiling();
    },
    _destroy: function () {
        this.activated = null;
    }
});
/*****************************************************************
  SETTINGS
 *****************************************************************/
function initGridSizes(configValue) {
    let gridSizes = parseGridSizesIgnoringErrors(configValue);
    if (gridSizes.length === 0) {
        gridSizes = [
            new GridSize(8, 6),
            new GridSize(6, 4),
            new GridSize(4, 4),
        ];
    }
    gridSettings[SETTINGS_GRID_SIZES] = gridSizes;
}
function getBoolSetting(settingName) {
    const value = settings.get_boolean(settingName);
    if (value === undefined) {
        log("Undefined settings " + settingName);
        gridSettings[settingName] = false;
        return false;
    }
    else {
        gridSettings[settingName] = value;
    }
    return value;
}
function getIntSetting(settingsValue) {
    let iss = settings.get_int(settingsValue);
    if (iss === undefined) {
        log("Undefined settings " + settingsValue);
        return 0;
    }
    else {
        return iss;
    }
}
function initSettings() {
    log("Init settings");
    const gridSizes = settings.get_string(SETTINGS_GRID_SIZES) || '';
    log(SETTINGS_GRID_SIZES + " set to " + gridSizes);
    initGridSizes(gridSizes);
    getBoolSetting(SETTINGS_AUTO_CLOSE);
    getBoolSetting(SETTINGS_ANIMATION);
    getBoolSetting(SETTINGS_SHOW_ICON);
    getBoolSetting(SETTINGS_GLOBAL_PRESETS);
    getBoolSetting(SETTINGS_MOVERESIZE_ENABLED);
    gridSettings[SETTINGS_WINDOW_MARGIN] = getIntSetting(SETTINGS_WINDOW_MARGIN);
    gridSettings[SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED] = getBoolSetting(SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED);
    gridSettings[SETTINGS_MAX_TIMEOUT] = getIntSetting(SETTINGS_MAX_TIMEOUT);
    // initialize these from settings, the first set of sizes
    if (nbCols == 0 || nbRows == 0) {
        nbCols = gridSettings[SETTINGS_GRID_SIZES][0].width;
        nbRows = gridSettings[SETTINGS_GRID_SIZES][0].height;
    }
    const mainWindowSizesString = settings.get_string(SETTINGS_MAIN_WINDOW_SIZES);
    log(SETTINGS_MAIN_WINDOW_SIZES + " settings found " + mainWindowSizesString);
    mainWindowSizes = [];
    let mainWindowSizesArray = mainWindowSizesString.split(",");
    for (var i in mainWindowSizesArray) {
        let size = mainWindowSizesArray[i];
        if (size.includes("/")) {
            let fraction = size.split("/");
            let ratio = parseFloat(fraction[0]) / parseFloat(fraction[1]);
            mainWindowSizes.push(ratio);
        }
        else {
            mainWindowSizes.push(parseFloat(size));
        }
    }
    log(SETTINGS_MAIN_WINDOW_SIZES + " set to " + mainWindowSizes);
    log("Init complete, nbCols " + nbCols + " nbRows " + nbRows);
}
function getMonitorTier(monitor) {
    return isPrimaryMonitor(monitor) ? 'primary' : 'secondary';
}
function getMonitorInsets(tier) {
    switch (tier) {
        case 'primary':
            return {
                top: getIntSetting(SETTINGS_INSETS_PRIMARY_TOP),
                bottom: getIntSetting(SETTINGS_INSETS_PRIMARY_BOTTOM),
                left: getIntSetting(SETTINGS_INSETS_PRIMARY_LEFT),
                right: getIntSetting(SETTINGS_INSETS_PRIMARY_RIGHT)
            }; // Insets on primary monitor
        case 'secondary':
            return {
                top: getIntSetting(SETTINGS_INSETS_SECONDARY_TOP),
                bottom: getIntSetting(SETTINGS_INSETS_SECONDARY_BOTTOM),
                left: getIntSetting(SETTINGS_INSETS_SECONDARY_LEFT),
                right: getIntSetting(SETTINGS_INSETS_SECONDARY_RIGHT)
            };
        default:
            throw new Error(`unknown monitor name ${JSON.stringify(tier)}`);
    }
}
function enable() {
    setLoggingEnabled(getBoolSetting(SETTINGS_DEBUG));
    log("Extension enable begin");
    SHELL_VERSION.print_version();
    globalApp.enable();
}
function disable() {
    globalApp.disable();
}
function resetFocusMetaWindow() {
    log("resetFocusMetaWindow");
    focusMetaWindow = null;
}
function reset_window(metaWindow) {
    metaWindow.unmaximize(Meta$2.MaximizeFlags.HORIZONTAL);
    metaWindow.unmaximize(Meta$2.MaximizeFlags.VERTICAL);
    metaWindow.unmaximize(Meta$2.MaximizeFlags.BOTH);
}
function _getInvisibleBorderPadding(metaWindow) {
    let outerRect = metaWindow.get_frame_rect();
    let inputRect = metaWindow.get_buffer_rect();
    let borderX = outerRect.x - inputRect.x;
    let borderY = outerRect.y - inputRect.y;
    return [borderX, borderY];
}
function _getVisibleBorderPadding(metaWindow) {
    let clientRect = metaWindow.get_frame_rect();
    let outerRect = metaWindow.get_frame_rect();
    let borderX = outerRect.width - clientRect.width;
    let borderY = outerRect.height - clientRect.height;
    return [borderX, borderY];
}
function move_maximize_window(metaWindow, x, y) {
    const [borderX, borderY] = _getInvisibleBorderPadding(metaWindow);
    x = x - borderX;
    y = y - borderY;
    metaWindow.move_frame(true, x, y);
    metaWindow.maximize(Meta$2.MaximizeFlags.HORIZONTAL | Meta$2.MaximizeFlags.VERTICAL);
}
/**
 * Resizes window considering margin settings
 * @param metaWindow
 * @param x
 * @param y
 * @param width
 * @param height
 */
function moveResizeWindowWithMargins(metaWindow, x, y, width, height) {
    let [borderX, borderY] = _getInvisibleBorderPadding(metaWindow);
    let [vBorderX, vBorderY] = _getVisibleBorderPadding(metaWindow);
    log("move_resize_window_with_margins " + metaWindow.get_title() + " " + x + ":" + y + " - " + width
        + ":" + height + " margin " + gridSettings[SETTINGS_WINDOW_MARGIN] + " borders invisible " +
        borderX + ":" + borderY + " visible " + vBorderX + ":" + vBorderY);
    x = x + gridSettings[SETTINGS_WINDOW_MARGIN];
    y = y + gridSettings[SETTINGS_WINDOW_MARGIN];
    width = width - gridSettings[SETTINGS_WINDOW_MARGIN] * 2;
    height = height - gridSettings[SETTINGS_WINDOW_MARGIN] * 2;
    x = x + vBorderX;
    y = y + vBorderY;
    width = width - 2 * vBorderX;
    height = height - 2 * vBorderY;
    log("After margins and visible border window is " + x + ":" + y + " - " + width + ":" + height);
    metaWindow.move_frame(true, x, y);
    metaWindow.move_resize_frame(true, x, y, width, height);
}
function getNotFocusedWindowsOfMonitor(monitor) {
    const monitors = activeMonitors();
    let windows = global.get_window_actors().filter(function (w) {
        let app = tracker.get_window_app(w.meta_window);
        if (app == null) {
            return false;
        }
        let appName = app.get_name();
        return !contains(excludedApplications, appName)
            && w.meta_window.get_window_type() == Meta$2.WindowType.NORMAL
            && w.meta_window.get_workspace() == WorkspaceManager$1.get_active_workspace()
            && w.meta_window.showing_on_its_workspace()
            && monitors[w.meta_window.get_monitor()] == monitor
            && focusMetaWindow != w.meta_window;
    });
    return windows;
}
function getMonitorKey(monitor) {
    return monitor.x + ":" + monitor.width + ":" + monitor.y + ":" + monitor.height;
}
function contains(a, obj) {
    var i = a.length;
    while (i--) {
        if (a[i] === obj) {
            return true;
        }
    }
    return false;
}
/**
 * Get focused window by iterating though the windows on the active workspace.
 * @returns {Object} The focussed window object. False if no focussed window was found.
 */
function getFocusApp() {
    if (tracker.focus_app == null) {
        return null;
    }
    let focusedAppName = tracker.focus_app.get_name();
    if (contains(excludedApplications, focusedAppName)) {
        return null;
    }
    return WorkspaceManager$1.get_active_workspace().list_windows().find((window) => window.has_focus()) || null;
}
function getFocusWindow() {
    const focus_app = tracker.focus_app;
    if (!focus_app || excludedApplications[focus_app.get_name()]) {
        return null;
    }
    return WorkspaceManager$1.get_active_workspace().list_windows()
        .find(w => w.has_focus());
}
function activeMonitors() {
    return Main$1.layoutManager.monitors;
}
/**
 * Determine if the given monitor is the primary monitor.
 * @param {Object} monitor The given monitor to evaluate.
 * @returns {boolean} True if the given monitor is the primary monitor.
 * */
function isPrimaryMonitor(monitor) {
    return Main$1.layoutManager.primaryMonitor.x == monitor.x && Main$1.layoutManager.primaryMonitor.y == monitor.y;
}
function getWorkAreaByMonitor(monitor) {
    const monitors = activeMonitors();
    for (let monitor_idx = 0; monitor_idx < monitors.length; monitor_idx++) {
        let mon = monitors[monitor_idx];
        if (mon.x == monitor.x && mon.y == monitor.y) {
            return getWorkArea(monitor, monitor_idx);
        }
    }
    return null;
}
/**
 * @deprecated Use {@link workAreaRectByMonitorIndex} instead.
 */
function getWorkAreaByMonitorIdx(monitor_idx) {
    const monitors = activeMonitors();
    let monitor = monitors[monitor_idx];
    return getWorkArea(monitor, monitor_idx);
}
function workAreaRectByMonitorIndex(monitorIndex) {
    const monitor = activeMonitors()[monitorIndex];
    if (!monitor) {
        return null;
    }
    const waLegacy = getWorkArea(monitor, monitorIndex);
    return (new Rect(new XY(waLegacy.x, waLegacy.y), new Size(waLegacy.width, waLegacy.height)));
}
/**
 * @deprecated Use {@link workAreaRectByMonitorIndex} instead.
 */
function getWorkArea(monitor, monitor_idx) {
    const wkspace = WorkspaceManager$1.get_active_workspace();
    const work_area = wkspace.get_work_area_for_monitor(monitor_idx);
    const insets = getMonitorInsets(getMonitorTier(monitor));
    return {
        x: work_area.x + insets.left,
        y: work_area.y + insets.top,
        width: work_area.width - insets.left - insets.right,
        height: work_area.height - insets.top - insets.bottom
    };
}
function bindKeyControls() {
    if (!keyControlBound) {
        bind(key_bindings_tiling);
        if (focusConnect) {
            global.display.disconnect(focusConnect);
        }
        focusConnect = global.display.connect('notify::focus-window', () => globalApp.onFocus());
        if (!gridSettings[SETTINGS_GLOBAL_PRESETS]) {
            bind(key_bindings_presets);
        }
        keyControlBound = true;
    }
}
function unbindKeyControls() {
    if (keyControlBound) {
        unbind(key_bindings_tiling);
        if (focusConnect) {
            log("Disconnect notify:focus-window");
            global.display.disconnect(focusConnect);
            focusConnect = false;
        }
        if (!gridSettings[SETTINGS_GLOBAL_PRESETS]) {
            unbind(key_bindings_presets);
        }
        if (!gridSettings[SETTINGS_MOVERESIZE_ENABLED]) {
            unbind(keyBindingGlobalResizes);
        }
        keyControlBound = false;
    }
}
function keyCancelTiling() {
    log("Cancel key event");
    globalApp.hideTiling();
}
function keySetTiling() {
    var _a, _b;
    log("keySetTiling");
    if (focusMetaWindow) {
        const monitors = activeMonitors();
        let mind = focusMetaWindow.get_monitor();
        let monitor = monitors[mind];
        let mkey = getMonitorKey(monitor);
        const grid = globalApp.getGrid(monitor);
        log("In grid " + grid);
        (_b = (_a = grid === null || grid === void 0 ? void 0 : grid.elementsDelegate) === null || _a === void 0 ? void 0 : _a.currentElement) === null || _b === void 0 ? void 0 : _b._onButtonPress();
    }
}
function keyChangeTiling() {
    log("keyChangeTiling. Current nbCols " + nbCols + " nbRos " + nbRows);
    const gridSizes = gridSettings[SETTINGS_GRID_SIZES];
    if (gridSizes.length === 0) {
        return;
    }
    const currentIndex = gridSizes.findIndex((size) => size.width === nbCols && size.height === nbRows);
    const newIndex = currentIndex === -1 ? 0 : (currentIndex + 1) % gridSizes.length;
    const newGridSize = gridSizes[newIndex];
    globalApp.setGridSize(newGridSize);
    setInitialSelection();
}
function setInitialSelection() {
    if (!focusMetaWindow) {
        return;
    }
    let mind = focusMetaWindow.get_monitor();
    const monitors = activeMonitors();
    let monitor = monitors[mind];
    let workArea = getWorkArea(monitor, mind);
    let wx = focusMetaWindow.get_frame_rect().x;
    let wy = focusMetaWindow.get_frame_rect().y;
    let wwidth = focusMetaWindow.get_frame_rect().width;
    let wheight = focusMetaWindow.get_frame_rect().height;
    const grid = globalApp.getGrid(monitor);
    if (!grid) {
        log("no grid widget available in setInitialSelection");
        return;
    }
    grid.setInitialSelection(focusMetaWindow);
}
function keyMoveResizeEvent(type, key, is_global = false) {
    var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m, _o, _p;
    if (is_global) {
        focusMetaWindow = getFocusApp();
    }
    log("Got key event " + type + " " + key);
    if (!focusMetaWindow) {
        return;
    }
    log("Going on..");
    let mind = focusMetaWindow.get_monitor();
    const monitors = activeMonitors();
    let monitor = monitors[mind];
    const grid = globalApp.getGrid(monitor);
    if (!grid) {
        return;
    }
    const delegate = grid.elementsDelegate;
    if (!(delegate === null || delegate === void 0 ? void 0 : delegate.currentElement)) {
        log("Key event while no mouse activation - set current and second element");
        setInitialSelection();
    }
    else {
        if (!delegate.first) {
            log("currentElement is there but no first yet");
            delegate.currentElement._onButtonPress();
        }
    }
    if (!delegate) {
        return;
    }
    if (!delegate.currentElement) {
        log("bug: keyMoveResizeEvent currentElement is not set!");
        return;
    }
    const cX = delegate.currentElement.coordx;
    const cY = delegate.currentElement.coordy;
    const fX = (_a = delegate.first) === null || _a === void 0 ? void 0 : _a.coordx;
    const fY = (_b = delegate.first) === null || _b === void 0 ? void 0 : _b.coordy;
    log("Before move/resize first fX " + fX + " fY " + fY + " current cX " + cX + " cY " + cY);
    log("Grid cols " + nbCols + " rows " + nbRows);
    if (type === 'move') {
        if (fX === undefined || fY === undefined) {
            log(`bug: tried to move window without a 'first' selection`);
            return;
        }
        switch (key) {
            case 'right':
                if (fX < nbCols - 1 && cX < nbCols - 1) {
                    delegate.first = grid.getElement(fY, fX + 1);
                    (_c = grid.getElement(cY, cX + 1)) === null || _c === void 0 ? void 0 : _c._onHoverChanged();
                }
                break;
            case 'left':
                if (fX > 0 && cX > 0) {
                    delegate.first = grid.getElement(fY, fX - 1);
                    (_d = grid.getElement(cY, cX - 1)) === null || _d === void 0 ? void 0 : _d._onHoverChanged();
                }
                break;
            case 'up':
                if (fY > 0 && cY > 0) {
                    delegate.first = grid.getElement(fY - 1, fX);
                    (_e = grid.getElement(cY - 1, cX)) === null || _e === void 0 ? void 0 : _e._onHoverChanged();
                }
                break;
            case 'down':
                if (fY < nbRows - 1 && cY < nbRows - 1) {
                    delegate.first = grid.getElement(fY + 1, fX);
                    (_f = grid.getElement(cY + 1, cX)) === null || _f === void 0 ? void 0 : _f._onHoverChanged();
                }
                break;
        }
    }
    else if (type == "resize") {
        switch (key) {
            case 'right':
                if (cX < nbCols - 1) {
                    (_g = grid.getElement(cY, cX + 1)) === null || _g === void 0 ? void 0 : _g._onHoverChanged();
                }
                break;
            case 'left':
                if (cX > 0) {
                    (_h = grid.getElement(cY, cX - 1)) === null || _h === void 0 ? void 0 : _h._onHoverChanged();
                }
                break;
            case 'up':
                if (cY > 0) {
                    (_j = grid.getElement(cY - 1, cX)) === null || _j === void 0 ? void 0 : _j._onHoverChanged();
                }
                break;
            case 'down':
                if (cY < nbRows - 1) {
                    (_k = grid.getElement(cY + 1, cX)) === null || _k === void 0 ? void 0 : _k._onHoverChanged();
                }
                break;
        }
    }
    else if (type == "contract") {
        if (fX === undefined || fY === undefined) {
            log(`bug: tried to contract window without a 'first' selection`);
            return;
        }
        switch (key) {
            case 'left':
                // Contract left edge of current window right one column
                if (cX > fX) {
                    delegate.first = grid.getElement(fY, fX + 1);
                }
                break;
            case 'right':
                // Contract right edge of current window left one column
                if (cX > fX) {
                    (_l = grid.getElement(cY, cX - 1)) === null || _l === void 0 ? void 0 : _l._onHoverChanged();
                }
                break;
            case 'top':
                // Contract top edge of current window down one row
                if (cY > fY) {
                    delegate.first = grid.getElement(fY + 1, fX);
                }
                break;
            case 'bottom':
                // Contract bottom edge of current window up one row
                if (cY > fY) {
                    (_m = grid.getElement(cY - 1, cX)) === null || _m === void 0 ? void 0 : _m._onHoverChanged();
                }
                break;
        }
    }
    else if (type == "expand") {
        if (fX === undefined || fY === undefined) {
            log(`bug: tried to expand window without a 'first' selection`);
            return;
        }
        switch (key) {
            case 'right':
                if (cX < nbCols) {
                    (_o = grid.getElement(cY, cX + 1)) === null || _o === void 0 ? void 0 : _o._onHoverChanged();
                }
                break;
            case 'left':
                if (fX > 0) {
                    delegate.first = grid.getElement(fY, fX - 1);
                }
                break;
            case 'top':
                if (fY > 0) {
                    delegate.first = grid.getElement(fY - 1, fX);
                }
                break;
            case 'bottom':
                if (cY < nbRows - 1) {
                    (_p = grid.getElement(cY + 1, cX)) === null || _p === void 0 ? void 0 : _p._onHoverChanged();
                }
                break;
        }
    }
    if (is_global) {
        keySetTiling();
    }
}
/**
 * Resize window to the given preset.
 * @param  {number}  Identifier of the resize preset (1 - 30)
 */
function presetResize(presetName, settingName) {
    // Check if there's a focusable window
    let window = getFocusApp();
    if (!window) {
        log("No focused window - ignoring keyboard shortcut");
        return;
    }
    // Lets assume window titles are always unique.
    // Note: window roles 'window.get_role()' would offer a unique identifier.
    // Unfortunately role is often set to NULL.
    log("presetResize window title: " + window.get_title());
    // Ensure that the window is not maximized
    reset_window(window);
    // Fetch, parse and validate the given preset.
    // Expected preset format is "XxY x1:y1 x2:y2[,x1:y1 x2:y2]":
    //  - XxY is grid size like 6x8
    //  - x1:y1 is left upper corner tile coordinates in grid tiles, starting from 0
    //  - x2:y2 is right down corner tile coordinates in grid tiles
    //  - a preset can define multiple variants (e.g. "3x2 0:0 0:1,0:0 1:1,0:0 2:1")
    //  - variants can be activated using the same shortcut consecutively
    const presetString = settings.get_string(settingName) || '';
    log("Preset resize " + presetName + "  is " + presetString);
    let tileSpecs = [];
    try {
        tileSpecs = parsePreset(presetString);
    }
    catch (err) {
        log(`Bad preset ${presetName} ${JSON.stringify(presetString)}: ${err}`);
        return;
    }
    if (tileSpecs.length === 0) {
        return;
    }
    // parse the preset string (grid size, left-upper-corner, right-down-corner)
    let gridSize = tileSpecs[0].gridSize;
    // handle preset variants (if there are any)
    let variantCount = tileSpecs.length;
    if (variantCount > 1) {
        if ((lastResizeInfo.lastCallTime.getTime() + gridSettings[SETTINGS_MAX_TIMEOUT]) > new Date().getTime() &&
            lastResizeInfo.presetName === presetName.toString() &&
            lastResizeInfo.windowTitle == window.get_title()) {
            // within timeout (default: 2s), same preset & same window:
            // increase variant counter, but consider upper boundary
            lastResizeInfo.variantIndex = (lastResizeInfo.variantIndex + 1) % variantCount;
        }
        else {
            // timeout, new preset or new window:
            // update presetState.last_preset and reset variant counter
            lastResizeInfo.variantIndex = 0;
        }
    }
    else {
        lastResizeInfo.variantIndex = 0;
    }
    // retrieve current preset variant
    const tileSpec = tileSpecs[lastResizeInfo.variantIndex];
    // do the maths to resize the window
    const workArea = workAreaRectByMonitorIndex(window.get_monitor());
    if (!workArea) {
        log(`Failed to get active work area for window while performing preset ${presetName} ${JSON.stringify(presetString)}`);
        return;
    }
    // The rectangle already incorporates insets, but it doesn't incorporate
    // window margin.
    const zeroMargins = tileSpec.isFullscreen() && !getBoolSetting(SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED);
    const marginSize = new Size(zeroMargins ? 0 : gridSettings[SETTINGS_WINDOW_MARGIN], zeroMargins ? 0 : gridSettings[SETTINGS_WINDOW_MARGIN]);
    const rect = tileSpec.toFrameRect(workArea).inset(marginSize);
    moveWindowToRect(window, rect);
    lastResizeInfo.presetName = presetName.toString();
    lastResizeInfo.windowTitle = window.get_title();
    lastResizeInfo.lastCallTime = new Date();
}
// Move the window to the next monitor.
function moveWindowToNextMonitor() {
    log("moveWindowToNextMonitor");
    let window = getFocusWindow();
    if (!window) {
        log("No focused window - ignoring keyboard shortcut to move window");
        return;
    }
    reset_window(window);
    const numMonitors = activeMonitors().length;
    if (numMonitors == 0) {
        return;
    }
    const ts = parsePreset("5x5 1:1 3:3")[0];
    const srcMonitorIndex = window.get_monitor();
    const dstMonitorIndex = (srcMonitorIndex + 1) % numMonitors;
    const workArea = workAreaRectByMonitorIndex(dstMonitorIndex);
    if (!workArea) {
        log(`Failed to get active work area for window while moving it to the next monitor.`);
        return;
    }
    const rect = ts.toFrameRect(workArea);
    moveWindowToRect(window, rect);
}
/**
 * Moves a window to the specified region. This may resize the window as well as
 * move its origin.
 */
function moveWindowToRect(window, rect) {
    // The move_frame line is a workaround for a bug affecting gnome terminal
    // windows. See https://github.com/gTile/gTile/issues/176#issue-751198339.
    window.move_frame(true, rect.origin.x, rect.origin.y);
    window.move_resize_frame(true, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}
/*****************************************************************
  PROTOTYPES
 *****************************************************************/
class TopBar {
    constructor(_title) {
        this._title = _title;
        this.actor = new St.BoxLayout({ style_class: 'top-box' });
        this._stlabel = new St.Label({ style_class: 'grid-title', text: this._title });
        this._closebutton = new St.Button({ style_class: 'close-button' });
        this._closebutton.add_style_class_name('close-button-container');
        this._connect_id = this._closebutton.connect('button-press-event', Lang.bind(this, this._onButtonPress));
        this.actor.add_child(this._closebutton);
        this.actor.add_child(this._stlabel);
    }
    setTitle(title) {
        this._title = title;
        this._stlabel.text = this._title;
    }
    setApp(app, title) {
        this._title = app.get_name() + " - " + title;
        log("title: " + this._title);
        this._stlabel.text = this._title;
    }
    _onButtonPress() {
        globalApp.hideTiling();
    }
    destroy() {
        this._closebutton.disconnect(this._connect_id);
    }
}
class ToggleSettingsButtonListener {
    constructor() {
        this.actors = [];
    }
    addActor(actor) {
        log("ToggleSettingsButtonListener Connect update-toggle");
        actor.connect('update-toggle', Lang.bind(this, this._updateToggle));
        this.actors.push(actor);
    }
    _updateToggle() {
        log("ToggleSettingsButtonListener _updateToggle");
        for (let actor of this.actors) {
            actor._update();
        }
    }
}
function ToggleSettingsButton(text, property) {
    this._init(text, property);
}
ToggleSettingsButton.prototype = {
    _init: function (text, property) {
        this.text = text;
        this.actor = new St.Button({
            style_class: 'settings-button',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        this.label = new St.Label({ style_class: 'settings-label', reactive: true, can_focus: true, track_hover: true, text: this.text });
        this.icon = new St.BoxLayout({ style_class: this.text + "-icon", reactive: true, can_focus: true, track_hover: true });
        this.actor.add_actor(this.icon);
        this.property = property;
        this._update();
        log("ToggleSettingsButton Connect button-press-event");
        this.actor.connect('button-press-event', Lang.bind(this, this._onButtonPress));
        log("ToggleSettingsButton Connect update-toggle");
        this.connect('update-toggle', Lang.bind(this, this._update));
    },
    _update: function () {
        log("ToggleSettingsButton _update event " + this.property);
        if (gridSettings[this.property]) {
            this.actor.add_style_pseudo_class('activate');
        }
        else {
            this.actor.remove_style_pseudo_class('activate');
        }
    },
    _onButtonPress: function () {
        gridSettings[this.property] = !gridSettings[this.property];
        log("ToggleSettingsButton _onButtonPress " + this.property + ": " + gridSettings[this.property] + ", emitting signal update-toggle");
        this.emit('update-toggle');
    }
};
Signals.addSignalMethods(ToggleSettingsButton.prototype);
class ActionButton {
    constructor(grid, classname) {
        this.grid = grid;
        this.grid = grid;
        this.actor = new St.Button({
            style_class: 'settings-button',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        this.icon = new St.BoxLayout({ style_class: classname, reactive: true, can_focus: true, track_hover: true });
        this.actor.add_actor(this.icon);
        log("ActionButton Connect button-press-event");
        this.actor.connect('button-press-event', Lang.bind(this, this._onButtonPress));
    }
    _onButtonPress() {
        log("ActionButton _onButtonPress Emitting signal button-press-event");
        this.emit('button-press-event');
    }
    /** Functions replaced by Signals.addSignalMethods. */
    connect(eventName, handler) { return 0; }
    disconnect(id) { }
    emit(name, ...args) { }
}
Signals.addSignalMethods(ActionButton.prototype);
const AUTO_TILE_MAIN_AND_LIST_CLASS_NAME = "action-main-list";
class AutoTileMainAndList extends ActionButton {
    constructor(grid) {
        super(grid, AUTO_TILE_MAIN_AND_LIST_CLASS_NAME);
        this.classname = AUTO_TILE_MAIN_AND_LIST_CLASS_NAME;
        log("AutoTileMainAndList connect button-press-event");
        this.connect('button-press-event', () => this._onButtonPress());
    }
    _onButtonPress() {
        AutoTileMain();
        log("AutoTileMainAndList _onButtonPress Emitting signal resize-done");
        this.emit('resize-done');
    }
}
Signals.addSignalMethods(AutoTileMainAndList.prototype);
function AutoTileMain() {
    let preset = "AutoTileMain";
    log("AutoTileMain");
    let window = getFocusApp();
    if (!window) {
        log("No focused window - ignoring keyboard shortcut AutoTileMain");
        return;
    }
    reset_window(window);
    let mind = window.get_monitor();
    let work_area = getWorkAreaByMonitorIdx(mind);
    const monitors = activeMonitors();
    let monitor = monitors[mind];
    let workArea = getWorkAreaByMonitor(monitor);
    let notFocusedwindows = getNotFocusedWindowsOfMonitor(monitor);
    if (Object.keys(notFocusedwindows).length === 0) {
        moveResizeWindowWithMargins(focusMetaWindow, workArea.x, workArea.y, workArea.width, workArea.height);
        return;
    }
    log("SETTINGS_MAIN_WINDOW_SIZES:" + mainWindowSizes);
    let ps_variants = mainWindowSizes;
    log("Main window sizes: " + ps_variants);
    // handle preset variants (if there are any)
    let variantCount = ps_variants.length;
    if (variantCount > 1) {
        if ((lastResizeInfo.lastCallTime.getTime() + gridSettings[SETTINGS_MAX_TIMEOUT]) > new Date().getTime() &&
            lastResizeInfo.presetName === preset.toString() &&
            lastResizeInfo.windowTitle == window.get_title()) {
            // within timeout (default: 2s), same preset & same window:
            // increase variant counter, but consider upper boundary
            lastResizeInfo.variantIndex = (lastResizeInfo.variantIndex + 1) % variantCount;
        }
        else {
            // timeout, new preset or new window:
            // update presetState.last_preset and reset variant counter
            lastResizeInfo.variantIndex = 0;
        }
    }
    else {
        lastResizeInfo.variantIndex = 0;
    }
    let mainRatio = ps_variants[lastResizeInfo.variantIndex];
    let mainWidth = workArea.width * mainRatio;
    let minorWidth = workArea.width - mainWidth;
    moveResizeWindowWithMargins(focusMetaWindow, workArea.x, workArea.y, mainWidth, workArea.height);
    let winHeight = workArea.height / notFocusedwindows.length;
    let countWin = 0;
    log("AutoTileMain MonitorHeight: " + monitor.height + ":" + notFocusedwindows.length);
    for (let windowIdx in notFocusedwindows) {
        let metaWindow = notFocusedwindows[windowIdx].meta_window;
        let newOffset = workArea.y + (countWin * winHeight);
        reset_window(metaWindow);
        moveResizeWindowWithMargins(metaWindow, workArea.x + mainWidth, newOffset, minorWidth, winHeight);
        countWin++;
    }
    log("AutoTileMain done");
    lastResizeInfo.presetName = preset;
    lastResizeInfo.windowTitle = window.get_title();
    lastResizeInfo.lastCallTime = new Date();
    log("Resize preset last call: " + lastResizeInfo.lastCallTime);
}
class AutoTileTwoList extends ActionButton {
    constructor(grid) {
        super(grid, "action-two-list");
        this.classname = "action-two-list";
        log("AutoTileTwoList connect button-press-event");
        this.connect('button-press-event', () => this._onButtonPress());
    }
    _onButtonPress() {
        log("AutotileTwoList");
        autoTileNCols(2);
        log("AutoTileTwoList _onButtonPress Emitting signal resize-done");
        this.emit('resize-done');
        log("Autotile2 done");
    }
}
Signals.addSignalMethods(AutoTileTwoList.prototype);
function autoTileNCols(cols) {
    log("AutoTileNCols " + cols);
    let window = getFocusApp();
    if (!window) {
        log("No focused window - ignoring keyboard shortcut AutoTileNCols");
        return;
    }
    reset_window(window);
    let mind = window.get_monitor();
    let work_area = getWorkAreaByMonitorIdx(mind);
    const monitors = activeMonitors();
    let monitor = monitors[mind];
    let workArea = getWorkAreaByMonitor(monitor);
    if (!workArea) {
        return;
    }
    let windows = getNotFocusedWindowsOfMonitor(monitor);
    let nbWindowOnEachSide = Math.ceil((windows.length + 1) / cols);
    let winHeight = workArea.height / nbWindowOnEachSide;
    let countWin = 0;
    moveResizeWindowWithMargins(window, workArea.x + countWin % cols * workArea.width / cols, workArea.y + (Math.floor(countWin / cols) * winHeight), workArea.width / cols, winHeight);
    countWin++;
    // todo make function
    for (let windowIdx in windows) {
        let metaWindow = windows[windowIdx].meta_window;
        reset_window(metaWindow);
        moveResizeWindowWithMargins(metaWindow, workArea.x + countWin % cols * workArea.width / cols, workArea.y + (Math.floor(countWin / cols) * winHeight), workArea.width / cols, winHeight);
        countWin++;
    }
    log("AutoTileNCols done");
}
function snapToNeighborsBind() {
    log("SnapToNeighbors keybind invoked");
    let window = getFocusApp();
    if (!window) {
        log("No focused window - ignoring keyboard shortcut SnapToNeighbors");
        return;
    }
    snapToNeighbors(window);
}
/**
 * GridSettingsButton is a GUI button that displays text like "8x8" and changes
 * the main grid size used for GUI elements and some presets.
 */
class GridSettingsButton {
    constructor(gridSize) {
        this.text = gridSize.toString();
        this.cols = gridSize.width;
        this.rows = gridSize.height;
        this.actor = new St.Button({
            style_class: 'settings-button',
            reactive: true,
            can_focus: true,
            track_hover: true,
            label: this.text,
        });
        this.actor.connect('button-press-event', () => this._onButtonPress());
    }
    _onButtonPress() {
        nbCols = this.cols;
        nbRows = this.rows;
        globalApp.refreshGrids();
    }
}
const GRID_WIDGET_BORDER_SIZE = 1;
class Grid {
    constructor(gridWidget, monitor_idx, monitor, title, cols, rows) {
        this.gridWidget = gridWidget;
        this.tableWidth = 320;
        this.borderwidth = 2;
        this.elements = [];
        let workArea = getWorkArea(monitor, monitor_idx);
        this.tableHeight = (this.tableWidth / workArea.width) * workArea.height;
        this.actor = new St.BoxLayout({
            vertical: true,
            style_class: 'grid-panel',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        log(`created actor for monitor ${monitor_idx}: ${this.actor} with cols=${cols}, rows=${rows}`);
        log("Grid connect enter-event leave-envent BEGIN");
        // TODO: disconnect these events on teardown.
        this.actor.connect('enter-event', () => this._onMouseEnter());
        this.actor.connect('leave-event', () => this._onMouseLeave());
        log("Grid connect enter-event leave-envent FINISH");
        this.animation_time = gridSettings[SETTINGS_ANIMATION] ? 0.3 : 0;
        this.topbar = new TopBar(title);
        this.bottombarContainer = new St.Bin({
            style_class: 'bottom-box-container',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        this.bottomBarTableLayout = new Clutter.GridLayout();
        this.bottombar = new St.Widget({
            style_class: 'bottom-box',
            can_focus: true,
            track_hover: true,
            reactive: true,
            width: this.tableWidth - 20,
            height: 36,
            layout_manager: this.bottomBarTableLayout
        });
        this.bottomBarTableLayout.set_row_homogeneous(true);
        this.bottomBarTableLayout.set_column_homogeneous(true);
        this.bottombarContainer.add_actor(this.bottombar);
        this.veryBottomBarContainer = new St.Bin({
            style_class: 'very-bottom-box-container',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        this.veryBottomBarTableLayout = new Clutter.GridLayout();
        this.veryBottomBar = new St.Widget({
            style_class: 'very-bottom-box',
            can_focus: true,
            track_hover: true,
            reactive: true,
            width: this.tableWidth - 20,
            height: 36,
            layout_manager: this.veryBottomBarTableLayout,
        });
        this.bottomBarTableLayout.set_row_homogeneous(true);
        this.veryBottomBarTableLayout.set_column_homogeneous(true);
        this.veryBottomBarContainer.add_actor(this.veryBottomBar);
        let rowNum = 0;
        let colNum = 0;
        let maxPerRow = 4;
        for (let gridSize of gridSettings[SETTINGS_GRID_SIZES]) {
            if (colNum >= maxPerRow) {
                colNum = 0;
                rowNum += 1;
            }
            const button = new GridSettingsButton(gridSize);
            this.bottomBarTableLayout.attach(button.actor, colNum, rowNum, 1, 1);
            button.actor.connect('notify::hover', () => this._onSettingsButton());
            colNum++;
        }
        this.bottombar.height *= (rowNum + 1);
        this.tableContainer = new St.Bin({
            style_class: 'table-container',
            reactive: true,
            can_focus: true,
            track_hover: true
        });
        this.tableLayoutManager = new Clutter.GridLayout();
        this.table = new St.Widget({
            style_class: 'table',
            can_focus: true,
            track_hover: true,
            reactive: true,
            height: this.tableHeight,
            width: this.tableWidth - GRID_WIDGET_BORDER_SIZE * 2,
            layout_manager: this.tableLayoutManager,
        });
        this.tableLayoutManager.set_row_homogeneous(true);
        this.tableLayoutManager.set_column_homogeneous(true);
        this.tableContainer.add_actor(this.table);
        this.actor.add_child(this.topbar.actor);
        this.actor.add_child(this.tableContainer);
        this.actor.add_child(this.bottombarContainer);
        this.actor.add_child(this.veryBottomBarContainer);
        this.monitor = monitor;
        this.monitor_idx = monitor_idx;
        this.rows = rows;
        this.title = title;
        this.cols = cols;
        this.isEntered = false;
        const toggleSettingListener = new ToggleSettingsButtonListener();
        let toggle = new ToggleSettingsButton("animation", SETTINGS_ANIMATION);
        this.veryBottomBarTableLayout.attach(toggle.actor, 0, 0, 1, 1);
        toggleSettingListener.addActor(toggle);
        toggle = new ToggleSettingsButton("auto-close", SETTINGS_AUTO_CLOSE);
        this.veryBottomBarTableLayout.attach(toggle.actor, 1, 0, 1, 1);
        toggleSettingListener.addActor(toggle);
        let action = new AutoTileMainAndList(this);
        this.veryBottomBarTableLayout.attach(action.actor, 2, 0, 1, 1);
        action.connect('resize-done', Lang.bind(this, this._onResize));
        action = new AutoTileTwoList(this);
        this.veryBottomBarTableLayout.attach(action.actor, 3, 0, 1, 1);
        action.connect('resize-done', Lang.bind(this, this._onResize));
        this.x = 0;
        this.y = 0;
        this.interceptHide = false;
        this._displayElements();
        this.normalScaleY = this.actor.scale_y;
        this.normalScaleX = this.actor.scale_x;
    }
    state() {
        return `grid with actor ${this.actor}`;
    }
    _displayElements() {
        if (this.monitor === null) {
            return;
        }
        log("Grid _displayElements " + this.cols + ":" + this.rows);
        this.elements = new Array();
        let width = (this.tableWidth / this.cols); // - 2*this.borderwidth;
        let height = (this.tableHeight / this.rows); // - 2*this.borderwidth;
        const delegate = new GridElementDelegate(this, this.gridWidget);
        this.elementsDelegate = delegate;
        this.elementsDelegate.connect('resize-done', (actor, event) => this._onResize());
        for (let r = 0; r < this.rows; r++) {
            for (let c = 0; c < this.cols; c++) {
                if (c == 0) {
                    this.elements[r] = new Array();
                }
                const element = new GridElement(this.elementsDelegate, this.monitor, width, height, c, r);
                this.elements[r][c] = element;
                this.tableLayoutManager.attach(element.actor, c, r, 1, 1);
                element.show();
            }
        }
    }
    getElement(row, col) {
        return this.elements[row][col] || null;
    }
    forceGridElementDelegate(x, y, w, h) {
        var _a;
        (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a.forceArea(this.elements[y][x], this.elements[h][w]);
    }
    refresh() {
        log("Grid.refresh from " + this.cols + ":" + this.rows + " to " + nbCols + ":" + nbRows);
        this.elementsDelegate._resetGrid();
        for (let r = 0; r < this.rows; r++) {
            for (let c = 0; c < this.cols; c++) {
                this.elements[r][c]._disconnect();
            }
        }
        this.table.destroy_all_children();
        this.cols = nbCols;
        this.rows = nbRows;
        this._displayElements();
    }
    set_position(x, y) {
        this.x = x;
        this.y = y;
        this.actor.set_position(x, y);
    }
    show() {
        this.interceptHide = true;
        this.elementsDelegate.reset();
        let time = (gridSettings[SETTINGS_ANIMATION]) ? 0.3 : 0;
        Main$1.uiGroup.set_child_above_sibling(this.actor, null);
        Main$1.layoutManager.removeChrome(this.actor);
        Main$1.layoutManager.addChrome(this.actor);
        //this.actor.y = 0 ;
        if (time > 0) {
            this.actor.scale_y = 0;
            this.actor.scale_x = 0;
            this.actor.ease({
                time: this.animation_time,
                opacity: 255,
                visible: true,
                transition: Clutter.AnimationMode.EASE_OUT_QUAD,
                scale_x: this.normalScaleX,
                scale_y: this.normalScaleY,
                onComplete: this._onShowComplete
            });
        }
        else {
            this.actor.scale_x = this.normalScaleX;
            this.actor.scale_y = this.normalScaleY;
            this.actor.opacity = 255;
            this.actor.visible = true;
        }
        this.interceptHide = false;
    }
    hide(immediate) {
        var _a;
        log(`Grid hide immediate=${immediate}`);
        (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
        let time = (gridSettings[SETTINGS_ANIMATION]) ? 0.3 : 0;
        if (!immediate && time > 0) {
            this.actor.ease({
                time: this.animation_time,
                opacity: 0,
                visible: false,
                scale_x: 0,
                scale_y: 0,
                transition: Clutter.AnimationMode.EASE_OUT_QUAD,
                onComplete: this._onHideComplete
            });
        }
        else {
            this.actor.opacity = 0;
            this.actor.visible = false;
            //this.actor.y = 0;
            this.actor.scale_x = 0;
            this.actor.scale_y = 0;
        }
    }
    setInitialSelection(focusMetaWindow) {
        var _a, _b, _c, _d;
        // The window being focused is part of the monitor that this Grid is
        // responsible for manipulating.
        if (focusMetaWindow.get_monitor() !== this.monitor_idx) {
            return;
        }
        if (!this.monitor) {
            return;
        }
        const monitor = this.monitor;
        const workArea = getWorkArea(this.monitor, this.monitor_idx);
        let wx = focusMetaWindow.get_frame_rect().x;
        let wy = focusMetaWindow.get_frame_rect().y;
        let wwidth = focusMetaWindow.get_frame_rect().width;
        let wheight = focusMetaWindow.get_frame_rect().height;
        const grid = this;
        const delegate = grid.elementsDelegate;
        log("Set initial selection");
        log("Focus window position x " + wx + " y " + wy + " width " + wwidth + " height " + wheight);
        log("Focus monitor position x " + monitor.x + " y " + monitor.y + " width " + monitor.width + " height " + monitor.height);
        log("Workarea position x " + workArea.x + " y " + workArea.y + " width " + workArea.width + " height " + workArea.height);
        let wax = Math.max(wx - workArea.x, 0);
        let way = Math.max(wy - workArea.y, 0);
        let grid_element_width = workArea.width / nbCols;
        let grid_element_height = workArea.height / nbRows;
        log("width " + grid_element_width + " height " + grid_element_height);
        let lux = Math.min(Math.max(Math.round(wax / grid_element_width), 0), nbCols - 1);
        log("wx " + (wx - workArea.x) + " el_width " + grid_element_width + " max " + (nbCols - 1) + " res " + lux);
        let luy = Math.min(Math.max(Math.round(way / grid_element_height), 0), grid.rows - 1);
        log("wy " + (wy - workArea.y) + " el_height " + grid_element_height + " max " + (nbRows - 1) + " res " + luy);
        let rdx = Math.min(Math.max(Math.round((wax + wwidth) / grid_element_width) - 1, lux), grid.cols - 1);
        log("wx + wwidth " + (wx + wwidth - workArea.x - 1) + " el_width " + grid_element_width + " max " + (nbCols - 1) + " res " + rdx);
        let rdy = Math.min(Math.max(Math.round((way + wheight) / grid_element_height) - 1, luy), grid.rows - 1);
        log("wy + wheight " + (wy + wheight - workArea.y - 1) + " el_height " + grid_element_height + " max " + (nbRows - 1) + " res " + rdy);
        log("Initial tile selection is " + lux + ":" + luy + " - " + rdx + ":" + rdy);
        grid.forceGridElementDelegate(lux, luy, rdx, rdy);
        grid.elements[luy][lux]._onButtonPress();
        grid.elements[rdy][rdx]._onHoverChanged();
        const cX = (_a = delegate === null || delegate === void 0 ? void 0 : delegate.currentElement) === null || _a === void 0 ? void 0 : _a.coordx;
        const cY = (_b = delegate === null || delegate === void 0 ? void 0 : delegate.currentElement) === null || _b === void 0 ? void 0 : _b.coordy;
        const fX = (_c = delegate === null || delegate === void 0 ? void 0 : delegate.first) === null || _c === void 0 ? void 0 : _c.coordx;
        const fY = (_d = delegate === null || delegate === void 0 ? void 0 : delegate.first) === null || _d === void 0 ? void 0 : _d.coordy;
        log("After initial selection first fX " + fX + " fY " + fY + " current cX " + cX + " cY " + cY);
    }
    _onHideComplete() {
    }
    _onShowComplete() {
    }
    _onResize() {
        log("resize-done");
        globalApp.updateRegions();
        if (gridSettings[SETTINGS_AUTO_CLOSE]) {
            log("Emitting hide-tiling");
            this.emit('hide-tiling');
        }
    }
    _onMouseEnter() {
        var _a;
        log("Grid: onMouseEnter");
        if (!this.isEntered) {
            (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
            this.isEntered = true;
        }
    }
    _onMouseLeave() {
        var _a;
        log("Grid: onMouseLeave");
        let [x, y, mask] = global.get_pointer();
        if (this.elementsDelegate && (x <= this.actor.x || x >= (this.actor.x + this.actor.width)) || (y <= this.actor.y || y >= (this.actor.y + this.actor.height))) {
            this.isEntered = false;
            (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
            globalApp.refreshGrids();
        }
    }
    _onSettingsButton() {
        var _a;
        log("_onSettingsButton");
        (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a.reset();
    }
    _destroy() {
        var _a;
        log("Grid _destroy");
        for (let r in this.elements) {
            for (let c in this.elements[r]) {
                this.elements[r][c]._destroy();
            }
        }
        (_a = this.elementsDelegate) === null || _a === void 0 ? void 0 : _a._destroy();
        this.topbar.destroy();
        this.monitor = null;
        this.rows = 0;
        this.title = "";
        this.cols = 0;
        log("Disconnect hide-tiling");
        this.disconnect(this.connectHideTiling);
    }
    // Methods replaced by Signals.addSignalMethods.
    connect(name, callback) { return -1; }
    disconnect(id) { }
    emit(name, ...args) { }
}
Signals.addSignalMethods(Grid.prototype);
class GridElementDelegate {
    constructor(grid, gridWidget) {
        this.grid = grid;
        this.gridWidget = gridWidget;
        // The first element clicked in the rectangular selection.
        this.first = null;
        // 
        this.currentElement = null;
        // Elements that are in a highlighted state in the UI. The highlighting
        // happens when the grid rectangle selcted includes a particular grid
        // element.
        this.activatedElements = [];
        this.activated = false;
    }
    allSelected() {
        return (this.activatedElements.length === (nbCols * nbRows));
    }
    onButtonPress(gridElement) {
        log("GridElementDelegate _onButtonPress " + gridElement.coordx + ":" + gridElement.coordy);
        //this._logActiveActors("GridElementDelegate _onButtonPress active actors");
        if (!this.currentElement) {
            this.currentElement = gridElement;
        }
        if (!this.activated) {
            log("GridElementDelegate first activation");
            this.activated = true;
            gridElement.active = true;
            this.activatedElements = [gridElement];
            this.first = gridElement;
            return;
        }
        log("GridElementDelegate resize");
        //Check this.activatedActors if equals to nbCols * nbRows
        //before doing anything with the window it must be unmaximized
        //if so move the window then maximize instead of change size
        //if not move the window and change size
        if (!focusMetaWindow) {
            return;
        }
        reset_window(focusMetaWindow);
        if (this.first) {
            const computedSize = this._computeAreaPositionSize(this.first, gridElement);
            if (!computedSize) {
                return;
            }
            const [areaX, areaY, areaWidth, areaHeight] = computedSize;
            if (this.allSelected() && gridSettings[SETTINGS_WINDOW_MARGIN_FULLSCREEN_ENABLED] === false) {
                move_maximize_window(focusMetaWindow, areaX, areaY);
            }
            else {
                moveResizeWindowWithMargins(focusMetaWindow, areaX, areaY, areaWidth, areaHeight);
            }
        }
        this._resizeDone();
    }
    _resizeDone() {
        log("resizeDone, emitting signal resize-done");
        this.emit('resize-done');
    }
    reset() {
        this._resetGrid();
        this.activated = false;
        this.first = null;
        this.currentElement = null;
    }
    _resetGrid() {
        this._hideArea();
        if (this.currentElement) {
            this.currentElement._deactivate();
        }
        for (let act of this.activatedElements) {
            act._deactivate();
        }
        this.activatedElements = new Array();
    }
    _getVarFromGridElement(fromGridElement, toGridElement) {
        let minX = Math.min(fromGridElement.coordx, toGridElement.coordx);
        let maxX = Math.max(fromGridElement.coordx, toGridElement.coordx);
        let minY = Math.min(fromGridElement.coordy, toGridElement.coordy);
        let maxY = Math.max(fromGridElement.coordy, toGridElement.coordy);
        return [minX, maxX, minY, maxY];
    }
    refreshGrid(fromGridElement, toGridElement) {
        this._resetGrid();
        let [minX, maxX, minY, maxY] = this._getVarFromGridElement(fromGridElement, toGridElement);
        if (!fromGridElement.monitor) {
            return;
        }
        for (let r = minY; r <= maxY; r++) {
            for (let c = minX; c <= maxX; c++) {
                const highlightedElement = this.grid.getElement(r, c);
                if (!highlightedElement) {
                    log(`bug: GridElementDelegate refreshGrid is out of sync with Grid: trying to highlight element (row=${r}, col=${c}) and getElement() returned null.`);
                    continue;
                }
                highlightedElement._activate();
                this.activatedElements.push(highlightedElement);
            }
        }
        this._displayArea(fromGridElement, toGridElement);
    }
    _computeAreaPositionSize(fromGridElement, toGridElement) {
        let [minX, maxX, minY, maxY] = this._getVarFromGridElement(fromGridElement, toGridElement);
        let monitor = fromGridElement.monitor;
        const workArea = getWorkAreaByMonitor(monitor);
        if (!workArea) {
            return null;
        }
        let areaWidth = Math.round((workArea.width / nbCols) * ((maxX - minX) + 1));
        let areaHeight = Math.round((workArea.height / nbRows) * ((maxY - minY) + 1));
        let areaX = workArea.x + Math.round((minX * (workArea.width / nbCols)));
        let areaY = workArea.y + Math.round((minY * (workArea.height / nbRows)));
        return [areaX, areaY, areaWidth, areaHeight];
    }
    forceArea(fromGridElement, toGridElement) {
        const computedSize = this._computeAreaPositionSize(fromGridElement, toGridElement);
        if (!computedSize) {
            return;
        }
        const [areaX, areaY, areaWidth, areaHeight] = computedSize;
        this.gridWidget.width = areaWidth;
        this.gridWidget.height = areaHeight;
        this.gridWidget.x = areaX;
        this.gridWidget.y = areaY;
    }
    _displayArea(fromGridElement, toGridElement) {
        const computedSize = this._computeAreaPositionSize(fromGridElement, toGridElement);
        if (!computedSize) {
            return;
        }
        const [areaX, areaY, areaWidth, areaHeight] = computedSize;
        this.gridWidget.add_style_pseudo_class('activate');
        if (gridSettings[SETTINGS_ANIMATION]) {
            this.gridWidget.ease({
                time: 0.2,
                x: areaX,
                y: areaY,
                width: areaWidth,
                height: areaHeight,
                transition: Clutter.AnimationMode.EASE_OUT_QUAD
            });
        }
        else {
            this.gridWidget.width = areaWidth;
            this.gridWidget.height = areaHeight;
            this.gridWidget.x = areaX;
            this.gridWidget.y = areaY;
        }
    }
    _hideArea() {
        this.gridWidget.remove_style_pseudo_class('activate');
    }
    _onHoverChanged(gridElement) {
        log("GridElementDelegate _onHoverChange " + gridElement.coordx + ":" + gridElement.coordy);
        if (this.activated) {
            log("GridElementDelegate _onHoverChange/not active: " + gridElement.coordx + ":" + gridElement.coordy);
            this.refreshGrid(this.first, gridElement);
            this.currentElement = gridElement;
        }
        else if (!this.currentElement || gridElement.id != this.currentElement.id) {
            log("GridElementDelegate _onHoverChange/active: " + gridElement.coordx + ":" + gridElement.coordy);
            if (this.currentElement) {
                this.currentElement._deactivate();
            }
            this.currentElement = gridElement;
            this.currentElement._activate();
            this._displayArea(gridElement, gridElement);
        }
        else {
            log("GridElementDelegate _onHoverChange/else: " + gridElement.coordx + ":" + gridElement.coordy);
        }
    }
    _destroy() {
        this.activated = false;
        this.first = null;
        this.currentElement = null;
        this.activatedElements = [];
    }
    // Methods replaced by Signals.addSignalMethods.
    connect(name, callback) { return -1; }
    disconnect(id) { }
    emit(name, ...args) { }
}
Signals.addSignalMethods(GridElementDelegate.prototype);
class GridElement {
    constructor(delegate, monitor, width, height, coordx, coordy) {
        this.delegate = delegate;
        this.monitor = monitor;
        this.width = width;
        this.height = height;
        this.coordx = coordx;
        this.coordy = coordy;
        this.actor = new St.Button({ style_class: 'table-element', reactive: true, can_focus: true, track_hover: true });
        this.actor.visible = false;
        this.actor.opacity = 0;
        this.id = getMonitorKey(monitor) + "-" + coordx + ":" + coordy;
        this.actor.connect('button-press-event', Lang.bind(this, this._onButtonPress));
        this.hoverConnect = this.actor.connect('notify::hover', () => this._onHoverChanged());
        this.active = false;
    }
    state() {
        return `id: ${this.id}; visible: ${this.actor.visible}`;
    }
    show() {
        this.actor.opacity = 255;
        this.actor.visible = true;
    }
    hide() {
        this.actor.opacity = 0;
        this.actor.visible = false;
    }
    _onButtonPress() {
        this.delegate.onButtonPress(this);
    }
    _onHoverChanged() {
        this.delegate._onHoverChanged(this);
    }
    _activate() {
        if (!this.active) {
            this.actor.add_style_pseudo_class('activate');
            this.active = true;
        }
    }
    _deactivate() {
        if (this.active) {
            this.actor.remove_style_pseudo_class('activate');
            this.active = false;
        }
    }
    // This logic should probably go into disable().
    // _clean() {
    //     Main.uiGroup.remove_actor(this.gridWidget);
    // }
    _disconnect() {
        this.actor.disconnect(this.hoverConnect);
    }
    _destroy() {
        this.active = false;
    }
}

registerExtension(function () { }, enable, disable);
