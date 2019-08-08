#Find an alternative to .chomp that truncates a string after gets.
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create  an empty array
  students = []
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do

cohort_count = 0
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
    students << {name: name, cohort: cohort1, hobbies: hobby, birth: country_of_birth, height: height1}

    if students.count == 1
      puts "We have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end

    puts "Please enter the name of the next student"
    name = gets.strip

  end
  students
end

def print_header
  if students == !nil
    puts "The students of Villains Academy"
    puts "-------------"
  else
  end
end

def print(students)

  puts "Which cohort would you like to print out?"
  cohort_group = gets.strip.downcase.to_sym
  @count = 0
  new_list = []
  students.each do |person|
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

def print_footer(students)
  puts "Overall, we have #{@count.to_s} great students."
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
