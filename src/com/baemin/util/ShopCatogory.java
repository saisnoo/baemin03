package com.baemin.util;

import java.util.Hashtable;

public class ShopCatogory {

    private static Hashtable<String, String> kor2engCategory = new Hashtable<>();

    static {
        kor2engCategory.put("korean", "한식");
        kor2engCategory.put("western", "양식");
        kor2engCategory.put("chinese", "중식");
        kor2engCategory.put("japanese", "일식");
        kor2engCategory.put("pizza", "피자");
        kor2engCategory.put("chicken", "치킨");
        kor2engCategory.put("hamburger", "햄버거");
        kor2engCategory.put("cafe", "카페");
    }

    public static String eng2kor(String eng) {
        return kor2engCategory.get(eng);
    }

}