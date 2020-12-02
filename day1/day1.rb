require 'pry'

def load_data
  data = []
  File.readlines('day1_data.txt').each do |line|
    data << line.to_i
  end
  return data
end

def find_sum_of_2
  data = load_data
  data.each do |x|
    data.each do |y|
      return x*y if x+y == 2020
    end
  end
end

def find_sum_of_3
  data = load_data
  data.each do |x|
    data.each do |y|
      data.each do |z|
        return x*y*z if x+y+z == 2020
      end
    end
  end
end

puts find_sum_of_2 # 1007104
puts find_sum_of_3 # 18847752
