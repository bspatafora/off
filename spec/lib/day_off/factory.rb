require_relative '../../../lib/day_off/model'
require_relative '../../spec_helper'

module DayOff
  class Factory
    def self.make(args = {})
      defaults = {
        id: 1,
        user_id: 1,
        start: '2000-01-01 09:00:00 UTC',
        end: '2000-01-01 05:00:00 UTC',
        type_id: 1
      }

      DayOff::Model.new(defaults.merge(args))
    end
  end
end
