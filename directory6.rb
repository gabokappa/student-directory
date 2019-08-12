# Research how the method center() of the String class works.
# Use it in your code to make the output beautifully aligned.


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create  an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do

    puts "Let me know this student's hobby"
    hobby = gets.chomp

    puts "What is this student's country of birth?"
    country_of_birth = gets.chomp

    puts "What is the student's height?"
    height1 = gets.chomp
    #add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobby, birth: country_of_birth, height: height1}
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
    puts ("#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)").center(60, '***')
    puts "Hobbies: #{students[count][:hobbies]} Height: #{students[count][:height]}"
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
