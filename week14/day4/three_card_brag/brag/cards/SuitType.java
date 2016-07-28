package brag.cards;

public enum SuitType {
    HEARTS("Hearts"),
    DIAMONDS("Diamonds"),
    CLUBS("Clubs"),
    SPADES("Spades");

    private String name;

    SuitType(String name) {
        this.name = name;
    }

    public String toString() {
        return this.name;
    }
}
