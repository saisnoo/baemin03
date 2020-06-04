package com.baemin.util;

public class CoordDistance {

    public static final double BaeDalLimit = 2.0;

    public static double getDistance(double x1, double y1, double x2, double y2) {

        double lat1 = Math.min(x1, y1);
        double lng1 = Math.max(x1, y1);
        double lat2 = Math.min(x2, y2);
        double lng2 = Math.max(x2, y2);

        double r = 6371.0;
        double dLat = deg2rad(lat2 - lat1);
        double dLon = deg2rad(lng2 - lng1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double d = r * c;// Km단위
        return d;
    }

    private static double deg2rad(double deg) {
        return deg * (Math.PI / 180);
    }
    // function getDistanceFromLatLonInKm(lat1, lng1, lat2, lng2) {
    // function deg2rad(deg) {
    // return deg * (Math.PI / 180)
    // }

    // var R = 6371; // Radius of the earth in km
    // var dLat = deg2rad(lat2 - lat1); // deg2rad below
    // var dLon = deg2rad(lng2 - lng1);
    // var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    // Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
    // Math.sin(dLon / 2) * Math.sin(dLon / 2);
    // var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    // var d = R * c; // Distance in km
    // return d;
    // }

    public static void main(String[] args) {

        double x1 = 126.477632596019;
        double y1 = 37.4562891099177;
        double x2 = 128.951560549331;
        double y2 = 37.7709516183773;

        double distance = CoordDistance.getDistance(y1, x1, y2, x2);
        double distance2 = CoordDistance.getDistance(x1, y1, y2, x2);

        System.out.println("distance\t" + distance);
        System.out.println("distance2\t" + distance2);

        // distance 220.69381274592408
        // distance2 220.69381274592408
        // javascipt 계산결과 = 220.69381274592408

    }

}