package app;

public class App {
    //https://java2005.cis.k.hosei.ac.jp/materials/lecture26/multithreaded.html
    public static void main( String[] args ) throws InterruptedException {
        Counter counter = new Counter();
        CountUpTask task = new CountUpTask(counter);
        Thread thread1 = new Thread(task);
        Thread thread2 = new Thread(task);

        // カウントを開始する
        thread1.start();
        thread2.start();

        // カウントアップが終了するまで待機
        thread1.join();
        thread2.join();

        // カウンタの値を表示する
        System.out.println(counter.get());
    }
}