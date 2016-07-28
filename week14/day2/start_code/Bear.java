import java.util.ArrayList;

public class Bear {
    private String name;
    private ArrayList<Edible> belly;

    public Bear(String name){
        this.belly = new ArrayList<Edible>();
        this.name = name;
    }

    public String getName(){
        return name;
    }

    public int foodCount(){
        return belly.size();
    }

    public Edible eat(Edible food){
        belly.add(food);
        if (food.canBeEaten()) {
            return null;
        } else {
            return throwUp();
        }
    }

    public Edible throwUp() {
        if (foodCount() > 0) {
            return belly.remove(belly.size() - 1);
        }
        return null;
    }

    public void sleep(){
        belly.clear();
    }


}
