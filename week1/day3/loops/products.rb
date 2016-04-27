PRODUCTS = {
    guitar: 10,
    blender: 8,
    ipod: 9
}


for product in PRODUCTS.keys
    puts PRODUCTS[product]
end



NEW_PRODUCTS = [
    {name: "guitar", shelf: 10},
    {name: "blender", shelf: 5},
    {name: "ipod", shelf: 3}
]


for product in NEW_PRODUCTS

    if product[:name] == "blender"
        puts "> #{product[:shelf]}"
    end

end
