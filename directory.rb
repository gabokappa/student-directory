require 'csv'
# useful URL: https://www.sitepoint.com/guide-ruby-csv-library-part/

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
  while !name.empty? || !cohort.empty? do
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
  puts "2. Show the  list of students"
  puts "3. Save the list of students"
  puts "4. Load a list of students"
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
    puts "Input the filename you would like to load"
    filename = STDIN.gets.chomp
    load_students(filename)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "THE LIST OF STUDENTS"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}) #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "What name do you want to give this file? Use .csv suffix"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
  #iterate over the array of students
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
  end
end
  puts "*** Student names successfully saved ***"
end

def load_students(filename)
  if !File.exist?(filename)
    return puts "File not available, try another option."
  else
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_students(name, cohort)
    end
    puts "+++ File has been successfully loaded +++"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    puts "No file name provided, attempt to load default 'students.csv'."
    load_students("students.csv")
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
