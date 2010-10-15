require 'output_handler'
require 'pomodoro'
require 'tray_application'
require 'thread'

module InputHandler  
  def self.start_pomo(tray_app)
    tray_app.pomo = Pomodoro.new
    tray_app.pomo.start
    InputHandler.handle_pomo_start(tray_app)
  end
  
  def self.reset_pomo(tray_app)
    tray_app.pomo.terminate
    InputHandler.reset_systray_icons(tray_app, true)
  end
  
  def self.about_pomo
    about_msg = "About Pomodoro. This is great!"
    Thread.new {OutputHandler.show_message(about_msg, "About Pomodoro")}
  end
  
  def self.close_systray(tray_app)
    tray_app.pomo.terminate unless tray_app.pomo.nil?
    TrayApplication.close
  end
  
  def self.reset_systray_icons(tray_app, modify = false)
    tray_app.menu_items = []
    tray_app.item('Start Pomodoro') {InputHandler.start_pomo(tray_app)}
    tray_app.item('About Pomodoro') {InputHandler.about_pomo}
    tray_app.item('Exit') {InputHandler.close_systray(tray_app)}
    tray_app.show(modify)
  end
  
  def self.handle_pomo_start(tray_app)
    tray_app.menu_items = []
    tray_app.item('Reset Pomodoro') {InputHandler.reset_pomo(tray_app)}
    tray_app.item('About Pomodoro') {InputHandler.about_pomo}
    tray_app.item('Exit') {InputHandler.close_systray(tray_app)}
    tray_app.show(true)
  end
end
