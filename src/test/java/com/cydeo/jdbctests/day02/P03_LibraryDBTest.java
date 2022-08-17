package com.cydeo.jdbctests.day02;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class P03_LibraryDBTest {
    // Create connection to MySQL Database
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username =  "library2_client";
    String password =  "6s2LQQTjBcGFfDhY" ;

@Test
    public void testUserCount() throws SQLException {
    //create a connection
    DB_Util.createConnection(url,username,password);

    //run the query
    DB_Util.runQuery("select count(*) from users");

    //get the number of users from the DB
    String expectedNumberOfUsers = DB_Util.getFirstRowFirstColumn();

    //get the number of user from the UI
    String actualNumberOfUsers = "267"; //(from the website)

    //Make an assertion and close connection
    Assertions.assertEquals(expectedNumberOfUsers,actualNumberOfUsers);

    //close conn
    DB_Util.destroy();

}
@Test
    public void testBookCount(){
    //create a connection
    DB_Util.createConnection(url,username,password);

    //run the query
    DB_Util.runQuery("select count(*) from books");
    String expectedNumberOfBooks = DB_Util.getFirstRowFirstColumn();
    String actualNumberOfBooks = "1403";
    Assertions.assertEquals(expectedNumberOfBooks,actualNumberOfBooks);

    //close conn
    DB_Util.destroy();
}

}
