def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get first name from user
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return array of students
  students
end

def filter_by_initial(letter, students)
  # return array of student hashes where name begins with letter
  students.select do |student|
    student[:name].chr == letter
  end
end

def shorter_than_12(students)
  puts "The students with names less than 12 characters:"
  students.select do |student|
    student[:name].size < 12
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index| 
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" 
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
first_letter = 'A'
name_starts_with = filter_by_initial(first_letter, students)
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
# names with first same letter
puts "------------"
puts "The students whose name starts with #{first_letter} are:"
print(name_starts_with)
# names with less than 12 characters
puts "------------"
print(shorter_than_12(students))

