require 'date'
def return_10()
    return 10
end

def add(num_1, num_2)
    return num_1 + num_2
end

def subtract(num_1, num_2)
    return num_1 - num_2
end

def multiply(num_1, num_2)
    return num_1 * num_2
end

def divide(num_1, num_2)
    return num_1 / num_2
end

def length_of_string(text)
    return text.length
end

def join_string(string_1, string_2)
    return string_1 << string_2
end

def add_string_as_number(string_1, string_2)
    return string_1.to_i + string_2.to_i
end

def number_to_full_month_name(num)
    return Date::MONTHNAMES[num]
end

def number_to_short_month_name(num)
    return Date::MONTHNAMES[num][0..2]
end
