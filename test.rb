# Write a short program that reads its own source code (search StackOverflow to
# find out how to get the name of the currently executed file) and prints it on
# the screen.

def source_code
  File.foreach(__FILE__) do |line|
      puts line.chomp
    end
end

source_code
