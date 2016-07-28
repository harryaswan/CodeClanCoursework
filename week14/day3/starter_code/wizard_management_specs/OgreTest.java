import static org.junit.Assert.*;
import org.junit.*;
import wizard_management.*;

public class OgreTest {

  Ogre ogre;

  @Before
  public void before(){
    ogre = new Ogre("Freddie");
  }

  @Test
  public void hasName(){
    assertEquals("Freddie", ogre.getName());
  }
  @Test
  public void hasHealth() {
      assertEquals(100, ogre.getHealth());
  }
    @Test
    public void isAlive() {
        assertEquals(true, ogre.isAlive());
    }
  @Test
  public void canBeAttackedByWizard() {
      Wizard wizard = new Wizard("Frank", new Dragon("John"));
      ogre.defend(wizard);
      assertEquals(65, ogre.getHealth());
  }

  @Test
  public void canBeAttackedByDragon() {
      Dragon dragon = new Dragon("Colin");
      ogre.defend(dragon);
      assertEquals(75, ogre.getHealth());
  }
}
