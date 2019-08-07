#In the input_students method the cohort value is hard-coded. How can you ask
#for both the name and the cohort? What if one of the values is empty?
#Can you supply a default value? The input will be given to you as a string?
#How will you convert it to a symbol? What if the user makes a typo?


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create  an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do

cohort_count = 0
    puts "Which cohort is this person in? Input the month"
    cohort1 = gets.chomp
    if cohort1 =~ /^[0-9]/
      puts "Please input the month name"
      cohort1 = gets.chomp.to_sym
    else
      cohort1 = cohort1.to_sym
    end

    puts "Let me know this student's hobby"
    hobby = gets.chomp.to_sym
    if hobby.empty?
      hobby = ("Calcio").to_sym
    end

    puts "What is this student's country of birth?"
    country_of_birth = gets.chomp

    puts "What is the student's height?"
    height1 = gets.chomp
    #add the student hash to the array
    students << {name: name, cohort: cohort1, hobbies: hobby, birth: country_of_birth, height: height1}
    puts "Now we have #{students.count} students"

    puts "Please enter the name of the next student"
    name = gets.chomp

  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  until count == students.length
  students.each_with_index do |student, index|
    puts ("#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)").center(60, '*** ')
    puts "Hobbies: #{students[count][:hobbies]} *** Height: #{students[count][:height]}"
    puts "Country of birth: #{students[count][:birth]}"
    puts ""
    count += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
