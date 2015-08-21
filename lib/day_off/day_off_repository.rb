class DayOffRepository
  def initialize
    @days_off = {}
  end

  def store(day_off)
    id = day_off.id || index

    @days_off[id] = day_off
  end

  def retrieve(id)
    @days_off[id]
  end

  def remove(id)
    @days_off.delete(id)
  end

  private

  def index
    @days_off.size + 1
  end
end
