/*
	New Mail Indicator extension (for GNOME 3.36+)
	Copyright 2021 Francois Thirioux
	GitHub contributors: @fthx
	License: GPL v3
*/

const { GLib, GObject, Shell, St } = imports.gi;
const Main = imports.ui.main;
const MessageTray = Main.messageTray;
const PanelMenu = imports.ui.panelMenu;
const ByteArray = imports.byteArray;

// new mail indicator color (default Yaru orange: #E95420; GNOME blue: #3584E4)
var NEW_MAIL_ICON_COLOR = '#E95420';


var MailIndicator = GObject.registerClass(
class MailIndicator extends PanelMenu.Button {
    _init() {
    	super._init(0.0, 'New Mail Indicator');

    	this._find_default_client();

        this.button = new St.Bin({visible: true, reactive: true, can_focus: true, track_hover: true});        
        this.icon = new St.Icon({icon_name: 'mail-read-symbolic', style_class: 'system-status-icon'});
		this.new_mail = false;
        this.button.set_child(this.icon);

		if (this.app) {
		    this.source_added = MessageTray.connect('source-added', this._on_source_added.bind(this));
		    this.source_removed = MessageTray.connect('source-removed', this._on_source_removed.bind(this));
		    this.button_pressed = this.button.connect('button-release-event', this._toggle_default_mail_app.bind(this));
        }

        this.add_child(this.button);  
    }
    
    // get the default email client
    _find_default_client() {
    	this.app_filename = ByteArray.toString(GLib.spawn_command_line_sync("xdg-mime query default x-scheme-handler/mailto")[1]).slice(0,-1);
		this.app = Shell.AppSystem.get_default().lookup_app(this.app_filename);
		if (this.app) {
			this.app_name = this.app.get_name();
		} else {
			Main.notify("New Mail Indicator: error, no email client found");
		}
	}
	
	// color mail icon related notification
    _on_source_added(tray, source) {
        if (source && source.title && source.title == this.app_name) {
			this.new_mail = true;
        	this.icon.icon_name = 'mail-unread-symbolic';
        	this.button.set_style('color: ' + NEW_MAIL_ICON_COLOR + ';');
        }
    }

	// un-color mail icon if related source removed
    _on_source_removed(tray, source) {
        if (source && source.title && source.title == this.app_name) {
			this.new_mail = false;
        	this.icon.icon_name = 'mail-read-symbolic';
        	this.button.set_style('color: ;');
        }
    }

    // start default mail app or activate its window or minimize its window
    _toggle_default_mail_app() {
    	this.app_window = this.app.get_windows()[0];
    	if (this.app_window) {
			if (this.app_window.has_focus() && !this.new_mail) {
				this.app_window.minimize();
			} else {
				this.app_window.unminimize();
				this.app_window.activate(global.get_current_time());
			}
		} else {
			this.app.activate();
		}
    }
 
    _destroy() {
		if (this.source_added) {
			MessageTray.disconnect(this.source_added);
		}
		if (this.source_removed) {
			MessageTray.disconnect(this.source_removed);
		}
		if (this.button_pressed) {
			this.button.disconnect(this.button_pressed);
		}
        this.button.destroy();
        super.destroy();
	}
});

class Extension {
    constructor() {
    }

    enable() {
    	this._mail_indicator = new MailIndicator();
    	Main.panel.addToStatusArea('new-mail-indicator', this._mail_indicator, -1, 'center');
    }

    disable() {
    	this._mail_indicator._destroy();
    }
}

function init() {
	return new Extension();
}
