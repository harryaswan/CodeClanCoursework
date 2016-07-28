package wizard_management;

import behaviours.Attacker;

public class Ogre extends MythicalBeast implements Attacker {

    public Ogre(String name){
        super(name);
    }

    public int attack() {
        return 10;
    }

}
