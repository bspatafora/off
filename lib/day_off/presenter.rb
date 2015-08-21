require 'json'

module DayOff
  class Presenter
    def self.do(day_off)
      attribute_pairs = day_off.instance_variables.map do |attribute|
        key = attribute.to_s.delete('@')
        value = day_off.instance_variable_get(attribute)
        [key, value]
      end

      JSON.generate(attribute_pairs.to_h)
    end
  end
end
