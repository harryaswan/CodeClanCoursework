public abstract class Bear {

  public abstract String gatherFood();

  public String roar(){
    return "roar!";
  }

  public void typicalDay() {
      wakeUp();
      System.out.println(gatherFood());
      eat();
      sleep();
  }

  public void wakeUp() {
      System.out.println("Wake Up");
  }
  public void eat() {
      System.out.println("Eating");
  }
  public void sleep() {
      System.out.println("Going to sleep");
  }
}
