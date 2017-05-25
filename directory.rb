def input_students
    puts "Please enter the name of the student."
    puts "Hit return to finish"
    students = []
    name = gets.chomp
    while !name.empty? do
        if name.start_with?("V") && name.length < 12
            puts "What are this student's hobbies?"
            hobbies = gets.chomp
            puts "What's the country of birth?"
            country_of_birth = gets.chomp
            puts "And the date of birth?"
            date_of_birth = gets.chomp
            students << {name: name, cohort: :november, hobbies: hobbies, country_of_birth: country_of_birth, date_of_birth: date_of_birth}
            puts "Now we have #{students.count} students."
            puts "Please enter the name of the student."
            name = gets.chomp
        else
            puts "The student added does not qualify."
            puts "Please enter the name of the student."
            name = gets.chomp
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
    puts "Overall, we have #{students.count} great students."  .center(50)  
end

students = input_students

print_header
print(students)
print_footer(students)
