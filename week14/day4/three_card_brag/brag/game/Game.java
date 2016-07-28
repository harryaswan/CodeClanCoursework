package brag.game;

import brag.cards.*;

public class Game {

    Player[] players;
    Deck deck;

    public Game(String[] names) {
        setupPlayers(names);

        deck = new Deck();

        dealCards();

        whoWins();

    }

    private void setupPlayers(String[] names) {
        this.players = new Player[names.length];
        for(int i = 0; i < names.length; i++) {
            if (this.players[i] == null) {
                this.players[i] = new Player(names[i]);
            }
        }
    }

    private void dealCards() {
        for (int deal = 0; deal < 3; deal++) {
            for(int i = 0; i < this.players.length; i++) {
                this.players[i].takeCard(deck.getCard());
            }
        }
    }

    public int numOfPlayers() {
        return this.players.length;
    }

    private void whoWins() {
        WinType[] wins = new WinType[this.players.length];
        for(int i = 0; i < this.players.length; i++) {
            wins[i] = this.players[i].checkCards();
            System.out.println(this.players[i].checkCards());
        }

        System.out.println();

        for(int i = 0; i < wins.length; i++) {
            if (wins[i] != null) {
                System.out.println("Player " + Integer.toString(i) + " got: " + Integer.toString(wins[i].getVal()));
            } else {
                System.out.println("Player got nothing");
            }
        }

    }
}
