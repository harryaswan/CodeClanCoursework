def my_name()
    name = "Harry"
    return name
end

# puts my_name()

def got_rocks?(name)
    if ( name == "Val")
        return false
    elsif ( name == "Aidan")
        return true
    else
        return "No idea"
    end
end


# puts got_rocks?("Val")

def greet (first_name, last_name)
    puts "Hello #{first_name} #{last_name}"
end

# greet("Harry", "Swan")


def cur_weather(weather)

    return "The weather today is #{weather}!"

end

# puts cur_weather("sunny")

def add(num_1, num_2)
    return num_1 + num_2
end
