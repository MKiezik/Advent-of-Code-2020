require 'pry'

def load_data
  data = []
  current = ""

  File.readlines('day4_data.txt').each do |line|
    if line != "\n"
      current += line
    else
      data << current.chomp.gsub("\n", " ")
      data << line
      current = ""
    end
  end
  data << current.chomp.gsub("\n", " ")
  return data
end

def validate_passport_1
  array = load_data
  number_of_valid = 0
  array.each do |credentials|
    if credentials.scan(" ").length == 7 || (credentials.scan('cid').length == 0 && credentials.scan(" ").length == 6)
      number_of_valid += 1
    end
  end
  number_of_valid
end

def validate_passport_2
  array = load_data
  number_of_valid = 0
  array.each do |credentials|
    is_valid = false

    if credentials.scan(" ").length == 7 || (credentials.scan('cid').length == 0 && credentials.scan(" ").length == 6)
      passport2 = Hash[credentials.split(' ').map { |k| k.chomp.split(':',2)}]
      
      height_valid = false
      height = passport2["hgt"]
        if height =~ /cm$/
          if height.to_i.between?(150, 193)
            height_valid = true
          end
        elsif height =~ /in$/
          if height.to_i.between?(59, 76)
            height_valid = true
          end
        end
      
      if height_valid && passport2["byr"].to_i.between?(1920, 2002) && passport2["iyr"].to_i.between?(2010, 2020) &&
        passport2["eyr"].to_i.between?(2020, 2030) && passport2["hcl"].scan(/^#[\da-f]{6}$/).any? &&
        passport2["ecl"].scan(/^(amb|blu|brn|gry|grn|hzl|oth)$/).any? && passport2["pid"].scan(/^[0-9]{9}$/).any?
          number_of_valid += 1
      end
    end
  end
  number_of_valid
end

puts validate_passport_1.inspect # 250
puts validate_passport_2.inspect # 158
