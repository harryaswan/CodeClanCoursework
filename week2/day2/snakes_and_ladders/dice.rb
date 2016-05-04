class Dice

    def initialize()
        @rnd = Random.new()
    end

    def roll()
        return @rnd.rand(1..6)
    end

    def draw(x)
        out = ""
        case x
        when 1
            out << " -------\n"
            out << "|       |\n"
            out << "|   O   |\n"
            out << "|       |\n"
            out << " -------\n"
        when 2
            out << " -------\n"
            out << "| O     |\n"
            out << "|       |\n"
            out << "|     O |\n"
            out << " -------\n"
        when 3
            out << " -------\n"
            out << "|     O |\n"
            out << "|   O   |\n"
            out << "| O     |\n"
            out << " -------\n"
        when 4
            out << " -------\n"
            out << "| O   O |\n"
            out << "|       |\n"
            out << "| O   O |\n"
            out << " -------\n"
        when 5
            out << " -------\n"
            out << "| O   O |\n"
            out << "|   O   |\n"
            out << "| O   O |\n"
            out << " -------\n"
        when 6
            out << " -------\n"
            out << "| O   O |\n"
            out << "| O   O |\n"
            out << "| O   O |\n"
            out << " -------\n"
        end
    end

end
