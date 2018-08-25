student_count = 11

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "What is your cohort"
  cohort = gets.chomp
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.length === 1
      puts "We have 1 student in the school" 
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Name"
    name = gets.gsub("\n", "")
    puts "Cohort"
    cohort = gets.chomp
    if !name.empty? && cohort.empty?
        cohort = "november"
    end
  end
  # return the array of students
 students
end

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
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end
def print(students)
  if !students.empty?
    counter = 0
    until counter == (students.length) 
      puts "#{students[counter][:name]} #{students[counter][:cohort]} cohort".center(50)
      counter += 1
    end
  else 
    puts "Student list is empty"
  end
end

def sort_by_cohort(students)
  cohort_hash = {}

    students.each do |student|
    cohort_attended = student[:cohort]
      if cohort_hash[cohort_attended] == nil
        cohort_hash[cohort_attended] = []
      end
      cohort_hash[cohort_attended].push(student[:name])
    end
    cohort_hash
end

def print_cohort(cohort_lists)
  cohort_lists.each do |cohort, list|
    puts cohort
    puts "-------"
    puts list
  end
end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
# students = input_students
interactive_menu

print_header
print(students)
print_footer(students)

print_cohort(sort_by_cohort(students))