# Modify your program to only print the students whose name is shorter than 12
# characters.


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create  an empty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 1
  puts "Whose name is shorter than 12 characters"
  students.each do |student|
    if student[:name].length < 12
      puts "#{count}. #{student[:name]} (#{student[:cohort]} cohort)"
      count += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
