package brag.cards;

import brag.game.*;

public class Hand {
    Card[] cards;
    WinType win;

    public Hand() {
        cards = new Card[3];
        win = null;
    }

    public void addCard(Card card) {
        for (int i = 0; i < 3; i++) {
            if (cards[0] == null) {
                cards[i] = card;
                return;
            }
        }
    }

    public WinType check() {
        return Logic.check(cards);
    }

    public Card[] returnCards() {
        Card[] tempCards = this.cards;
        this.cards = new Card[3];
        return tempCards;
    }

    public Card seeCard(int i) {
        if (i >= 0 || i <= 2) {
            return cards[i];
        }
        return null;
    }

}
