package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {
    String dbURL = "jdbc:oracle:thin:@18.212.94.249:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";
    @Test
    public void task01 () throws SQLException{


        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement();

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select * from departments where manager_id is not null");

        //10-Administration-200-1700

        //getting each row dynamically
        while (rs.next()) {
            System.out.println(rs.getString(1) + "-" + rs.getString(2) + "-" + rs.getString(3)+ "-" + rs.getString(4));
        }

        /*
        can we use more than one query in one connection to get data?
        YES
         */

        rs = statement.executeQuery("select * from REGIONS");

//        1-Europe
//        2-Americas
//        ...

        while(rs.next()){
            System.out.println(rs.getString(1) +"-"+rs.getString(2));
        }



        //close conn
        rs.close();
        statement.close();
        conn.close();
    }
}
