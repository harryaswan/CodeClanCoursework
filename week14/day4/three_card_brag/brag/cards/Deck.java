package brag.cards;

import java.util.*;

public class Deck {

    ArrayList<Card> cards;

    public Deck() {
        cards = shuffleDeck(fillDeck());
    }

    private ArrayList<Card> fillDeck() {
        ArrayList<Card> newCards = new ArrayList<Card>();
        SuitType suits[] = SuitType.values();
        CardType cards[] = CardType.values();

        for (int suit = 0; suit < suits.length; suit++) {
            for (int card = 0; card < cards.length; card++) {
                newCards.add(new Card(suits[suit], cards[card]));
            }
        }

        return newCards;
    }

    private ArrayList<Card> shuffleDeck(ArrayList<Card> cards) {
        Collections.shuffle(cards);
        return cards;
    }

    public void shuffleDeck() {
        this.cards = shuffleDeck(this.cards);
    }

    public Card getCard() {
        return this.cards.remove(0);
    }

    public void addCard(Card card) {
        this.cards.add(card);
    }
}
