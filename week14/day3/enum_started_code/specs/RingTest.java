import static org.junit.Assert.*;
import org.junit.*;
import jewellery.*;

public class RingTest {

    Ring ring;

    @Before
    public void before(){
        ring = new Ring(MetalType.GOLD);
    }

    @Test
    public void canGetMetal(){
        assertEquals(MetalType.GOLD, ring.getMetal());
    }
    @Test
    public void canGetNoGemSet(){
        assertEquals(GemType.NONE, ring.getGem());
    }
    @Test
    public void canGetGem(){
        ring = new Ring(MetalType.GOLD, GemType.TANZANTITE);
        assertEquals(GemType.TANZANTITE, ring.getGem());
    }

}
