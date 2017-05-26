@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students
   file = File.open("students.csv","w") # "w" -> write only
   @students.each do |student|
      student_data = [student[:name], student[:cohort]] 
      csv_line = student_data.join(",")
      file.puts csv_line
   end
   file.close
end

def process(selection)
    case selection
        when "1"
            students = input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            exit
        else
            puts "I don't know what you mean. Please try again"
    end
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def input_students
    puts "Please enter the name of the student:"
    puts "Hit return to finish"
    months = ["January", 
        "February", 
        "March", 
        "April", 
        "May", 
        "June", 
        "July", 
        "August", 
        "September", 
        "October", 
        "November", 
        "December"
    ]
    name = gets.chomp
    while !name.empty? do
        # if name.start_with?("V") && name.length < 12
            puts "Please enter their cohort:"
            cohort = gets.chomp
            if months.include?(cohort)
                @students << {name: name, cohort: cohort == ""? "January" : cohort}
            else
                puts "The cohort entered is not valid"
                puts "Please enter their cohort:"
                cohort = gets.chomp
            end
            puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}."
            puts "Please enter the name of the student:"
            name = gets.chomp
        # else
        #     puts "The student added does not qualify"
        #     puts "Please enter the name of the student:"
        #     name = gets.chomp
        # end
    end
    @students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.map do |student|
        student[:cohort]
    end.uniq.each do |month|
        puts "#{month} cohort:"
        @students.each do |student|
           if student[:cohort] == month
               puts "   #{student[:name]}"
           end
        end
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}."
end

def load_students
    file = File.open("students.csv","r")    
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

p interactive_menu



