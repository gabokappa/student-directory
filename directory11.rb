@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort is this person in? Input the month"
    cohort1 = gets.strip
    if cohort1 =~ /^[0-9]/
      puts "Please input the month name"
      cohort1 = gets.strip.downcase.to_sym
    else
      cohort1 = cohort1.downcase.to_sym
    end

    puts "Let me know this student's hobby"
    hobby = gets.strip.to_sym
    if hobby.empty?
      hobby = ("Calcio").to_sym
    end

    puts "What is this student's country of birth?"
    country_of_birth = gets.strip

    puts "What is the student's height?"
    height1 = gets.strip
    #add the student hash to the array
    @students << {name: name, cohort: cohort1, hobbies: hobby, birth: country_of_birth, height: height1}

    if @students.count == 1
      puts "We have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end

    puts "Please enter the name of the next student"
    name = gets.strip

  end
end

def print_header
  if !@students.empty?
    puts "The students of Villains Academy"
    puts "-------------"
  else
  end
end

def print_students_list
  puts "Which cohort would you like to print out?"
  cohort_group = gets.strip.downcase.to_sym
  @count = 0
  new_list = []
  @students.each do |person|
    person.each do |_, value|
      if value == cohort_group
        new_list << person
      else
      end
    end
  end

  until @count == new_list.length
    puts ("#{@count + 1}. #{new_list[@count][:name]} (#{new_list[@count][:cohort]} cohort)").center(60, ' *** ')
    puts "Hobbies #{new_list[@count][:hobbies]} *** Height: #{new_list[@count][:height]}"
    puts "Country of birth: #{new_list[@count][:birth]}"
    puts ""
    @count += 1
  end
end

def print_footer
  if @students.empty?
    puts "There are no students enrolled."
  elsif @students.count == 1
    puts "Overall, we have #{@count.to_s} great student."
  else
    puts "Overall, we have #{@count.to_s} great students."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

#nothing happens until we call the methods
=begin
def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  # 4. repeat from step 1
end
=end
