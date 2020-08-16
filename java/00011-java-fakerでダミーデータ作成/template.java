    private static void wrapperExecute(Map<Integer, List<String>> map){
        Faker faker = new Faker(new Locale(map.get(0).get(0)));
        TOBE_REPLACE_UPCAMEL TOBE_REPLACE_DOWNCAMEL = faker.TOBE_REPLACE_DOWNCAMEL();
        int cnt = Integer.parseInt(map.get(0).get(1));
        for(int i=0;i<cnt;i++){
            System.out.println(TOBE_REPLACE_DOWNCAMEL.TOBE_REPLACE_METHOD());
        }
    }
