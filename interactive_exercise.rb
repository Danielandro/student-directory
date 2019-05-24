@students = [] #an empty array accesible to all methods

def interactive_menu
  loop do
    print_menu
    #read the input and perform action
    process(gets.chomp)
  end
end

def print_menu
  #print menu & ask user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students #input the students
    when "2"
      show_students #show the students
    when "3"
      save_students #save students to file
    when "4"
      load_students #load students from file
    when "9"
      exit #exit program
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students
  #open file for reading
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    # remove newline from end, create array, assign to variables
    name, cohort = line.chomp.split(", ") #e.g.["Hannibal", "november"]
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu