package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    Connection con;

    public Connection getConnection() {
        try {
            String myBD = "jdbc:mysql://localhost:3306/abarrote?serverTimezone=UTC";
            con = DriverManager.getConnection(myBD, "root", "root");
            return con;
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return null;
    }
    
    public static void main(String[] args) {
       Conexion con  = new Conexion();
       con.getConnection();
    }

}
