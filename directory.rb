@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "What is your cohort"
  cohort = gets.chomp
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.length === 1
      puts "We have 1 student in the school" 
    else
      puts "Now we have #{@students.count} students"
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
 @students
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
  if !@students.empty?
    counter = 0
    until counter == (@students.length) 
      puts "#{@students[counter][:name]} #{@students[counter][:cohort]} cohort".center(50)
      counter += 1
    end
  else 
    puts "Student list is empty"
  end
end

def sort_by_cohort
  cohort_hash = {}

    @students.each do |student|
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

def save_students
  #open file for writing students
  file = File.open("students.csv", "w")
  #iterate over the student file list
  @students.each do |student|
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
end


def print_footer
  puts "Overall, we have #{@students.count} great students"
end
print_header

interactive_menu




print_cohort(sort_by_cohort(@students))