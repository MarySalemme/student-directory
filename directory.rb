def input_students
    puts "Please enter the name of the student:"
    puts "Hit return to finish"
    students = []
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
                students << {name: name, cohort: cohort == ""? "January" : cohort}
            else
                puts "The cohort entered is not valid"
                puts "Please enter their cohort:"
                cohort = gets.delete("\n")
            end
            puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}."
            puts "Please enter the name of the student:"
            name = gets.delete("\n")
        else
            puts "The student added does not qualify"
            puts "Please enter the name of the student:"
            name = gets.delete("\n")
        end
        
    end
    students
end

def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end

def print(students)
    # each_with_index added to print the number
    students.each_with_index do |student, index|
        puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students"}.".center(50)  
end

students = input_students

print_header
print(students)
print_footer(students)
