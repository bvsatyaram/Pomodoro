module OutputHandler
  include Java
  #include_package 'javax.swing'
  #include_package 'java.awt'
  import javax.swing.ImageIcon
  import javax.swing.JFrame
  import javax.swing.JOptionPane
  
  def self.show_message(msg, title = "Pomodoro")
    JOptionPane.showMessageDialog(nil, msg, title, JOptionPane::INFORMATION_MESSAGE, ImageIcon.new(File.dirname(__FILE__) + '/pomodoro_logo.png'))
  end
end
