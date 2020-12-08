require 'pry'

def load_data
  data = []
  text = File.read('day6_data.txt')
  text.split("\n\n").each do |group|
    data << group.split("\n")
  end
  return data
end

def customs_1
  data = load_data

  data.map do |group|
    group.join.split('').uniq.size
  end.sum
end

def customs_2
  data = load_data
  sum = 0

  data.map do |group|
    min_answers = group.min_by(&:length).chars
    min_answers.each do |char|
      sum += 1 if group.join.scan(char).length.eql?(group.length)
    end
  end
  sum
end

puts customs_1 # 6930
puts customs_2 # 3585
