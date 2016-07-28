package wizard_management;
import behaviours.*;

public abstract class MythicalBeast implements Mortal {

  String name;
  int health;

  public MythicalBeast(String name){
    this.name = name;
    this.health = 100;
  }

  public String getName(){
    return this.name;
  }

  public int getHealth() {
      return this.health;
  }

  public void defend(Attacker attacker) {
      int damage = attacker.attack();
      this.health -= (damage - 5);
  }

  public boolean isAlive() {
      return (this.health > 0);
  }
}
