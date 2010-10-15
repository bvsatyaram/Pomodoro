require 'thread'

class Pomodoro
  POMO_DURATION_IN_MINS = 25
  BREAK_DURATION_IN_MINS = 5
  
  attr_accessor :pomo_thread
  
  def initialize
  end
  
  def after_pomo
    puts "Pomo Done! Now take break. \n"
    # Show notification
  end
  
  def after_break
    puts "Your break time is over. Start on the next pomo. \n"
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
    self.pomo_thread.exit
  end
  
  def restart
    self.terminate
    self.start
  end
end
