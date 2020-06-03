package com.baemin.util;

public class CoordDistance {

    public static final int BaeDalLimit = 2;

    public static double getDistance(double x1, double y1, double x2, double y2) {
        double r = 6371.0;
        double dLat = deg2rad(y1 - y2);
        double dLon = deg2rad(x1 - x2);

        double a = Math.sin(dLat / 2) * Math.sin(dLon / 2)
                + Math.cos(deg2rad(y1)) * Math.cos(deg2rad(y2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);

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

}