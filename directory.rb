# putting students in one array
students = [
    "Dr. Hannibal Lecter"
    "Darth Vader"
    "Nurse Ratched"
    "Michael Corleone"
    "Alex DeLarge"
    "the Wicked Witch of the West"
    "Terminator"
    "Freddy Krueger"
    "The Joker"
    "Joffrey Baratheon"
    "Voldemort"
]

#printing the students
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
    puts student
end

# string interpolation
puts "Overall, we have #{students.count} great students"