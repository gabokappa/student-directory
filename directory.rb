@students = [] # an empty array accessible to all methods

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  puts "Which cohort are they in?"
  cohort = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Enter another name please."
    name = STDIN.gets.chomp
    puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student names saved."
end

def load_students(filename = "students.csv")
  if !File.exist?(filename)
    return puts "File not available, try another option."
  else
  file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort)
    end
  end
  file.close
  puts "File has been successfully loaded"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    puts "No file name provided, default file students.csv has been loaded."
    load_students
  elsif File.exist?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end
try_load_students
interactive_menu
