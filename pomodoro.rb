require 'thread'
require 'output_handler'

class Pomodoro
  # include Java
  #import java.awt.*
  #import javax.swing.*

  POMO_DURATION_IN_MINS = 25
  BREAK_DURATION_IN_MINS = 5
  
  attr_accessor :pomo_thread
  attr_accessor :msg_thread
  
  
  
  def initialize
  end
  
  def display_message(msg)
    self.msg_thread.kill unless self.msg_thread.nil?
    self.msg_thread = Thread.new {OutputHandler.show_message(msg)}
  end
  
  def after_pomo
    puts "Pomo Done! Now take break. \n"
    display_message("Pomo Done! Now take a break.")
    # Show notification
  end
  
  def after_break
    puts "Your break time is over. Start on the next pomo. \n"
    display_message("Break Done!")
    # Show notification
  end
  
  def run_pomo(pomo=true)
    if pomo
      # sleep POMO_DURATION_IN_MINS*60
      sleep 6
      after_pomo
    else
      # sleep BREAK_DURATION_IN_MINS*60
      sleep 3
      after_break
    end
    run_pomo(!pomo)
  end
  
  def start
    self.pomo_thread = Thread.new {run_pomo}
  end
  
  def terminate
    self.pomo_thread.kill unless self.pomo_thread.nil?
  end
  
  def restart
    self.terminate
    self.start
  end
end
