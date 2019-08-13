# Student Directory #

The student directory script is one of the Makers Academy pre-course exercises where you build a program with increasing complexity which can carry out a few tasks.

## The aim

Is to get a better understanding of Ruby, whilst putting into practice some known syntax.

## How to use ##

You can load the directory.rb file in the command-line and pass an optional CSV file as an argument.

```shell
ruby directory.rb optional_file.csv
```

**Directory Menu**

Once the file is loaded you are presented with some menu options you can interact with. The current directory.rb file is the final working version and it gives you the following options.

```shell
"MAIN MENU"
"1. Input the students"
"2. Show the list of students"
"3. Search list of students by first character of their name"
"4. List names by length"
"5. List students by cohort group"
"6. Wipe the current list"
"7. Save the list of students"
"8. Load a list of students"
"9. Exit"
```

## Step 8 ##

After a basic form directory I decided to do each one of these tasks in a different directory files.

1. We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"? [directory1.rb](https://github.com/gabokappa/student-directory/blob/master/directory1.rb)

2.  Modify your program to only print the students whose name begins with a specific letter. [directory2.rb](https://github.com/gabokappa/student-directory/blob/master/directory2.rb)

3.  Modify your program to only print the students whose name is shorter than 12 characters. [directory3.rb](https://github.com/gabokappa/student-directory/blob/master/directory3.rb)

4.  Rewrite the each() method that prints all students using while or until control flow methods. [directory4.rb](https://github.com/gabokappa/student-directory/blob/master/directory4.rb)

5.  Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc. [directory5.rb](https://github.com/gabokappa/student-directory/blob/master/directory5.rb)

6.  Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned. [directory6.rb](https://github.com/gabokappa/student-directory/blob/master/directory6.rb)

7.  In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo? [directory7.rb](https://github.com/gabokappa/student-directory/blob/master/directory7.rb)

8.  Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the  map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort. [directory8.rb](https://github.com/gabokappa/student-directory/blob/master/directory8.rb)

9.  Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise? [directory9.rb](https://github.com/gabokappa/student-directory/blob/master/directory9.rb) or this [commit](https://github.com/gabokappa/student-directory/commit/9350425b351f5dad83b1ba0cadccc44f180167c2)

10. We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments). [directory10.rb](https://github.com/gabokappa/student-directory/blob/master/directory10.rb)

11. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window. Now, find all typos in that file and correct them. Use your experience, online documentation, etc. to find all mistakes. Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby will give you, think about what they could mean, try different things but don't look the answer up. [typos.rb](https://github.com/gabokappa/student-directory/blob/master/typos.rb)

12. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement to only print the list if there is at least one student in there? [directory.rb](https://github.com/gabokappa/student-directory/blob/master/directory.rb)

## Step 14 ##

The changes under Step 14 were carried out on the same directory.rb file referenced here through different commits.

1.  After we added the code to load the students from file, we ended up with adding the students to @students in two places. The lines in load_ students() and  input_students() are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem? [Here](https://github.com/gabokappa/student-directory/commit/9350425b351f5dad83b1ba0cadccc44f180167c2)

2.  How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change? [Commit 626408e](https://github.com/gabokappa/student-directory/commit/626408e9f77e9e37b22ecdc9bbfe2a34fd46c1ec)

3.  Continue refactoring the code. Which method is a bit too long? What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why? [Commit dcf5987](https://github.com/gabokappa/student-directory/commit/dcf5987bc59f43f4e7ed9597854a4bbd13186a8c)

4.  Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user? [Commit 08bd33e](https://github.com/gabokappa/student-directory/commit/08bd33ee30b2a36ed310cb6a853cf9871c86b237)

5.  The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items. [Commit 0565df4](https://github.com/gabokappa/student-directory/commit/0565df42b6352a8d264537b334b2a969a2cb7a26)

6.  We are opening and closing the files manually. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we didn't have to close it explicitly (it will be closed automatically when the block finishes). Refactor the code to use a code block. [Commit a6b9050](https://github.com/gabokappa/student-directory/commit/a6b9050e2adf58c1c7887c75401a50cadb109106)


7.  We are de-facto using CSV format to store data. However, Ruby includes [a library to work with the CSV files](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html) that we could use instead of working directly with the files. Refactor the code to use this library. [Commit 361fac7](https://github.com/gabokappa/student-directory/commit/361fac71037c56ff929204254ad2d3b6dd556fcf)

8.  Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen. [Commit 7cecce5](https://github.com/gabokappa/student-directory/commit/7cecce55afd0bef985dcadf043255a06d0cd7f32)
