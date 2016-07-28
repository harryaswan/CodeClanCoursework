import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import org.junit.*;

public class BearTest {

    Bear bear;
    Salmon salmon;
    Human human;
    Shoe shoe;
    Tyre tyre;
    Chicken chicken;

    @Before
    public void before() {
        bear = new Bear("Baloo");
        salmon = new Salmon();
        human = new Human();
        shoe = new Shoe();
        tyre = new Tyre();
        chicken = new Chicken();
    }

    @Test
    public void hasName(){
        assertEquals("Baloo", bear.getName());
    }

    @Test
    public void bellyStartsEmpty(){
        assertEquals(bear.foodCount(), 0);
    }

    @Test
    public void canEatSalmon(){
        bear.eat(salmon);
        assertEquals(bear.foodCount(), 1);
    }

    @Test
    public void canEatHuman(){
        bear.eat(human);
        assertEquals(bear.foodCount(), 1);
    }

    @Test
    public void canEatShoe(){
        bear.eat(shoe);
        assertEquals(bear.foodCount(), 0);
    }

    @Test
    public void canEatTyre(){
        bear.eat(tyre);
        assertEquals(bear.foodCount(), 0);
    }

    @Test
    public void canEatChicken(){
        bear.eat(chicken);
        assertEquals(bear.foodCount(), 1);
    }

    @Test
    public void canThrowUp() {
        bear.eat(salmon);
        Edible food = bear.throwUp();
        // assertNotNull(food);
        Salmon origi = (Salmon)food;
        System.out.println(origi.swim());
    }

    @Test
    public void shouldEmptyBellyAfterSleeping(){
        bear.eat(salmon);
        bear.eat(human);
        bear.eat(shoe);
        bear.eat(tyre);
        bear.sleep();
        assertEquals(bear.foodCount(), 0);
    }
}
