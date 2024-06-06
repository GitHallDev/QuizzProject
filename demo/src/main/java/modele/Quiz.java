package modele;

import java.util.ArrayList;

public class Quiz {
    private String utilisateur;
    private int score;
    private int temps;
    private Theme theme;
    private int nb_question;

    public int getNb_question() {
        return nb_question;
    }

    public void setNb_question(int nb_question) {
        this.nb_question = nb_question;
    }

    public Quiz(String utilisateur,  int temps) {
        this.utilisateur = utilisateur;
        this.temps = temps;
    }

    public String getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(String utilisateur) {
        this.utilisateur = utilisateur;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTemps() {
        return temps;
    }

    public void setTemps(int temps) {
        this.temps = temps;
    }
    public void chooseTheme(ArrayList<Theme> tab,int index){
    theme=tab.get(index); 
    }

    public Theme getTheme() {
        return theme;
    };
}