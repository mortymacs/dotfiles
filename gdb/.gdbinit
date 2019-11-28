# ---------------------------------------------- general
set substitute-path /build/glibc-4WA41p/glibc-2.30/ /opt/src/glibc-2.30/

# ---------------------------------------------- source
source ~/Workspace/oss/dotfiles/gdb/.gdbinit-dashboard

# ---------------------------------------------- layout
dashboard -layout source breakpoints history memory stack threads variables

# ---------------------------------------------- style
dashboard -style syntax_highlighting 'monokai'
dashboard -style divider_fill_char_primary '-'
dashboard -style divider_fill_style_primary '32'
dashboard -style divider_label_style_on_primary '1;93'
dashboard -style style_low '10'
dashboard -style divider_label_margin 0
dashboard -style style_selected_1 '34'
