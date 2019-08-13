require 'csv'
# useful URL: https://www.sitepoint.com/guide-ruby-csv-library-part/

@students = []

def add_students(name, cohort, hobby='n/a')
  @students << {name: name.capitalize, cohort: cohort.capitalize.to_sym, hobbies: hobby}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
  puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp

  loop_input(name, cohort)
end

  def loop_input(name, cohort)
  while !name.empty? || !cohort.empty? do
    puts "What is this student's hobby?"
      hobby = STDIN.gets.chomp
      hobby = 'n/a' if hobby.empty?
    add_students(name, cohort, hobby)
      student_count
    puts "Enter another name please."
      name = STDIN.gets.chomp
    puts "Which cohort are they in?"
      cohort = STDIN.gets.chomp
  end
end

def student_count
  puts "*" * 80
  if @students.count == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{@students.count} students"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts ""
  puts "MAIN MENU".center(80, ' +')
  puts "1. Input the students"
  puts "2. Show the list of students"
  puts "3. Search list of students by first character of their name"
  puts "4. List names by length"
  puts "5. List students by cohort group"
  puts "6. Wipe the current list"
  puts "7. Save the list of students"
  puts "8. Load a list of students"
  puts "9. Exit"
  puts "".center(80, ' +')
end

def show_students
if @students.length == 0
  puts ""
  puts "No students to show".center(80, ' !')
else
  print_header
  print_student_list
  print_footer
end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    print_by_character
  when "4"
    print_by_length
  when "5"
    print_by_cohort
  when "6"
    delete_list
  when "7"
    save_students
  when "8"
    puts "Input the filename you would like to load"
    filename = STDIN.gets.chomp
    load_students(filename)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_by_length
  puts "How many characters does the name have?"
    char_length = STDIN.gets.chomp
    count = 1
  @students.each do |student|
    if student[:name].length >= char_length.to_i
      puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort) favourite hobby #{student[:hobbies]}"
      count += 1
    else
      puts "No student longer than #{char_length}."
    end
  end
end

def print_header
  puts "\nTHE LIST OF STUDENTS"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}) #{student[:name]} (#{student[:cohort]} cohort) favourite hobby #{student[:hobbies]}".center(80, ' ***')
  end
end

def print_by_character
  puts "Enter the first character of their name."
  letter = STDIN.gets.chomp
  count = 1
  puts ""
  @students.each do |student|
    if student[:name].chr == letter.upcase
      puts "#{count}) #{student[:name]} (#{student[:cohort]} cohort) favourite hobby #{student[:hobbies]}".center(80, ' X')
      count += 1
    end
  end
  print_footer
end

def print_by_cohort
  count = 1
  puts "Which cohorot would you like to display on screen?"
  cohort_group = STDIN.gets.chomp.capitalize.to_sym
  @students.each do |student|
    if student[:cohort] == cohort_group
      puts "#{count}) #{student[:name]} (#{student[:cohort]} cohort) favourite hobby #{student[:hobbies]}".center(80, ' X')
      count += 1
    end
  end
  print_footer
end

def print_footer
  if @students.length == 0
    puts ""
    puts "No students to show".center(80, ' !')
  else
    @students.count <= 1? (quantity = "student") : (quantity = "students")
    puts ""
    puts "Overall, we have #{@students.count} great #{quantity}"
    puts "-------------"
  end
end

def save_students
  puts "What name do you want to give this file? Use .csv suffix"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
  @students.each do |student|
    csv << [student[:name], student[:cohort], student[:hobbies]]
  end
end
  puts "*** Student names successfully saved ***"
end

def delete_list
  puts "Are you sure you want to wipe the list? Type Y/N"
  decision = STDIN.gets.chomp.upcase
  if decision == "Y"
    @students = []
    puts "\nList has been wiped"
  else
    puts "Nothing has been wiped"
  end
end

def load_students(filename)
  if !File.exist?(filename)
    return puts "File not available, try another option below."
  else
    CSV.foreach(filename) do |row|
      name, cohort, hobby = row
      hobby = 'n/a' if hobby == nil
        add_students(name, cohort, hobby)
    end
    puts "+++ File has been successfully loaded +++"
    puts ""
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
puts ""
    puts "*" * 80
    puts "\nNo file name provided, default file 'students.csv' wil be loaded"
    load_students("students.csv")
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
