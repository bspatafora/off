require_relative '../../../lib/day_off/memory_repository'
require_relative 'shared_examples_for_repositories'

describe DayOff::MemoryRepository do
  it_behaves_like 'a day off repository'
end
