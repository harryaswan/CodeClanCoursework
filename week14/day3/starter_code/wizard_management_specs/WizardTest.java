import static org.junit.Assert.*;
import org.junit.*;
import wizard_management.*;
import behaviours.Mortal;

public class WizardTest {

  Wizard wizard;
  Broomstick broomstick;

  @Before
  public void before(){
    broomstick = new Broomstick("Nimbus", 10);
    wizard = new Wizard("Toby", broomstick);
  }

  @Test
  public void hasName(){
    assertEquals("Toby", wizard.getName());
  }

  @Test
  public void hasBroomstick(){
    assertEquals("Nimbus", ((Broomstick)wizard.getRide()).getBrand());
  }

  @Test
  public void hasHealth() {
      assertEquals(100, wizard.getHealth());
  }

  @Test
  public void isAlive() {
      assertEquals(true, wizard.isAlive());
  }
  
  @Test
  public void canFly(){
    assertEquals(wizard.fly(),"mounting broom, running, skipping, flying!");
  }

  @Test
  public void canFlyDragon() {
      Dragon dragon = new Dragon("Elliot");
      wizard = new Wizard("Pete", dragon);
      assertEquals("Standing up tall, beating wings, lift off!", wizard.fly());
  }
  @Test
  public void canFlyMagicCarpet() {
      MagicCarpet carpet = new MagicCarpet("purple");
      wizard = new Wizard("Toby", carpet);
      assertEquals("Hovering up, straightening out, flying off!", wizard.fly());
  }
  @Test
  public void canChangeFlyable() {
      Dragon dragon = new Dragon("Elliot");

      assertEquals(wizard.fly(),"mounting broom, running, skipping, flying!");

      wizard.setRide(dragon);

      assertEquals("Standing up tall, beating wings, lift off!", wizard.fly());
  }

  @Test
  public void canGetAttackedByDragon() {
      Dragon dragon = new Dragon("Tim");

      wizard.defend(dragon);

      assertEquals(85, wizard.getHealth());
  }

    @Test
    public void canGetAttackedByOgre() {
        Ogre ogre = new Ogre("Eric");

        wizard.defend(ogre);

        assertEquals(95, wizard.getHealth());
    }

}
