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
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Name"
    name = gets.chomp
    puts "Cohort"
    cohort = gets.chomp
    if !name.empty? && cohort.empty?
      cohort = "november"
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end
def print(students)
  counter = 0
  until counter == (students.length) 
    puts "#{students[counter][:name]} #{students[counter][:cohort]} cohort".center(50)
    counter += 1
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
students = input_students
print_header
print(students)
print_footer(students)

print_cohort(sort_by_cohort(students))