# ---------------------------------------------- general
source /usr/share/gdb-dashboard/.gdbinit
# ---------------------------------------------- layout
dashboard -layout source memory threads variables

# ---------------------------------------------- style
dashboard -style syntax_highlighting 'material'
dashboard -style divider_fill_style_primary '32'
dashboard -style divider_label_style_on_primary '1;93'
dashboard -style style_low '10'
dashboard -style divider_label_margin 0
dashboard -style style_selected_1 '34'
