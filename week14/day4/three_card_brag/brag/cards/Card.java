package brag.cards;


public class Card {

    SuitType suit;
    CardType card;

    public Card(SuitType suit, CardType card) {
        this.suit = suit;
        this.card = card;
    }

    public String toString() {
        return card.toString() + " of " + suit.toString();
    }

    public SuitType getSuit() {
        return this.suit;
    }

    public CardType getCard() {
        return this.card;
    }
}
