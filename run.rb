require 'tray_application'
require 'input_handler'

tray_app = TrayApplication.new("Pomodoro", "pomodoro_systray.png")
InputHandler.reset_systray_icons(tray_app)