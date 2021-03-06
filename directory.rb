require 'csv'


puts __FILE__

@students = []
DEFAULT_STUDENTS_FILENAME = "students.csv"

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students(filename = DEFAULT_STUDENTS_FILENAME)
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]] 
            csv << student_data
        end
    end
    # file = File.open(filename,"w") do |file|# "w" -> write only
    #     @students.each do |student|
    #         student_data = [student[:name], student[:cohort]] 
    #         csv_line = student_data.join(",")
    #         file.puts csv_line
    #     end
    # end
end

def load_students(filename = DEFAULT_STUDENTS_FILENAME)
    CSV.foreach(filename, "r") do |name, cohort|
        @students << {name: name, cohort: cohort.to_sym}    
    end
    # file = File.open(filename,"r") do |file|    
    #     file.readlines.each do |line|
    #         name, cohort = line.chomp.split(",")
    #         add_student(name, cohort)
    #     end
    # end
end

def try_load_students
    filename = ARGV.first
    filename = DEFAULT_STUDENTS_FILENAME if filename.nil?
    check_file_and_load(filename)
end

def check_file_and_load(filename)
   if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} students from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end 
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            puts "Give a name to the file"
            filename = gets.chomp
            save_students(filename)
            puts "Students saved in #{filename}!"
        when "4"
            puts "Which file do you want to load?"
            filename = gets.chomp
            check_file_and_load(filename)
        when "9"
            exit
        else
            puts "I don't know what you mean. Please try again"
    end
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def ask_for_name
    puts "Please enter the name of the student:"
    puts "Hit return to finish"
    @name = STDIN.gets.chomp    
end

def input_students
    ask_for_name
    while !@name.empty? do
        add_student(@name, "November")
        puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}."
        ask_for_name
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}."
end

try_load_students

interactive_menu



