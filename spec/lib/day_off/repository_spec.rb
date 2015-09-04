require_relative '../../../lib/day_off/model'
require_relative '../../../lib/day_off/repository'
require_relative 'factory'
require_relative '../../spec_helper'

describe 'a day off repository' do
  it 'stores days off' do
    repository = DayOff::Repository.new
    day_off = DayOff::Factory.make

    repository.store(day_off)

    expect(repository.retrieve(1)).to eq day_off
  end

  it 'removes days off' do
    day_off_repository = DayOff::Repository.new
    day_off_repository.store(DayOff::Model.new)
    expect(day_off_repository.retrieve(1)).not_to eq nil

    day_off_repository.remove(1)

    expect(day_off_repository.retrieve(1)).to eq nil
  end
end
