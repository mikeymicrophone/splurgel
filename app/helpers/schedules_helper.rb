module SchedulesHelper
  
  # determines which day is the first with a different schedule from monday then returns string like
  # monday-friday 8:47 to 6:47, saturday 9:01 to 5:47 and sunday 9:01 to 5:47
  def schedule_view obj
    s = if obj.is_a?(Schedule)
      obj
    elsif obj.respond_to?(:schedule)
      obj.schedule
    else
      obj.location.schedule
    end
    
    monday_open, monday_close = s.monday_open, s.monday_close
    
    days = %w! monday tuesday wednesday thursday friday saturday sunday !
    
    last_day_of_monday_hours = 'monday'
    
    days.each do |day|
      if s.send(day + '_open') == monday_open && s.send(day + '_close') == monday_close
        last_day_of_monday_hours = day
      else
        break
      end
    end

    until days[0] == last_day_of_monday_hours
      days.shift
    end
    days.shift
    
    'monday-' + last_day_of_monday_hours + ' ' + monday_open.strftime("%l:%M") + ' to ' + monday_close.strftime("%l:%M") + ', ' +
    days.map { |d| d + ' ' + s.send(d + '_open').strftime('%l:%m') + ' to ' + s.send(d + '_close').strftime('%l:%M') + ' '}.to_sentence
    
  end
  
end
