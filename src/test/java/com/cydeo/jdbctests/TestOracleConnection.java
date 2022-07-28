package com.cydeo.jdbctests;

import javax.swing.plaf.nimbus.State;
import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {



        String dbURL = "jdbc:oracle:thin:@18.212.94.249:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement();

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select * from regions");

          /*
        How to run query?
        - Highlight query
        - CTRL+Enter
        - Choose selection
         */


        // next() --> move the cursor to the next line
        rs.next();

        /* getInt(Index) will return Int if we have Int value in that column
            - index starts from 1 with SQL tables
           getInt(ColumnLable)
         */
        System.out.println(rs.getInt(1));
        System.out.println(rs.getInt("REGION_ID"));

        //get the region name
        System.out.println(rs.getString(2));
        System.out.println(rs.getString("REGION_NAME"));

        //move to the next row
        rs.next();

        // 2 - Americas
        System.out.println(rs.getInt("REGION_ID") + " - " + rs.getString("REGION_NAME"));

        //move to the next row
        rs.next();

        //Europe
        System.out.println(rs.getInt(1) + " - " + rs.getString(2));

//        Middle East and Africa
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

//        rs.next();
//        System.out.println(rs.getString(1) + " - " + rs.getString(2)); --doesn't work because no more rows left in the table


        //won't work because the pointer is already in the last row.
        while (rs.next()){
            System.out.println(rs.getString(1) + " - " + rs.getString(2));
        }






    }
}
