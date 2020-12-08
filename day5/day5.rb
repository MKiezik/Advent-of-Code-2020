require 'pry'

def load_data
  data = []
  File.readlines("day5_data.txt").each do |line|
    data << line
  end
  data
end

def find_seat_1
  data = load_data
  ids = []

  data.each do |seat|
    front = 0
    back = 127
    left = 0
    right = 7

    seat.split('') do |char|
      if char == 'F'
        back = (back + front)/2
      elsif char == 'B'
        front = (back + front + 1)/2
      elsif char == 'L'
        right = (right + left)/2
      elsif char == 'R'
        left = (right + left + 1)/2
      end
      if char == 'B' || char == 'F' || char == 'R' || char == 'L'
      end
    end
    id = front * 8 + left
    ids << id
  end
  max = ids.max
end

def find_seat_2
  data = load_data
  ids = []

  data.each do |seat|
    front = 0
    back = 127
    left = 0
    right = 7

    seat.split('') do |char|
      if char == 'F'
        back = (back + front)/2
      elsif char == 'B'
        front = (back + front + 1)/2
      elsif char == 'L'
        right = (right + left)/2
      elsif char == 'R'
        left = (right + left + 1)/2
      end
      if char == 'B' || char == 'F' || char == 'R' || char == 'L'
      end
    end
    id = front * 8 + left
    ids << id
  end

  sorted = ids.sort

  sorted.each_with_index do |id, index|
    if id + 1 != sorted[index+1]
      return id + 1
    end
  end
end

puts find_seat_1 # 874
puts find_seat_2 # 594
