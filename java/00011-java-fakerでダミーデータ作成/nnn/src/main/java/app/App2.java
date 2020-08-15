package app;

import com.github.javafaker.Faker;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class App2
{
    public static void main(String[] args) {
        for(int i=0;i<genHumanName(100000).size();i++){
            System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\n",genHumanName(100000).get(i),genAvatar(100000).get(i),genDateAndTime(100000).get(i),genJob(100000).get(i),genAddress(100000).get(i),genPhoneNumberCellPhone(100000).get(i));
        }
    }
    private static List<String> genAddress(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker(new Locale("ja_JP"));
        for(int i=0;i<n;i++){
            rt.add(faker.address().state()+faker.address().cityName()+faker.address().streetName()+faker.address().streetAddressNumber());
        }
        return rt;
    }
    private static List<String> genHumanName(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker(new Locale("ja_JP"));
        for(int i=0;i<n;i++) {
            rt.add(faker.name().fullName());
        }
        return rt;
    }
    private static List<String> genAvatar(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker();
        for(int i=0;i<n;i++) {
            rt.add(faker.avatar().image());
        }
        return rt;
    }
    private static List<String> genPhoneNumberCellPhone(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker(new Locale("ja_JP"));
        for(int i=0;i<n;i++) {
            rt.add(faker.phoneNumber().cellPhone());
        }
        return rt;
    }
    private static List<String> genJob(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker();
        for(int i=0;i<n;i++) {
            rt.add(faker.company().name() + faker.job().title());
        }
        return rt;
    }
    private static List<String> genDateAndTime(Integer n){
        List<String> rt = new ArrayList<>();
        Faker faker = new Faker();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(int i=0;i<n;i++) {
            rt.add(sdf.format(faker.date().birthday()));
        }
        return rt;
    }
}