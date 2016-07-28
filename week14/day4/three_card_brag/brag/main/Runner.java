
import brag.game.*;

public class Runner {
    public static void main(String[] args) {
        String[] names = {"Harry", "Becky", "Seumus", "Zak"};
        Game game = new Game(names);
        System.out.println("Players: " + Integer.toString(game.numOfPlayers()));


    }
}
