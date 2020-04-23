package app;

public class CountUpTask implements Runnable {

    private Counter counter;

    public CountUpTask(Counter c) {
        this.counter = c;
    }

    // run メソッドで 10 回だけカウントアップする
    public void run() {
        for (int i = 0; i < 10; i++) {
            this.counter.countUp();
        }
    }
}