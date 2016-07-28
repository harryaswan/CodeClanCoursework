package wizard_management;
import behaviours.*;

public class Wizard implements Mortal, Attacker{
    private String name;
    private Flyable ride;
    private int health;

    public Wizard(String name, Flyable ride){
        this.name = name;
        this.ride = ride;
        this.health = 100;
    }

    public String getName(){
        return this.name;
    }

    public Flyable getRide(){
        return this.ride;
    }

    public void setRide(Flyable ride) {
        this.ride = ride;
    }

    public String fly(){
        return this.ride.fly();
    }

    public int getHealth() {
        return this.health;
    }

    public void defend(Attacker attacker) {
        int damage = attacker.attack();
        // int defendValue = new Random().nextInt(damage);
        int defendValue = (damage/2);
        this.health -= damage - defendValue;
    }

    public boolean isAlive() {
        return (this.health > 0);
    }

    public int attack() {
        return 40;
    }
}
