
lines = ['Gyle Centre', 'Edinburgh Park', 'Murrayfield Stadium', 'Haymarket', 'Princes Street']

stops = lines.length

ed_prk = lines[1]

pnc_st = lines[4]
pnc_st = lines[-1]
pnc_st = lines.at(4)
pnc_st = lines.last
pnc_st = lines.pop

hym = lines.index("Haymarket")

lines.unshift("Airport")

lines << "York Place"

lines.delete("Edinburgh Park")
lines.delete_at(1) #"Edinburgh Park" is no longer at position 1 but this would delete it if it were there

reversed_lines = lines.reverse

i=0
while i < lines.length
    puts lines[i]
    i += 1
end

i=0
loop do
    puts lines[i]
    i += 1
    if i == lines.length
        break
    end
end

for l in lines
    puts l
end

i = 0
while i < lines.length
    put lines[i]
    i += 1
end


#####################################################

my_hash = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}

a = my_hash[1]
b = my_hash[:two]
c = my_hash["two"]

my_hash[3] = "Three"
my_hash[:four] = 4

## or ##

my_hash[:other] = {3 => "Three"}

#####################################################


users = {
    "Jonathan" => {
      :twitter => "jonnyt",
      :favourite_numbers => [12, 42, 75, 12, 5],
      :home_town => "Stirling",
      :pets => {
        "fluffy" => :cat,
        "fido" => :dog,
        "spike" => :dog
      }
    },
    "Erik" => {
      :twitter => "eriksf",
      :favorite_numbers => [8, 12, 24],
      :home_town => "Linlithgow",
      :pets => {
        "blinky" => :fish,
        "kevin" => :fish,
        "spike" => :dog,
        "fang" => :parrot
      }
    },
    "Anil" => {
      :twitter => "bridgpally",
      :favorite_numbers => [12, 14, 85, 88],
      :home_town => "Dunbar",
      :pets => {
        :colin => :snake
      }
    },
  }



jon_twitter = users["Jonathan"][:twitter]
erik_home = users["Erik"][:home_town]
erik_nums = users["Erik"][:favorite_numbers]
anil_pet = users["Anil"][:pets][:colin]
erik_small_num = users["Erik"][:favorite_numbers].min

anil_even_nums = []
for x in users["Anil"][:favorite_numbers]
    if x.even?
        anil_even_nums << x
    end
end

jon_fav_nums = users["Jonathan"][:favourite_numbers].sort.uniq
users["Erik"][:favorite_numbers] << 7
users["Erik"][:home_town] = "Edinburgh"
users["Erik"][:pets]["Fluffy"] = :dog

users["Harry"] = {
    twitter: "harryaswan",
    favorite_numbers: [30, 22, 10, 5],
    home_town: "Perth",
    pets: {"Dora" => :dog}
}
