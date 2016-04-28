require('pry-byebug')


def print_score( results )
    binding.pry
    for x in results
        puts x
    end
    for y in results
        puts x
    end
end

scores = [3, 4, 5, 6, 7, 3, 4]
print_score(scores)
