package behaviours;

public interface Mortal {
    public int getHealth();
    public void defend(Attacker attacker);
    public boolean isAlive();
}
