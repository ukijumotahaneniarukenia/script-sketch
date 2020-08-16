//Copyright 2014 DiUS Computing
//
//
//https://github.com/DiUS/java-faker/blob/master/LICENSE
//
//https://github.com/DiUS/java-faker
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

package app;

import com.github.javafaker.Faker;
import com.github.javafaker.*;
import sun.misc.Signal;

import java.util.*;

public class Address_buildingNumber {

    private static final String DEFAULT_SEPARATOR = " ";
    private static final String SIGNAL_HANDLE_INT = "INT";

    public static void main( String... cmdLineArgs ) {

        trap(new ArrayList<>(Arrays.asList(SIGNAL_HANDLE_INT)));

        if(cmdLineArgs.length > 0){
            usage();
        }else{
            Map<Integer, List<String>> map = sub_process(pre_process(new Scanner(System.in)));

            if(!isSingleRow(map)){
                usage();
            }

            if(!isTwoColumn(map)){
                usage();
            }

            wrapperExecute(map);

        }
    }
    private static void wrapperExecute(Map<Integer, List<String>> map){
        Faker faker = new Faker(new Locale(map.get(0).get(0)));
        Address address = faker.address();
        int cnt = Integer.parseInt(map.get(0).get(1));
        for(int i=0;i<cnt;i++){
            System.out.println(address.buildingNumber());
        }
    }
    private static boolean isSingleRow(Map<Integer, List<String>> map){
        return map.size() == 1;
    }
    private static boolean isTwoColumn(Map<Integer, List<String>> map){
        return map.get(0).size() == 2;
    }
    private static void trap(List<String> list){
        for (String e:list) {
            catch_sig(e);
        }
    }
    private static void catch_sig(String str) {
        Signal sig = new Signal(str);
        Signal.handle(sig, Signal -> {
            if ("INT".equals(sig.getName())) {
                usage();
            }
        });
    }
    private static void usage() {
        System.out.println("Usageだよーん");
        System.out.println("\n" +
                "LOCALE:\n" +
                "a ar\n" +
                "b bg by\n" +
                "c ca ca-CAT cs-CZ\n" +
                "d da-DK de de-AT de-CH\n" +
                "e ee en en-AU en-BORK en-CA en-GB en-IND en-MS en-NEP en-NG en-NZ en-PAK en-SG en-UG en-US en-ZA en-au-ocker es es-MX\n" +
                "f fa fi-FI fr fr-CA fr-CH\n" +
                "h he hu hy\n" +
                "i id in-ID it\n" +
                "j ja\n" +
                "k ko\n" +
                "l lv\n" +
                "n nb-NO nl no-NO\n" +
                "p pl pt pt-BR\n" +
                "r ru\n" +
                "s sk sv sv-SE\n" +
                "t th tr\n" +
                "u uk\n" +
                "v vi\n" +
                "z zh-CN zh-TW\n" +
                "\n" +
                "CMD: echo ja 10 | java -jar /home/aine/script-sketch/java/00011-java-fakerでダミーデータ作成/nnn/target/address-buildingNumber-1.0-SNAPSHOT-jar-with-dependencies.jar" +
                "\n");
        System.exit(0);
    }
    private static List<String> pre_process(Scanner stdin){
        List<String> rt = new ArrayList<>();
        while (stdin.hasNextLine()) {
            rt.add(stdin.nextLine());
        }
        stdin.close();
        return rt;
    }
    private static Map<Integer, List<String>> sub_process(List<String> list){
        Map<Integer, List<String>> rt= new LinkedHashMap<>();
        for (int i=0;i<list.size();i++){
            List<String> l = new ArrayList<>(Arrays.asList(list.get(i).split(DEFAULT_SEPARATOR)));
            rt.put(i,l);
        }
        return rt;
    }
}
