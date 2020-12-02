require 'pry'

def load_data
  data = []
  File.readlines('day2_data.txt').each do |line|
    data << line
  end
  return data
end

def password_policy_1
  array = load_data
  number_of_valid = 0
  array.each do |policy|
    separated = policy.split(' ')
    range = separated[0].split('-')
    letter_check = separated[1].delete_suffix(':')
    password = separated[2]
    occurances = password.scan(letter_check).length
    
    if occurances >= range[0].to_i && occurances <= range[1].to_i
      number_of_valid += 1
    end
  end
  return number_of_valid
end

def password_policy_2
  array = load_data
  number_of_valid = 0
  array.each do |policy|
    separated = policy.split(' ')
    placement = separated[0].split('-')
    letter_check = separated[1].delete_suffix(':')
    password = separated[2]
    first_occurance = password[Integer(placement[0]) - 1]
    second_occurance = password[Integer(placement[1]) - 1]

    if first_occurance == letter_check && second_occurance == letter_check
    elsif first_occurance == letter_check
      number_of_valid += 1
    elsif second_occurance == letter_check
      number_of_valid += 1
    end
  end
  return number_of_valid
end

puts password_policy_1 # 458
puts password_policy_2 # 342
