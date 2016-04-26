puts "What is the best animal ever?"

u_animal = gets.chomp.downcase

# puts (u_animal == "sloth") ? "Correct" : "Wrong, it is the Sloth!"


case u_animal
when "sloth"
    puts "Very good! I agree"
when "dog"
    puts "Hairy, but sure"
when "cat"
    puts "Evil beasties"
when "rabbit"
    puts "Bouncing balls of fur"
else
    puts "Sure the #{u_animal} is kinda cool too"
end

=begin

if (u_animal == "sloth")
    puts "You are correct"
elsif (u_animal == "duck")
    puts "Quack!"
else
    puts "You are Wrong!"
end

=end
