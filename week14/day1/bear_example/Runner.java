class Runner {
    public static void main (String[] args) {
        Bear bear = new Bear("Baloo");
        System.out.println("Name: " + bear.getName());
        bear.setName("Yogi");
        System.out.println("Name: " + bear.getName());
    }
}
