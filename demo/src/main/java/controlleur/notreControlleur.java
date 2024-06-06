package controlleur;

import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import dataBase.*;

import java.security.NoSuchAlgorithmException;
//import org.eclipse.jetty.io.Connection;
import java.sql.*;
import dataBase.DatabaseConnection;
import modele.*;
public class notreControlleur {
    Connection connection =DatabaseConnection.getConnexion();
    public static ArrayList<Question> filterQuestionLevel(ArrayList<Question> tab,String niveaux){
        ArrayList<Question>tabFiltrer=new ArrayList<>();
        for (Question element : tab) {
            if(element.getNiveaux().equals(niveaux)){
                tabFiltrer.add(element);
            }
        }
        return tabFiltrer;
    }
    public static ArrayList<Question> filterQuestionSujet(ArrayList<Question>tab,String sujet){
        ArrayList<Question>tabFiltrer=new ArrayList<>();
        for (Question element : tab) {
            if(element.getTheme().equals(sujet)){
                tabFiltrer.add(element);
            }
        }
        return tabFiltrer;
    }
    public static void getTAbfilter(Theme theme,ArrayList<Question>quest){
        //ArrayList<Question>quest=new ArrayList<>();
        theme.setQuestions(filterQuestionLevel( filterQuestionSujet(quest,theme.getSujet() ), theme.getDifficulte()));
    }
    public static ArrayList<Question> getQuestions()throws SQLException{
        ArrayList<Question>tabQuestions=new ArrayList<>();
        Connection connection=null;
        PreparedStatement prepa=null;
        ResultSet result=null;
        try ( PreparedStatement prepare=DatabaseConnection.getConnexion().prepareStatement(
            "SELECT id, contenu, answer, niveaux, theme From questions")){
                result=prepare.executeQuery();
                while (result.next()) {
                    int id=result.getInt("id");
                    String contenu=result.getString("contenu");
                    String niveaux=result.getString("niveaux");
                    String answer=result.getString("answer");
                    String theme=result.getString("theme");
                    try( PreparedStatement prepare0=DatabaseConnection.getConnexion().prepareStatement(
                        "SELECT id, props1, props2, props3, props4 FROM propositions WHERE id=?")){
                            prepare0.setInt(1, id);
                            ResultSet result0=prepare0.executeQuery();
                            while(result0.next()){
                                String props1=result0.getString("props1");
                                String props2=result0.getString("props2");
                                String props3=result0.getString("props3");
                                String props4=result0.getString("props4");
                                String[]propositions={
                                    props1,
                                    props2,
                                    props3,
                                    props4
                                };
                                Question quest =new Question(contenu, propositions, answer, theme, niveaux,id);
                                tabQuestions.add(quest);
                            }
                        }
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (result != null) result.close();
            if (prepa != null) prepa.close();
            if (connection != null) connection.close();
        }
        return tabQuestions;
    }
    public static boolean verifyUser(User user) throws SQLException, NoSuchAlgorithmException {
        User utilisateur =getUser(user.getEmail());
        if(utilisateur!=null){
            System.out.println("compare: "+utilisateur.getPassword().equals(MD5.hasher(user.getPassword())));
            if(utilisateur.getPassword().equals(MD5.hasher(user.getPassword())))
                return true; 
            else 
              return false;
        }else return false;
    }
    public static void verification(){
        System.out.println(("entrer"));
    }
    
    public static User getUser(String mail)throws SQLException{
        System.out.println("entrer");
        Connection connection=null;
        PreparedStatement prepare=null;
        ResultSet result=null;
        try{prepare=DatabaseConnection.getConnexion().prepareStatement(
            "SELECT id, username, email, password FROM users WHERE email=? ");
            prepare.setString(1, mail);
            result=prepare.executeQuery();
            if(result.next()){
                String nom=result.getString("username");
                String email=result.getString("email");
                String password=result.getString("password");
                    User user=new User();//(nom,email,password);
                    user.setNom(nom);
                    user.setEmail(email);
                    user.setPassword(password);
                    System.out.println("existe déja");
                    return user ; 
            }
            System.out.println("n'existe pas encore");
        }catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (result != null) result.close();
            if (prepare != null) prepare.close();
            if (connection != null) connection.close();
        }
        return null;
    }

    public static void ajouterUser(User user) throws SQLException, NoSuchAlgorithmException{
        try(PreparedStatement prepare0=DatabaseConnection.getConnexion().prepareStatement(
                    "INSERT INTO users ( username, email, password) VALUES (?, ?, ?)")){
                            prepare0.setString(1,user.getNom());
                            prepare0.setString(2,user.getEmail());
                            prepare0.setString(3,MD5.hasher(user.getPassword()));
                        int result0=prepare0.executeUpdate();
                        if(result0>0)
                        System.out.println("Ajout réussi");
                        else
                        System.out.println("Ajout échouer");
                    }
    }

    public static void ajoutQuestion(Question []questions) throws SQLException{
        Connection connection=null; 
        PreparedStatement prepare = null;
        ResultSet res=null;
        try{
        for (Question elements :questions) {
             prepare=DatabaseConnection.getConnexion().prepareStatement("INSERT INTO questions (contenu, answer, niveaux, theme) VALUES (?, ?, ?, ?)",Statement.RETURN_GENERATED_KEYS);
            prepare.setString(1, elements.getContenu());
            prepare.setString(2, elements.getAnswer());
            prepare.setString(3, elements.getNiveaux());
            prepare.setString(4, elements.getTheme());
            int result= prepare.executeUpdate();
            if(result>0){
                 res =prepare.getGeneratedKeys();
                 int id;
                 if(res.next()){
                    id=res.getInt(1);
                try(PreparedStatement prepare0=DatabaseConnection.getConnexion().prepareStatement(
                    "INSERT INTO propositions (id, props1, props2, props3, props4) VALUES (?, ?, ?, ?, ?)")){
                        prepare0.setInt(1, id);
                            prepare0.setString(2,elements.getPropositions()[0]);
                            prepare0.setString(3,elements.getPropositions()[1]);
                            prepare0.setString(4,elements.getPropositions()[2]);
                            prepare0.setString(5,elements.getPropositions()[3]);
                        int result0=prepare0.executeUpdate();
                        if(result0>0)
                        System.out.println("Ajout réussi");
                        else
                        System.out.println("Ajout échouer");
                    }
            }
        }
           else
               System.out.println("Ajout échouer");
        }
    }catch (SQLException e) {
        e.printStackTrace();
        throw e;
    } finally {
        if (res != null) res.close();
        if (prepare != null) prepare.close();
        if (connection != null) connection.close();
    }
    }
}
