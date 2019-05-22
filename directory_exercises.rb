def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  
  students = []
  # get first name & cohort from user
  name = gets.chomp
  puts "Please enter the student's cohort"
  cohort = gets.chomp.to_s
  # while the name is not empty, repeat this code
  while !name.empty?  do
    student_hash = Hash.new("Not supplied")
    # add student details to hash
    student_hash[:name] = name 
    student_hash[:cohort] = cohort if !cohort.empty?
    # add the student hash to the array
    students << student_hash
    puts "Now we have #{students.count} #{check_if_plural(students)}"
    # get another name from the user
    puts "Enter next student"
    name = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp.to_s
  end
  # return array of students
  students
end

def check_if_plural(students)
  if students.count > 1
    "students"
  else
    "student"
  end
end

def filter_by_cohort(students)
  cohorts = students.map do |student|
    student[:cohort]
  end
  
  cohorts.uniq
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students, cohorts=nil)
  cohorts.each do |cohort|
    student_num = 0
    puts "Student(s) from the #{cohort.capitalize} cohort:"
    while student_num < students.size 
      if students[student_num][:cohort] == cohort
        matching_student = "#{students[student_num][:name]}"
        puts matching_student.center(matching_student.length + 7)
      end
      student_num += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{check_if_plural(students)}"
end

students = input_students
cohorts = filter_by_cohort(students)
#nothing happens until we call the methods
print_header
print(students, cohorts)
print_footer(students)