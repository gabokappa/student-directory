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

# Step 8 #

After a basic form directory I decided to do each one of these tasks in a different directory files.

1. We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"?[directory1.rb](https://github.com/gabokappa/student-directory/blob/master/directory1.rb)

2.  Modify your program to only print the students whose name begins with a specific letter. [directory2.rb](https://github.com/gabokappa/student-directory/blob/master/directory2.rb)

3.  Modify your program to only print the students whose name is shorter than 12 characters. [directory3.rb](https://github.com/gabokappa/student-directory/blob/master/directory3.rb)

4.  Rewrite the each() method that prints all students using while or until control flow methods. [directory4.rb](https://github.com/gabokappa/student-directory/blob/master/directory4.rb)

5.  Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc. [directory5.rb](https://github.com/gabokappa/student-directory/blob/master/directory5.rb)

6.  Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned. [directory6.rb](https://github.com/gabokappa/student-directory/blob/master/directory6.rb)

7.  In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo? [directory7.rb](https://github.com/gabokappa/student-directory/blob/master/directory7.rb)

8.  Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the  map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort. [directory8.rb](https://github.com/gabokappa/student-directory/blob/master/directory8.rb)

9.  Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise? [directory9.rb](https://github.com/gabokappa/student-directory/blob/master/directory9.rb)

10. We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments). [directory10.rb](https://github.com/gabokappa/student-directory/blob/master/directory10.rb)

11. Once you have completed the "Asking for user input" section, open [this file](https://raw.githubusercontent.com/anitacanita/student-directory/master/typos.rb). It's Ruby code but it has some typos. Copy it to a local file and open it in Atom without syntax highlighting. To do this, select "Plain Text" in the lower right corner of the window. Now, find all typos in that file and correct them. Use your experience, online documentation, etc. to find all mistakes. Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby will give you, think about what they could mean, try different things but don't look the answer up. [typos.rb](https://github.com/gabokappa/student-directory/blob/master/typos.rb)

12. What happens if the user doesn't enter any students? It will try to print an empty list. How can you use an if statement to only print the list if there is at least one student in there? [directory.rb](https://github.com/gabokappa/student-directory/blob/master/directory.rb)

# Step 14 #

As the changes here
