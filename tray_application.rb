class TrayApplication

  include Java
  import java.awt.TrayIcon
  import java.awt.Toolkit

  attr_accessor :icon_filename
  attr_accessor :menu_items
  attr_accessor :tray_icon
  attr_accessor :pomo

  def initialize(name, icon)
    @menu_items    = []
    @name          = name
    @icon_filename = icon
    @pomo          = nil
  end

  def item(label, &block)
    item = java.awt.MenuItem.new(label)
    item.add_action_listener(block)
    @menu_items << item
  end
  
  def show(modify = false)
    tray = java.awt.SystemTray::system_tray
    tray.remove(@tray_icon) if modify    
    popup = java.awt.PopupMenu.new
    @menu_items.each{|i| popup.add(i)}

    # Give the tray an icon and attach the popup menu to it
    image    = java.awt.Toolkit::default_toolkit.get_image(@icon_filename)
    @tray_icon = TrayIcon.new(image, @name, popup)
    @tray_icon.image_auto_size = true

    # Finally add the tray icon to the tray
    tray.add(@tray_icon)
  end
  
  def self.close
    java.lang.System::exit(0)
  end

end
