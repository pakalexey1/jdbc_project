package com.cydeo.jdbctests.day02;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P02_DBUtilPractice {

    @Test
    public void task1(){
        //create DB Connection
        DB_Util.createConnection();

        //run query
        DB_Util.runQuery("select first_name,last_name,salary from employees");

        //get all data as List of Map
        List<Map<String,String>> allRowsAsListOfMap = DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> eachRowMap : allRowsAsListOfMap) {
            System.out.println(eachRowMap);
        }

        String firstRowFirstColumn = DB_Util.getFirstRowFirstColumn();
        System.out.println(firstRowFirstColumn); //to print Steven

        // destroy-close conn
        DB_Util.destroy();
    }

    @Test
    public void task2(){
        //Create DB Connection
        DB_Util.createConnection();

        //run query
        DB_Util.runQuery("select count (*) from employees");

        //how many employees we have?
        //method1:
        System.out.println(DB_Util.getFirstRowFirstColumn());

        //method2:
        DB_Util.getCellValue(1,1);

        // destroy-close conn
        DB_Util.destroy();
    }
}
