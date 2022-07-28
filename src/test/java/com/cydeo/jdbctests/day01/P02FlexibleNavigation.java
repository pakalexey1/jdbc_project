package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02FlexibleNavigation {
    String dbURL = "jdbc:oracle:thin:@18.212.94.249:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";
    @Test
    public void task02() throws SQLException{

        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select * from employees");

//        first row
        rs.next();
        System.out.println(rs.getString(1) + " " + rs.getString(2));

//        second row
        rs.next();
        System.out.println(rs.getString(1) + " " + rs.getString(2));

        /*
        * Result.Set.TYPE_SCROLL_INSENSITIVE --> to allow dynamic cursor scroll and jump to specific rows
        *                                        we are going use that as a parameter in the createStatement
        * ResultSet.CONCUR_READ_ONLY         --> we are saying I am not going to update in the database == read ONLY.
        * */

//        last row --> moves the cursor to the last row in this ResultSet object
        rs.last();
        System.out.println(rs.getString(1) + " " + rs.getString(2));

//        getRow -- Retrieves teh current row number
        System.out.println("Get ROW=======");
        int row = rs.getRow();
        System.out.println(row); //107

//        jump to row 10
        System.out.println("=====Absolute=====");
        rs.absolute(10);
        System.out.println(rs.getString(1) + " " + rs.getString(2));
        System.out.println(rs.getRow()); // 10

//        jump to the previous row
        rs.previous();
        System.out.println(rs.getString(1) + " " + rs.getString(2));
        System.out.println(rs.getRow()); //9

        System.out.println("===== PRINT THE WHOLE TABLE DYNAMICALLY =====");

        //rs.first(); // with this setup Ellen, the first row entry, is missing, because the query below goes to the next (2nd) row.
        rs.beforeFirst();
        while (rs.next()){
            System.out.println(rs.getString(1) + " " + rs.getString(2));
        }






        //close conn
        rs.close();
        statement.close();
        conn.close();

    }
}
