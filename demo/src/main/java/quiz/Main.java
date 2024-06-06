package quiz;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.javalin.Javalin;
import io.javalin.http.Context;
import io.javalin.http.HttpResponseException;

import java.util.*;
import modele.*;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dataBase.*;
import controlleur.notreControlleur;
public class Main {
    /**
     * @param args
     */
    public static void main(String[] args) {
        //0
        ArrayList<Theme>themes = new ArrayList();
       // ArrayList<Question>questions = new ArrayList();  
        Theme theme1=new Theme("Science sociale","bla de science et du social");
        Theme theme2=new Theme("Mathematique","bla de math etr de calcul");
        Javalin app= Javalin.create(config->{
            config.bundledPlugins.enableCors(cors->{
                cors.addRule(it->{it.anyHost();
                });
            });
        }).start(3001);
        Theme theme3=new Theme("Psychologie","bla de science comportementale et de philosophie");
        Theme theme4=new Theme("Management","bla de management organisationel");
        Theme theme5=new Theme("Sport","bla d'activiter sportive");
        Theme theme6=new Theme("Programmation","bla de code informatique");
        themes.add(theme1);
        themes.add(theme2);
        themes.add(theme3);
        themes.add(theme4);
        themes.add(theme5);
        themes.add(theme6);
        String[]tabString={"a","b","c"};
        /*Question quest1=//new Question("Quel sont les bases de la psychologie ? ",tabString,"b","Psychologie","difficile");
        Question quest2=//new Question("Quel sont les bases de la Arithmetique ? ",tabString,"a","Mathematique","facile");
        Question quest3=//new Question("Quel sont les bases de la statique ? ",tabString,"b","Mathematique","difficile");
        Question quest4=//new Question("Quel sont les bases de la therapie ? ",tabString,"c","Sport","intermediaire");
        Question quest5=//new Question("Quel sont les bases de la psychanalyse ? ",tabString,"a","Psychologie","intermediaire");
        Question quest6=//new Question("Quel sont les bases du comportements ? ",tabString,"c","Psychologie","facile");
        Question quest7=//new Question("Quel sont les bases de la logique mathématique ? ",tabString,"c","Mathematique","intermedaire");
        Question quest8=//new Question("Quel sont les bases de l'organisation ? ",tabString,"b","Management","facile");
        Question quest9=//new Question("Quel sont les bases de la gestion ? ",tabString,"c","Management","intermediaire");
        Question quest10=//new Question("Quel sont les bases du concept PME ? ",tabString,"a","Management","difficile");
        Question quest11=//new Question("Quel sont les bases de la programmation C ? ",tabString,"c","Programmation","intermediaire");
        Question quest12=//new Question("Quel sont les bases de la programmation en C++ ? ",tabString,"b","Programmation","facile");
        Question quest13=//new Question("Quel sont les bases de la programmation en python? ",tabString,"c","Programmation","facile");*/

        //Question[]questions ={
         //new Question("Quelle est la principale approche en psychologie pour traiter les troubles de la personnalité ?", new String[]{"Thérapie cognitive-comportementale", "Psychanalyse", "Thérapie familiale", "Toutes les réponses"}, "Thérapie cognitive-comportementale", "Psychologie", "difficile"),
         //new Question("Quel est le sport le plus pratiqué en Argentine ?", new String[]{"Football", "Basketball", "Rugby", "Tennis"}, "Football", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications web en 2023 ?", new String[]{"JavaScript", "Python", "Java", "C++"}, "JavaScript", "Programmation", "difficile"),
         //new Question("Quelle théorie sociologique met l'accent sur les inégalités sociales ?", new String[]{"Fonctionnalisme", "Interactionnisme symbolique", "Marxisme", "Structuralisme"}, "Marxisme", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la surface d'un triangle équilatéral ?", new String[]{"(√3/4) * a²", "3/2 * a", "2 * a", "√3 * a"}, "(√3/4) * a²", "Mathematique", "facile"),
         //new Question("Quel est le rôle principal d'un consultant informatique ?", new String[]{"Conseiller les entreprises sur les technologies informatiques", "Développer des applications", "Assurer la maintenance des systèmes informatiques", "Toutes les réponses"}, "Conseiller les entreprises sur les technologies informatiques", "Programmation", "intermediaire"),
         //new Question("Quel est le sport le plus pratiqué en Canada ?", new String[]{"Hockey sur glace", "Football", "Basketball", "Tennis"}, "Hockey sur glace", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications de machine learning en 2023 ?", new String[]{"Python", "Java", "C++", "R"}, "Python", "Programmation", "difficile"),
         //new Question("Quelle est la principale méthode de recherche en sociologie de la culture ?", new String[]{"Analyse de textes", "Expérimentation", "Observation", "Toutes les réponses"}, "Analyse de textes", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la distance entre deux points dans un espace à quatre dimensions ?", new String[]{"√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (w2-w1)²]", "x2-x1 + y2-y1 + z2-z1 + w2-w1", "x2x1 + y2y1 + z2z1 + w2w1", "x2/x1 + y2/y1 + z2/z1 + w2/w1"}, "√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (w2-w1)²]", "Mathematique", "difficile"),
         //new Question("Quelle est la principale approche en psychologie pour traiter les troubles alimentaires ?", new String[]{"Thérapie cognitive-comportementale", "Psychanalyse", "Thérapie familiale", "Toutes les réponses"}, "Thérapie cognitive-comportementale", "Psychologie", "difficile"),
         //new Question("Quel est le sport le plus pratiqué en Inde ?", new String[]{"Cricket", "Football", "Hockey sur gazon", "Tennis"}, "Cricket", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications de réalité virtuelle en 2023 ?", new String[]{"C#", "JavaScript", "Python", "C++"}, "C#", "Programmation", "difficile"),
         //new Question("Quelle théorie sociologique met l'accent sur les interactions entre les individus et leur environnement social ?", new String[]{"Fonctionnalisme", "Interactionnisme symbolique", "Marxisme", "Structuralisme"}, "Interactionnisme symbolique", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la surface d'un trapèze ?", new String[]{"(base1 + base2) * hauteur / 2", "base1 + base2 + hauteur", "base1 * base2 * hauteur", "base1 - base2 + hauteur"}, "(base1 + base2) * hauteur / 2", "Mathematique", "facile"),
         //new Question("Quel est le rôle principal d'un chef de projet informatique ?", new String[]{"Planifier et coordonner les projets informatiques", "Développer des applications", "Assurer la maintenance des systèmes informatiques", "Toutes les réponses"}, "Planifier et coordonner les projets informatiques", "Programmation", "intermediaire"),
         //new Question("Quel est le sport le plus pratiqué en Afrique du Sud ?", new String[]{"Football", "Rugby", "Cricket", "Tennis"}, "Rugby", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications de blockchain en 2023 ?", new String[]{"Solidity", "Python", "Java", "C++"}, "Solidity", "Programmation", "difficile"),
         //new Question("Quelle est la principale méthode de recherche en anthropologie culturelle ?", new String[]{"Etude de terrain", "Analyse de textes", "Expérimentation", "Toutes les réponses"}, "Etude de terrain", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la distance entre deux points dans un espace à n dimensions ?", new String[]{"√[(x2-x1)² + (y2-y1)² + ... + (z2-z1)²]", "x2-x1 + y2-y1 + ... + z2-z1", "x2x1 + y2y1 + ... + z2*z1", "x2/x1 + y2/y1 + ... + z2/z1"}, "√[(x2-x1)² + (y2-y1)² + ... + (z2-z1)²]", "Mathematique", "difficile"),
         //new Question("Quelle est la principale approche en psychologie pour traiter les troubles de l'apprentissage ?", new String[]{"Thérapie cognitive-comportementale", "Psychanalyse", "Thérapie familiale", "Toutes les réponses"}, "Thérapie cognitive-comportementale", "Psychologie", "difficile"),
         //new Question("Quel est le sport le plus pratiqué en Espagne ?", new String[]{"Football", "Basketball", "Tennis", "Padel"}, "Football", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications de réalité augmentée en 2023 ?", new String[]{"C#", "JavaScript", "Python", "C++"}, "C#", "Programmation", "difficile"),
         //new Question("Quelle théorie sociologique met l'accent sur les normes et les valeurs dans la société ?", new String[]{"Fonctionnalisme", "Interactionnisme symbolique", "Marxisme", "Structuralisme"}, "Fonctionnalisme", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la surface d'un paraboloïde hyperbolique ?", new String[]{"(b/2) * h", "πr²", "2πr", "πr"}, "(b/2) * h", "Mathematique", "facile"),
         //new Question("Quel est le rôle principal d'un ingénieur en intelligence artificielle ?", new String[]{"Concevoir et développer des systèmes d'intelligence artificielle", "Développer des applications", "Assurer la maintenance des systèmes informatiques", "Toutes les réponses"}, "Concevoir et développer des systèmes d'intelligence artificielle", "Programmation", "intermediaire"),
         //new Question("Quel est le sport le plus pratiqué en Italie ?", new String[]{"Football", "Basketball", "Cyclisme", "Tennis"}, "Football", "Sport", "facile"),
         //new Question("Quel est le langage de programmation le plus adapté pour le développement d'applications de cloud computing en 2023 ?", new String[]{"Java", "Python", "C++", "Go"}, "Java", "Programmation", "difficile"),
         //new Question("Quelle est la principale méthode de recherche en sociologie de la famille ?", new String[]{"Etude de cas", "Analyse de textes", "Expérimentation", "Toutes les réponses"}, "Etude de cas", "Science sociale", "intermediaire"),
         //new Question("Quelle est la formule pour calculer la distance entre deux points dans un espace-temps courbe ?", new String[]{"√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (t2-t1)²]", "x2-x1 + y2-y1 + z2-z1 + t2-t1", "x2x1 + y2y1 + z2z1 + t2t1", "x2/x1 + y2/y1 + z2/z1 + t2/t1"}, "√[(x2-x1)² + (y2-y1)² + (z2-z1)² + (t2-t1)²]", "Mathematique", "difficile")};


        /*Quiz quiz1= new Quiz("Mark",20);
        quiz1.chooseTheme(themes,1);
        quiz1.getTheme().chooseDifficulty("intermediaire");
        //System.out.println("Theme= "+quiz1.getTheme().getSujet()+quiz1.getTheme().getDifficulte());
        notreControlleur.getTAbfilter(quiz1.getTheme(), questions);
        quiz1.setNb_question(4);
        for (Question element : quiz1.getTheme().getQuestions()) {
            System.out.println(element.toString());
        }*/
        app.get("/", ctx ->ctx.json(themes));
        app.post("/users",ctx->{
            try{
            User user=ctx.bodyAsClass(User.class);
            User userExiste=notreControlleur.getUser(user.getEmail());
            System.out.println(userExiste!=null);
            if(userExiste!=null)
            ctx.status(400).json(Map.of("status", "error", "message", "L'utilisateur " + user.getNom() + " existe déjà!"));
            else{
                notreControlleur.ajouterUser(user); 
                ctx.status(201).json(Map.of("status", "success", "message", "Inscription réussie"));
            }
        }catch (HttpResponseException e) {
                System.err.println("Erreur de réponse HTTP: " + e.getMessage());
                ctx.status(e.getStatus()).result(e.getMessage());
            } catch (Exception e) {
                System.err.println("Erreur inattendue: " + e.getMessage());
                ctx.status(500).result("Erreur interne du serveur");
            }
        });
        app.post("/usersLogin",ctx->{
            try{
                User user=ctx.bodyAsClass(User.class);
                System.out.println(notreControlleur.verifyUser(user));
                if(notreControlleur.verifyUser(user)){
                    ctx.status(200).json(Map.of("status", "success", "message", "Connexion réussie"));
                }else{
                    ctx.status(400).json(Map.of("status", "error", "message", "Connexion échouer"));

                }

            }catch (HttpResponseException e) {
                System.err.println("Erreur de réponse HTTP: " + e.getMessage());
                ctx.status(e.getStatus()).result(e.getMessage());
            } catch (Exception e) {
                System.err.println("Erreur inattendue: " + e.getMessage());
                ctx.status(500).result("Erreur interne du serveur");
            }
        });
         //@Route(path="/generate_token")
        /* public class tokenMake {
            public String genererJeton(Context ctx){
                String token =UUID.randomUUID().toString();
                long tempsExpiration=System.currentTimeMillis()+3600000;
                saveJeton(token, tempsExpiration);
                return ctx.json(Map.of("jeton",jeton));
            }
            
            private void saveJeton(String jeton,long expireTemps){
                try(
                    PreparedStatement prepare=DatabaseConnection.getConnexion().prepareStatement(
                        "INSERT INTO jetons ( jeton, dateExpire) VALUES ( ?, ?)")){
                            prepare.setString(1, jeton);
                            prepare.setLong(2, expireTemps);
                            int result =prepare.executeUpdate();
                            if(result>0){
                                System.out.println("ajout éhouer");
                            }else System.out.println("ajout échouer");
                        }
            }
         }
       
         public class TokenValidationMiddleware implements  javalinMiddleware{
            @Override
            public Handler handle(Context ctx)throws Exception{
                String jeton=ctx.header("Authorization")!=null ? ctx.header("Authorization"):ctx.queryParam("jeton");

                if(jeton!=null){
                    if(isValidJeton(jeton)){
                        return ctx.next();
                    }else{
                        return ctx.status(401).json(Map.of("error","Jeton invalide"));
                    }
                }else{
                    return ctx.status(401).json(Map.of("error","Jeton manquant"));
                }
            }
            private boolean isValidJeton(String jeton)throws Exception{
                PreparedStatement prepare=null;
                ResultSet result=null;
                try{
                 prepare=DatabaseConnection.getConnexion().prepareStatement(
                    "SELECT jeton, dateExpire FROM jetons WHERE jeton=?");
                    prepare.setString(1, jeton);
                     result=prepare.executeQuery();
                    if(result.next()){
                        long dateExpire=result.getLong("dateExpire");
                        if(dateExpire<=System.currentTimeMillis()){
                            System.out.println("Ce jeton n'est plus valide !");
                            return false;
                        }else{
                            return true;
                        }
                    }else{
                        System.out.println("Aucun jeton trouver");
                        return false;
                    }
                }catch (SQLException e) {
                    e.printStackTrace();
                    throw e;
                } finally {
                    if (result != null) result.close();
                    if (prepare != null) prepare.close();
                    if (DatabaseConnection.getConnexion() != null) DatabaseConnection.getConnexion().close();
                }
            }
       

        }*/


        ArrayList<Question> questions;
        try {
            questions = notreControlleur.getQuestions();
            app.get("/question", ctx->{
                String theme=ctx.queryParam("theme");
                String niveau=ctx.queryParam("niveau");
                for (Theme element : themes) {
                    if(element.getSujet().equals(theme)){
                        element.chooseDifficulty(niveau);
                    notreControlleur.getTAbfilter(element, questions);
                    ctx.json(element.getQuestions());
                    }
                }
            });
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
}