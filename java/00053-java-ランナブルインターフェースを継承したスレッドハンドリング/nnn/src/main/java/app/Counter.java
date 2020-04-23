package app;

public class Counter {
    private int count;

    public Counter() {
        this.count = 0;
    }

//    public void countUp() {
//        this.count += 1;
//    }

    public synchronized void countUp() {
        this.count += 1;
    }

    public int get() {
        return this.count;
    }
}
