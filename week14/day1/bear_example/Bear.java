public class Bear {

    private String name;
    private int age, salmonCount;
    private float weight, height;
    private Salmon[] belly;

    public Bear (String inName) {
        setName(inName);
        belly = new Salmon[5];
        salmonCount = 0;
    }

    public Bear (int inAge) {
        setAge(inAge);
    }

    public Bear (String inName, int inAge) {
        setName(inName);
        setAge(inAge);
    }

    public Bear (String inName, int inAge, float inWeight) {
        setName(inName);
        setAge(inAge);
        setWeight(inWeight);
    }
    public Bear (String inName, int inAge, float inWeight, float inHeight) {
        setName(inName);
        setAge(inAge);
        setWeight(inWeight);
        setHeight(inHeight);
    }

    public String getName() {
        return name;
    }
    public void setName(String inName) {
        name = inName;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int inAge) {
        if (inAge > 0) {
            age = inAge;
        }
    }
    public float getWeight() {
        return weight;
    }
    public void setWeight(float inWeight) {
        if (inWeight > 0) {
            weight = inWeight;
        }
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float inHeight) {
        if (inHeight > 0) {
            height = inHeight;
        }
    }

    public boolean hibernationReady() {
        return (weight / (height*height) > 30);
        // return (weight > 80);
    }

    public void eat(Salmon salmon) {
        if (!bellyFull()) {
            belly[salmonCount] = salmon;
            salmonCount++;
        }
    }

    public boolean bellyFull() {
        return (salmonCount >= belly.length);
    }

    public int foodCount() {
        return salmonCount;
    }

    public void sleep() {
        for (int i=0; i < belly.length; i++) {
            belly[i] = null;
        }
        salmonCount = 0;
    }


}
