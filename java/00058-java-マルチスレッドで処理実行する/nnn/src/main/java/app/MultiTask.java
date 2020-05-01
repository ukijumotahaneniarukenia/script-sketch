package app;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class MultiTask implements Runnable {

    private int taskNum;

    private static final String START_MSG ="START";// 開始メッセージ
    private static final String END_MSG ="END";// 終了メッセージ

    private static final String SALT_LFT ="[";
    private static final String SALT_MID ="-";
    private static final String SALT_RGT ="]";
    private static final String DATE_TIME_FORMAT ="uuuu-MM-dd HH:mm:ss.SSS";
    private static final String SEPARATOR ="\t";
    private static final Long SLEEP_TIME =2000L;//2秒

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_TIME_FORMAT);

    public MultiTask (int n) {
        this.taskNum = n;
    }

    public Integer getTaskNum(){
        return taskNum;
    }
    private static void logger(String d,String... m){
        String dtm = Stream.of(d).collect(Collectors.joining(SALT_MID));
        String msg = Stream.of(m).collect(Collectors.joining(SALT_MID,SALT_LFT,SALT_RGT));
        System.out.println(dtm+SEPARATOR+msg);
    }
    public void run() {
        final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
        logger(LocalDateTime.now().format(formatter),START_MSG,methodName,"threadID", String.valueOf(Thread.currentThread().getId()),"taskNum" ,String.valueOf(getTaskNum()));
        try {
            Thread.sleep(SLEEP_TIME);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        logger(LocalDateTime.now().format(formatter),END_MSG,methodName,"threadID", String.valueOf(Thread.currentThread().getId()),"taskNum" ,String.valueOf(getTaskNum()));
    }
}