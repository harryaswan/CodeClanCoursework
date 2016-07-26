public class Person {
    String name;
    PersonType type;
    public Person(String name, PersonType type) {
        setName(name);
        setType(type);
    }

    public String getName() {
        return name;
    }
    public PersonType getType() {
        return type;
    }
    public void setName(String name) {
        this.name = name;
    }
    private void setType(PersonType type) {
        this.type = type;
    }



}
