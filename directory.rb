def input_students
    puts "Please enter the names of the students"
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
        else
            puts "The student added does not qualify"
        end
        name = gets.chomp
    end
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    # each_with_index added to print the number
    
    students.each_with_index do |student, index|
        puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students."    
end

students = input_students

print_header
print(students)
print_footer(students)
