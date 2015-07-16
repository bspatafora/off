require 'day_off/day_off'

class DayOffFactory
  def self.make(args = {})
    defaults = {
      id: 1,
      user_id: 1,
      start_time: '09:00',
      end_time: '05:00',
      type_id: 1
    }
    DayOff.new(defaults.merge(args))
  end
end
