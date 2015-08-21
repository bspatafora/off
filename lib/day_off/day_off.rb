class DayOff
  attr_reader :id, :user_id, :start, :end, :type_id

  def initialize(args = {})
    @id = args[:id]
    @user_id = args[:user_id]
    @start = args[:start]
    @end = args[:end]
    @type_id = args[:type_id]
  end

  def ==(other)
    self.class == other.class && self.state == other.state
  end

  def state
    self.instance_variables.map { |v| self.instance_variable_get(v) }
  end
end
