require 'pry'
class Date
  attr_reader :today

  def initialize
    @today = nil
  end

  def today
    today_squared = @today.to_i ** 2
    @today = today_squared.to_s[-4..-1]
  end
end

date = Date.new
