my_number = 5
puts "What number am i thinking of?"
value = gets.to_i

unless value == my_number
    puts "Try again!"
    value = gets.to_i
end
puts "v: #{value}"
puts "yeah!"
