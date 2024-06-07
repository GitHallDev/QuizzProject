package dataBase;

import java.sql.*;

public class DatabaseConnection {
    public static String urlBDD = "jdbc:mysql://localhost:3306/quiz"; // Remarquez le port 3306
    public static String user = "root";
    public static String passwd = "";

    public static Connection getConnexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Utilisez le pilote MySQL 8
            Connection conn = DriverManager.getConnection(urlBDD, user, passwd);
            //System.out.println("Connexion réussie !");
            return conn;
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur : Pilote introuvable.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Erreur de connexion à la base de données.");
            e.printStackTrace();
        }
        return null;}
}
