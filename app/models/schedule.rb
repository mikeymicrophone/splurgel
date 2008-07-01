class Schedule < ActiveRecord::Base
  has_many :locations
  has_many :stores, :through => :locations
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Schedule'"
  has_many :comments, :as => :target
  
  def display
    days = %w! monday tuesday wednesday thursday friday saturday sunday !

    last_day_of_monday_hours = 'monday'

    days.each do |day|
      if send(day + '_open') == monday_open && send(day + '_close') == monday_close
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
    days.map { |d| d + ' ' + send(d + '_open').strftime('%l:%m') + ' to ' + send(d + '_close').strftime('%l:%M') + ' '}.to_sentence
  end
end
