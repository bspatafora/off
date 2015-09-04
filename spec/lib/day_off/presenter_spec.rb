require 'json'

require_relative '../../../lib/day_off/presenter'
require_relative 'factory'
require_relative '../../spec_helper'

describe 'a day off presenter' do
  def json(day_off)
    attribute_pairs = day_off.instance_variables.map do |attribute|
      key = attribute.to_s.delete('@')
      value = day_off.instance_variable_get(attribute)
      [key, value]
    end

    JSON.generate(attribute_pairs.to_h)
  end

  it 'represents a day off in JSON' do
    day_off = DayOff::Factory.make

    expect(DayOff::Presenter.do(day_off)).to eq json(day_off)
  end
end
