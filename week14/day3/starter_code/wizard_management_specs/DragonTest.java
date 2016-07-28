import static org.junit.Assert.*;
import org.junit.*;
import wizard_management.*;

public class DragonTest {

  Dragon dragon;

  @Before
  public void before(){
    dragon = new Dragon("Bob");
  }

  @Test
  public void hasName(){
    assertEquals("Bob", dragon.getName());
  }

  @Test
  public void canFly(){
    assertEquals(dragon.fly(),"Standing up tall, beating wings, lift off!");
  }
  @Test
  public void hasHealth() {
      assertEquals(100, dragon.getHealth());
  }
    @Test
    public void isAlive() {
        assertEquals(true, dragon.isAlive());
    }

    @Test
    public void canBeAttackedByWizard() {
        Wizard wizard = new Wizard("Gary", new Dragon("Dave"));
        dragon.defend(wizard);
        assertEquals(65, dragon.getHealth());
    }
    @Test
    public void canBeAttackedByOgre() {
        Ogre ogre = new Ogre("Larry");
        dragon.defend(ogre);
        assertEquals(95, dragon.getHealth());
    }

}
