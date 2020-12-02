require 'pry'

def load_data
  data = []
  File.readlines('day1_data.txt').each do |line|
    data << line.to_i
  end
  return data
end

def find_sum_of_2()
  array = load_data
  array.each do |x|
    array.each do |y|
      if x+y == 2020
        return x*y
      end
    end
  end
end

def find_sum_of_3()
  array = load_data
  array.each do |x|
    array.each do |y|
      array.each do |z|
        if x+y+z == 2020
          return x*y*z
        end
      end
    end
  end
end

puts find_sum_of_2 # 1007104
puts find_sum_of_3 # 18847752
