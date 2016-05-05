# module Pokemon
#
#     class Array
#
#         def pokemon
#             return "Bulbasour"
#         end
#
#         def joke
#             return ['How do you get Pikachu on a bus....', 'POKEMON!']
#         end
#
#         def attack
#             return "something"
#         end
#
#         def [](index)
#             return "Pika!"
#         end
#
#     end
#
# end
module CrazyMath
    PI = 100
    class Test
        def return_pi
            return PI
        end
    end
end

class RickMath

    include(CrazyMathTest)


end


rick = RickMath.new()
puts rick.return_pi
