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

def volume_of_cube(num)
    return num ** 3
end

def volume_of_sphere(num)
    return ((4.0/3.0)*Math::PI*(num**3)).round(1)
end

def days_until_xmas()
    return (Date.parse("25th Dec 2016") - Date.today).to_i
end

def age_of_person(dob)
    return ((Date.today - Date.parse(dob))/365).to_i
end
