package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetdataTest {
    String dbURL = "jdbc:oracle:thin:@18.212.94.249:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task03() throws SQLException {

        //DriverManager class getConnection is used for making connection with a database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        //Statement helps us to execute query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        //ResultSet stores data that we get after the query execution
        ResultSet rs = statement.executeQuery("select * from employees");


        //Database Metadata --> Information about database
        // Won't be used for testing purposes.
        DatabaseMetaData metaData = conn.getMetaData();
        System.out.println(metaData.getUserName());
        System.out.println(metaData.getDatabaseProductName());
        System.out.println(metaData.getDatabaseProductVersion());
        System.out.println(metaData.getDriverName());
        System.out.println(metaData.getDriverVersion());

        //ResultSetMetadata -- data about the table
        ResultSetMetaData rsmd = rs.getMetaData();

        //How many columns are in the table?
        int columnCount = rsmd.getColumnCount();
        System.out.println(columnCount);

        // what is the name of the 5th Column?
        System.out.println(rsmd.getColumnName(2));

        //Print all column names dynamically
        for (int i = 1; i < rsmd.getColumnCount(); i++) {
            System.out.println(rsmd.getColumnName(i));
        }

        // print all the table content dynamically
        /*
         - HOW TO GET DATA DYNAMICALLY

            ResultSet --> Table Content

                rs.next()           --> with while loop we are getting data from the whole table
                                        it will jump to each row to get the data
                rs.getString(index) --> to get related cell content
                rs.getString(columnName)

            ResultSetMetadata --> info about the table

                rsmd.getColumnCount() --> it will return columnCount
                rsmd.getColumnName(index) --> it will return provided index's ColumnName

        * */
        // iterate through each row with while loop
        System.out.println("============================");
        while(rs.next()){

            //iterate through each column dynamically
            for (int i = 1; i <=rsmd.getColumnCount(); i++) {
                System.out.print(rsmd.getColumnName(i) + " - " + rs.getString(i) + " ");
            }
            System.out.println();
        }


        //close conn
        rs.close();
        statement.close();
        conn.close();
    }
}