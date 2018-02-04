require 'pry'
class Date
  attr_reader :today

  def initialize
    @today = "30218"
  end

  def find_today
    today_squared = @today.to_i ** 2
    @today = today_squared.to_s[-4..-1]
    @today
  end
  # binding.pry
end
