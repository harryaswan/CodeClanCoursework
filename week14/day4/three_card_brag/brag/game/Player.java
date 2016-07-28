package brag.game;

import brag.cards.Hand;
import brag.cards.Card;

public class Player {

    private String name;
    private Hand hand;

    public Player(String name) {
        this.name = name;
        hand = new Hand();
    }

    public Player() {
        this.name = "Player";
        hand = new Hand();
    }

    public void takeCard(Card card) {
        System.out.println(this.name + " got the " + card.toString());
        hand.addCard(card);
    }

    public WinType checkCards() {
        return hand.check();
    }

    public void printCard(int i) {
        System.out.println(hand.seeCard(i).toString());
    }

    public Card[] returnCards() {
        return hand.returnCards();
    }
}
