package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMap {
    String dbURL = "jdbc:oracle:thin:@18.212.94.249:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task01() throws SQLException {

        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select * from employees");

        Map<String, Object> rowMap1 = new HashMap<>();
        rowMap1.put("FIRST_NAME", "Steven");
        rowMap1.put("LAST_NAME", "King");
        rowMap1.put("SALARY", 24000);
        System.out.println(rowMap1);

        System.out.println("==== ROW MAP 2 ====");

        Map<String, Object> rowMap2 = new HashMap<>();
        rowMap2.put("FIRST_NAME", "Neena");
        rowMap2.put("LAST_NAME", "Kocchar");
        rowMap2.put("SALARY", 17000);
        System.out.println(rowMap2);

        /*
        *
        * Continue creating maps for each row until the end of the table
        *
        * */

        List<Map<String,Object>> dataList = new ArrayList<>();

        dataList.add(rowMap1);
        dataList.add(rowMap2);

        // Get the last name of Steven
        System.out.println("Steven's last name is: " + dataList.get(0).get("LAST_NAME"));


        //close conn
        rs.close();
        statement.close();
        conn.close();

    }

    @Test
    public void task02() throws SQLException {
        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select first_name,last_name,salary from employees where rownum<6");


        ResultSetMetaData rsmd = rs.getMetaData();
        rs.next();
        Map<String, Object> rowMap1 = new HashMap<>();
        rowMap1.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap1);
        rs.next();

        System.out.println("==== ROW MAP 2 ====");

        Map<String, Object> rowMap2 = new HashMap<>();
        rowMap2.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap2);


        /*
         *
         * Continue creating maps for each row until the end of the table
         *
         * */

        List<Map<String,Object>> dataList = new ArrayList<>();
        dataList.add(rowMap1);
        dataList.add(rowMap2);

        //Return the last name of Steven
        System.out.println("Steven's last name is: " + dataList.get(0).get(rsmd.getColumnName(2)));

        for (Map<String, Object> eachRowMap : dataList) {

            System.out.println(eachRowMap);

        }
    }

    @Test
    public void task03() throws SQLException {
        // DriverManager class getConneciton is used for to make connection with database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Statemet helps us to execute Query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

        // ResutSet stores data that we get from after query execution
        // rs is just a variable/object name
        ResultSet rs = statement.executeQuery("select first_name,last_name,salary from employees where rownum<6" );
        ResultSetMetaData rsmd = rs.getMetaData();

        List<Map<String,Object>> listOfMaps = new ArrayList<>();

        //iterate through each row dynamically
        while(rs.next()){
            Map<String,Object> rowMap = new HashMap<>();

            //fill this map dynamically
            for (int i = 1; i <= rsmd.getColumnCount(); i++) { //loops 1 to 3
                rowMap.put(rsmd.getColumnName(i),rs.getString(i));
            }
            //add this ready map into the list

            listOfMaps.add(rowMap);
        }




        //close conn
        rs.close();
        statement.close();
        conn.close();
    }
}
