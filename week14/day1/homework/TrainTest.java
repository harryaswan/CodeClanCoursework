import static org.junit.Assert.assertEquals;
import org.junit.*;

public class TrainTest {

    Train train;

    @Before
    public void setup() {
        train = new Train("ScotRail", "Gordon", 30);
    }

    @Test
    public void hasOperator() {
        assertEquals("ScotRail", train.getOperator());
    }

    @Test
    public void hasDriver() {
        assertEquals(true, train.hasDriver());
    }

    @Test
    public void canAddPassenger() {
        train.addPerson("John", PersonType.PASSENGER);
        assertEquals(1, train.numOfPassengers());
    }

    @Test
    public void canAddMultiplePassengers() {
        train.addPerson("John", PersonType.PASSENGER);
        train.addPerson("Dave", PersonType.PASSENGER);
        train.addPerson("Colin", PersonType.PASSENGER);
        assertEquals(3, train.numOfPassengers());
    }

    @Test
    public void canRemovePassenger() {
        train.addPerson("John", PersonType.PASSENGER);
        train.addPerson("Dave", PersonType.PASSENGER);
        train.addPerson("Colin", PersonType.PASSENGER);
        train.removePassenger("Dave");
        assertEquals(2, train.numOfPassengers());
    }

    @Test
    public void canAddConductor() {
        train.addPerson("Frank", PersonType.CONDUCTOR);
        assertEquals(0, train.numOfPassengers());
        assertEquals("Frank", train.getStaff(PersonType.CONDUCTOR).getName());
    }
}
