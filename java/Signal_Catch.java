import sun.misc.Signal;

public class Signal_Catch {
    public static void main(String[] rsv_args) {
        //https://qiita.com/ine1127/items/5523b1b674492f14532a
        //https://rosettacode.org/wiki/Handle_a_signal#Java
        trap(new String[]{"INT"});
        while (true) {
            try {
                Thread.sleep(500);
                System.out.println("Now Process...");
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
            }
        }
    }
    private static void trap(String[] sig_args){
        for (String sig:sig_args) {
            catch_sig(sig);
        }
    }
    //https://blog.no42.org/code/docker-java-signals-pid1/
    private static void usage() {
        System.out.println("Usage:\n" +
                "");
        System.exit(1);
    }
    private static void catch_sig(String sig) {
        Signal signal = new Signal(sig);
        Signal.handle(signal, Signal -> {
            System.out.println("Signal received: " + signal.getName());
            if ("INT".equals(signal.getName())) {
                usage();
            }
        });
    }
}