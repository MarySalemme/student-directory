@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def interactive_menu
    
    loop do
        print_menu
        selection = gets.chomp
        case selection
            when "1"
                students = input_students
            when "2"
                show_students
            when "9"
                exit
            else
                puts "I don't know what you mean. Please try again"
        end
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
    name = gets.delete("\n")
    while !name.empty? do
        if name.start_with?("V") && name.length < 12
            puts "Please enter their cohort:"
            cohort = gets.delete("\n")
            if months.include?(cohort)
                @students << {name: name, cohort: cohort == ""? "January" : cohort}
            else
                puts "The cohort entered is not valid"
                puts "Please enter their cohort:"
                cohort = gets.delete("\n")
            end
            puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students"}."
            puts "Please enter the name of the student:"
            name = gets.delete("\n")
        else
            puts "The student added does not qualify"
            puts "Please enter the name of the student:"
            name = gets.delete("\n")
        end
        
    end
    @students
end

def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end

def print_students_list
    # each_with_index added to print the number
    @students.each_with_index do |student, index|
        puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}.".center(50)  
end

p interactive_menu



