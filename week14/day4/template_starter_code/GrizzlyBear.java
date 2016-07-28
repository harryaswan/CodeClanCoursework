public class GrizzlyBear extends Bear {
    public String gatherFood() {
        return "Off to FarmFoods";
    }

    @Override
    public void wakeUp() {
        System.out.println("Slept in");
    }
}
