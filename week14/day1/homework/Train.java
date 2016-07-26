public class Train {

    private Person[] passengers, staff;
    private int passengerCount, maxPassengers;
    private String operator;


    public Train (String operator, String driversName, int maxPassengers) {
        passengerCount = 0;
        staff = new Person[2];
        passengers = new Person[maxPassengers];
        setOperator(operator);
        addPerson(driversName, PersonType.DRIVER);
    }

    public String getOperator() {
        return operator;
    }
    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Person getStaff(PersonType type) {
        if (type == PersonType.DRIVER) {
            return staff[0];
        } else {
            return staff[1];
        }
    }

    public Person[] getPassengers() {
        Person[] currentPassengers = new Person[passengerCount];
        for (int i = 0; i < passengerCount; i++) {
            currentPassengers[i] = passengers[i];
        }
        return currentPassengers;
    }

    public void addPerson(String name, PersonType type) {
        Person newPerson = new Person(name, type);
        switch (newPerson.getType()) {
            case PASSENGER:
                if (trainFull() && !(hasDriver())) break;
                passengers[passengerCount] = newPerson;
                passengerCount++;
                break;
            case DRIVER:
                staff[0] = newPerson;
                break;
            case CONDUCTOR:
                staff[1] = newPerson;
                break;
        }
    }

    public void removePassenger(String name) {
        for (int i = 0; i < passengerCount; i++) {
            if (passengers[i].getName() == name) {
                for (int y = i; y < passengerCount; y++) {
                    if (y-1 >= 0) {
                        passengers[y-1] = passengers[y];
                    }
                }
                passengers[passengerCount-1] = null;
                passengerCount--;
                return;
            }
        }
    }

    public void listPassengers() {
        for (int i=0; i<passengerCount; i++) {
            System.out.println(Integer.toString(i) + passengers[i].getName());
        }
    }

    public boolean trainFull() {
        return (passengerCount >= maxPassengers);
    }

    public boolean hasDriver() {
        return (staff[0].getType() == PersonType.DRIVER);
    }

    public int numOfPassengers() {
        return passengerCount;
    }

}
