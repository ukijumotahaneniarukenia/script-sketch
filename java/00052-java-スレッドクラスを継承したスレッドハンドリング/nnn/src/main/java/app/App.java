package app;

public class App {
    static class JJJ extends Thread{
        private Integer mx;
        public JJJ(Integer n){
            this.mx=n;
        }
        @Override
        public void run(){
            for(int i=0;i<mx;i++){
                System.out.println( "もりもり"+"-"+i );
            }
        }
    }
    public static void main( String[] args ) {

        JJJ jjj = new JJJ(10);

        jjj.start();

        for(int i=0;i<3;i++){
            System.out.println( "森鴎外"+"-"+i );
        }
        jjj.start();//呼んでは行けない
    }
}