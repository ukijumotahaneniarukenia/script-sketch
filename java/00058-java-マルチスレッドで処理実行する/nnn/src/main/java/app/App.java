package app;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class App {
    private static final Integer MAX_THREAD_POOL_SIZE = 2;// 最大スレッドプール数 こっちが律速 使用できるモニター領域を調節できる
    private static final Integer EXEC_TASK_SIZE = 5;// 実行タスク数
    private static final String START_MSG ="START";// 開始メッセージ
    private static final String END_MSG ="END";// 終了メッセージ

    private static final String SALT_LFT ="[";
    private static final String SALT_MID ="-";
    private static final String SALT_RGT ="]";
    private static final String DATE_TIME_FORMAT ="uuuu-MM-dd HH:mm:ss.SSS";
    private static final String SEPARATOR ="\t";
    private static final Long SLEEP_TIME =9000L;//9秒

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_TIME_FORMAT);

    private static void logger(String d,String... m){
        String dtm = Stream.of(d).collect(Collectors.joining(SALT_MID));
        String msg = Stream.of(m).collect(Collectors.joining(SALT_MID,SALT_LFT,SALT_RGT));
        System.out.println(dtm+SEPARATOR+msg);
    }

    public static void main(String[] args) {
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();

        logger(LocalDateTime.now().format(formatter),START_MSG,methodName);

        wrapperExecuteMultiThread(MAX_THREAD_POOL_SIZE);// 最大スレッドプールサイズの指定して、マルチスレッド実行

        try {
            Thread.sleep(SLEEP_TIME);// 全スレッドの実行終了まで待つ
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        logger(LocalDateTime.now().format(formatter),END_MSG,methodName);
    }

    private static void wrapperExecuteMultiThread(Integer maxThreadPoolSize) {
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        logger(LocalDateTime.now().format(formatter),START_MSG,methodName);

        executeMultiThread(maxThreadPoolSize);

        logger(LocalDateTime.now().format(formatter),END_MSG,methodName);
    }

    private static void executeTask(ExecutorService exec,MultiTask service){
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        logger(LocalDateTime.now().format(formatter),START_MSG,methodName);

        exec.submit(service);//タスク呼び出し

        //待ち合わせしたい

        logger(LocalDateTime.now().format(formatter),END_MSG,methodName);
    }

    private static void executeMultiThread(Integer maxThreadPoolSize) {
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        logger(LocalDateTime.now().format(formatter),START_MSG,methodName);

        //preProcess
        ExecutorService exec = Executors.newFixedThreadPool(maxThreadPoolSize);

        //mainProcess
        for (int i=0;i <EXEC_TASK_SIZE; i++) {
            Integer taskNum = i+1;
            MultiTask service = new MultiTask(taskNum);

            //指定個数ずつ渡したい
            executeTask(exec,service);
        }
        //postProcess
        exec.shutdown();
        logger(LocalDateTime.now().format(formatter),END_MSG,methodName);
    }
}