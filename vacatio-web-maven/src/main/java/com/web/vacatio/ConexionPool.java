package com.web.vacatio;
import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;

public class ConexionPool {
    private static BasicDataSource dataSource = new BasicDataSource();

    static {
       
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/VacatioWeb");
        dataSource.setUsername("root");
        dataSource.setPassword("rootroot");

      
        dataSource.setInitialSize(20); 
        dataSource.setMaxTotal(100); 
        dataSource.setMaxIdle(5); 
        dataSource.setMinIdle(2); 
        dataSource.setMaxWaitMillis(5000); 
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}





