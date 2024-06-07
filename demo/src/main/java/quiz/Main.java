package quiz;


import io.javalin.Javalin;
import io.javalin.http.HttpResponseException;
import kong.unirest.Unirest;

import java.util.*;

import com.fasterxml.jackson.databind.JsonNode;

import modele.*;

import java.net.http.HttpResponse;
import java.sql.SQLException;
import controlleur.notreControlleur;

public class Main {
    /**
     * @param args
     */
    private static  ArrayList<Question> questions=new ArrayList<>();
    public static void main(String[] args) {


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
        app.get("/allQuestions", ctx->{

            ctx.json(questions);
        });

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
               // System.out.println("questions bien récuperer");
            });
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Unirest.config().cookieSpec("ignoreCookies");

        app.get("/wikipedia/{query}", ctx -> {
            String query = ctx.pathParam("query");
            String apiUrl = "https://fr.wikipedia.org/w/api.php?action=query&list=search&srsearch=" + query + "&utf8=&format=json";
            //System.out.println(apiUrl);
            // Faire une requête à l'API Wikipedia
            kong.unirest.HttpResponse<kong.unirest.JsonNode> response = Unirest.get(apiUrl).asJson();
            // System.out.println("body= "+ response.getBody().toString());
            // Renvoyer la réponse de l'API Wikipedia au client
            ctx.contentType("application/json").result(response.getBody().toString());
        });
        
    }
}