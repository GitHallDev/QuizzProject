package modele;

import java.util.ArrayList;
public class Theme {
    private String sujet;
    private String Description;
    private String difficulte;
    private ArrayList<Question>questions;
    private String[]niveaux={"facile","intermediaire","difficile"};

    public ArrayList<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<Question> questions) {
        this.questions = questions;
    }

    public Theme(String sujet, String Description) {
        this.sujet = sujet;
        this.Description = Description;
    }

    public String getSujet() {
        return sujet;
    }

    public void setSujet(String sujet) {
        this.sujet = sujet;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "Theme{" + "sujet=" + sujet + ", Description=" + Description + '}';
    }
    public void chooseDifficulty(String difficulter){
        switch (difficulter) {
            case "facile":
            difficulte=niveaux[0];
                break;
            case "intermediaire":
            difficulte=niveaux[1];
            break;
            case "difficile":
            difficulte=niveaux[2];
                break;
        }
        
    }

    public String getDifficulte() {
        return difficulte;
    }

    public String[] getNiveaux() {
        return niveaux;
    }

}

