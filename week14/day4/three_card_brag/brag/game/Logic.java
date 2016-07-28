package brag.game;

import brag.cards.*;

public class Logic {

    public static WinType check(Card[] cards) {
        WinType win = null;

        if (win == null) {
            win = checkForThrees(cards);
        }

        if (win == null) {
            win = checkForStraightFlush(cards);
        }

        if (win == null) {
            win = checkForRun(cards);
        }

        if (win == null) {
            win = checkForFlush(cards);
        }

        if (win == null) {
            win = checkForPair(cards);
        }

        if (win == null) {
            win = checkForHighCard(cards);
        }

        return win;
    }

    private static WinType checkForThrees(Card[] cards) {
        boolean win = true;
        for (Card card : cards) {
            if (card.getVal() != 3) { win = false; }
        }
        if (win) { return WinType.ALLTHREES; }
        return null;
    }
    private static WinType checkForStraightFlush(Card[] cards) {

        //if checkForRun != null && checkForFlush != null
            //then win

        return null;
    }
    private static WinType checkForRun(Card[] cards) {

        // sort cards by value, if each value is +1 from the previous
            //then win


        return null;
    }
    private static WinType checkForFlush(Card[] cards) {
        boolean win = true;
        SuitType curSuit = cards[0].getSuit();
        for (Card card : cards) {
            if (card.getSuit() != curSuit) { win = false; }
        }

        if (win) { return WinType.FLUSH; }

        return null;
    }
    private static WinType checkForPair(Card[] cards) {

        //check pair

        return null;
    }
    private static WinType checkForHighCard(Card[] cards) {

        //create array of all values
        //get the max
        //something
        return null;
    }


}
