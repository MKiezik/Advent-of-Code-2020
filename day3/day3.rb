require 'pry'

def load_data
  data = File.open('day3_data.txt').readlines.map(&:chomp)
  return data
end

def toboggan_1
  array = load_data
  tree_count = 0
  move_right = 3
  move_down = 1
  current_position = 0

  array.each_with_index do |line, index|
    print index.to_s + " "
    if index % move_down != 0 || index == 0
      next
    end
    current_position += move_right
    if line[current_position % line.length] == "#"
      tree_count += 1
    end
  end
  tree_count
end

def toboggan_2(move_right, move_down)
  array = load_data
  tree_count = 0
  current_position = 0

  array.each_with_index do |line, index|
    print index.to_s + " "
    if index % move_down != 0 || index == 0
      next
    end
    current_position += move_right
    if line[current_position % line.length] == "#"
      tree_count += 1
    end
  end
  tree_count
end

puts toboggan_1 # 211
puts toboggan_2(1, 1) * toboggan_2(3, 1) * toboggan_2(5, 1) * toboggan_2(7, 1) * toboggan_2(1, 2) # 3584591857
