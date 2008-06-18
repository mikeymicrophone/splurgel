class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.time :sunday_open
      t.time :sunday_close
      t.time :monday_open
      t.time :monday_close
      t.time :tuesday_open
      t.time :tuesday_close
      t.time :wednesday_open
      t.time :wednesday_close
      t.time :thursday_open
      t.time :thursday_close
      t.time :friday_open
      t.time :friday_close
      t.time :saturday_open
      t.time :saturday_close
      t.boolean :holidays

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
