package brag.game;

public enum WinType {

    ALLTHREES(1),
    STRAIGHTFLUSH(2),
    RUN(3),
    FLUSH(4),
    PAIR(5),
    HIGHCARD(6);

    private int value;

    WinType(int value) {
        this.value = value;
    }

    public int getVal() {
        return this.value;
    }

}
