c = get_config()  #noqa
# Disable terminal title setting.
c.TerminalInteractiveShell.term_title = False

# Disable exit confirmation.
c.TerminalInteractiveShell.confirm_exit = False

# Disable banner.
c.TerminalInteractiveShell.banner1 = ''
c.TerminalInteractiveShell.banner2 = ''
c.TerminalInteractiveShell.quiet = True

# Disable simple prompt.
c.TerminalInteractiveShell.simple_prompt = False

# Use pprint in PlainTextFormatter.
c.PlainTextFormatter.pprint = True

## Set the log level by value or name.
c.Application.log_level = 'ERROR'
c.InteractiveShellApp.log_level = 'ERROR'
c.TerminalIPythonApp.log_level = 'WARN'

# Set syntax highlighting style.
c.TerminalInteractiveShell.colors = "linux"
c.InteractiveShell.colors = "linux"

# BaseIPythonApplication(Application) configuration.
c.BaseIPythonApplication.add_ipython_dir_to_sys_path = True

# TerminalIPythonApp(BaseIPythonApplication, InteractiveShellApp) configuration.
c.TerminalIPythonApp.add_ipython_dir_to_sys_path = True

# Shortcut style to use at the prompt.
c.TerminalInteractiveShell.editing_mode = 'vi'

# Set the editor used by IPython.
c.TerminalInteractiveShell.editor = 'nvim'

# Set to show a tip when IPython starts.
c.InteractiveShell.enable_tip = False
c.TerminalInteractiveShell.enable_tip = False
