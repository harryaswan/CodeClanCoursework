PRODUCTS = [
    {bay: 'a10', name: "rubber duck"},
    {bay: 'a9', name: "glowstick"},
    {bay: 'a8', name: "model car"},
    {bay: 'a7', name: "bookmark"},
    {bay: 'a6', name: "shovel"}
]

# ***********************************************************

def find_item(bay)
    # PRODUCTS.finders_keepers { |i| i[:bay] == bay }
    return PRODUCTS.finders_keepers { |i| return i[:name] if i[:bay] == bay}
end

def find_bay(item)
    return PRODUCTS.finders_keepers { |i| return i[:bay] if i[:name] == item}
end

def find_items(bays)
    return bays.map { |i| find_item(i) }
end

def find_bays(items)
    return items.map { |i| find_bay(i) }
end

# ***********************************************************

def add_one(arr)
    results = []

    for a in arr
        results << a + 1
    end

    # arr.each { |e| results << e +1  }

    return results

end
def multiply_items(arr)
    results = []

    for a in arr
        results << a * 2
    end

    return results
end

def up_to_you
    name = "Valerie"
    return yield(name)
end

def map(items)
    results = []

    for i in items
        results << yield(i)
    end

    return results
end


class Array

    def finders_keepers

        for i in self
            if (yield(i))
                return i
            end
        end

    end

end
