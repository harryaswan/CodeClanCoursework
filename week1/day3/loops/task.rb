NEW_PRODUCTS = [
    {name: "guitar", shelf: 10},
    {name: "blender", shelf: 5},
    {name: "ipod", shelf: 3}
]

def get_shelf(item_name)
    for product in NEW_PRODUCTS

        if product[:name] == item_name
            return product[:shelf]
        end

    end
end


puts "Type the name of the product you wish to find:"
value = gets.chomp.downcase


puts "Got shelf of '#{value}': #{get_shelf(value)}"
