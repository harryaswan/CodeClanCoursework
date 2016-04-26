puts "Enter your score out of 10: "

score = gets.chomp.to_i



# score = 6
result = case score
when 10
    "Top Marks!"
when 8..9
    "So close, try again next time!"
when 5..7
    "Well more that 50% but not perfect"
else
    "Fail..... so :/"
end

puts result
