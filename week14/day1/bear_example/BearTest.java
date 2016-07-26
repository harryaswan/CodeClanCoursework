import static org.junit.Assert.assertEquals;
import org.junit.*;


public class BearTest {

    Bear bear;
    Salmon salmon;

    @Before
    public void setup() {
        bear = new Bear("Baloo");
        salmon = new Salmon();
    }

    @Test
    public void hasName() {
        // Bear bear = new Bear("Baloo");
        assertEquals("Baloo", bear.getName());
    }

    @Test
    public void canEatSalmon() {
        bear.eat(salmon);
        assertEquals(1, bear.foodCount());
    }

    @Test
    public void tooManySalmon() {

        for (int i = 0; i < 20; i++) {
            bear.eat(salmon);
        }

        assertEquals(5, bear.foodCount());
    }

    @Test
    public void hasAge() {
        Bear bear = new Bear(5);
        assertEquals(5, bear.getAge());
    }

    @Test
    public void hasWeight() {
        Bear bear = new Bear("Baloo", 25, 42.4f);
        assertEquals(42.4f, bear.getWeight(), 0.1);
    }

    @Test
    public void isHibernationReady() {
        Bear bear = new Bear("Baloo", 25, 50f, 0.9f);
        assertEquals(true, bear.hibernationReady());
    }

    @Test
    public void isNotHibernationReady() {
        Bear bear = new Bear("Baloo", 25, 15f, 0.95f);
        assertEquals(false, bear.hibernationReady());
    }
}
