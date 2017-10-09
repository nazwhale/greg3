require_relative 'parser'

class Analyser

  attr_reader :data

  def initialize
    parser = Parser.new('./day.csv')
    @data = parser.make_data_objects
  end

  def get_day(day_index)
    chosen_day_data = []
    @data.each do |row|
      if row.weekday == day_index
        chosen_day_data << row
      end
    end
    chosen_day_data
  end

  def get_mnth(mnth_index)
    chosen_mnth_data = []
    @data.each do |row|
      if row.mnth == mnth_index
        chosen_mnth_data << row
      end
    end
    chosen_mnth_data
  end

  def sum_temp(array)
    sum = 0
    array.each do |row|
      sum = row.temp + sum
    end
    sum
  end

  def mean_temp(array)
    mean = sum_temp(array) / array.length
    mean
  end

  def sum_users(array)
    sum = 0
    array.each do |row|
      sum = row.cnt + sum
    end
    sum
  end

  def mean_users(array)
    mean = sum_users(array) / array.length
    mean
  end

  def sum_casual_users(array)
    sum = 0
    array.each do |row|
      sum = row.casual + sum
    end
    sum
  end

  def mean_casual_users(array)
    mean = sum_casual_users(array) / array.length
    mean
  end

  def var_casual_users(array)
    variance = 0
    array.each do |row|
      variance = ((row.casual - mean_casual_users(array))**2) + variance
    end
    variance
  end

  def stnd_casual_users(array)
    standard = var_casual_users(array) / (array.length - 1)
    standard = Math.sqrt(standard)
    standard.round(2)
  end

  def sum_registered_users(array)
    sum = 0
    array.each do |row|
      sum = row.registered + sum
    end
    sum
  end

  def mean_registered_users(array)
    mean = sum_registered_users(array) / array.length
    mean
  end

  def var_registered_users(array)
    variance = 0
    array.each do |row|
      variance = ((row.registered - mean_registered_users(array))**2) + variance
    end
    variance
  end

  def stnd_registered_users(array)
    standard = var_registered_users(array) / (array.length - 1)
    standard = Math.sqrt(standard)
    standard.round(2)
  end

end

# analyser = Analyser.new
# array_of_day = analyser.get_day(6)
# puts analyser.sum_casual_users(array_of_day).to_s + ' Total casual'
# puts analyser.mean_casual_users(array_of_day).to_s + ' Mean casual'
# puts analyser.stnd_casual_users(array_of_day).to_s + ' Standard deviation casual'
# puts analyser.sum_registered_users(array_of_day).to_s + ' Total registered'
# puts analyser.mean_registered_users(array_of_day).to_s + ' Mean registered'
# puts analyser.stnd_registered_users(array_of_day).to_s + ' Standard deviation registered'
