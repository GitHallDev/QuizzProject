package modele;

import java.util.Arrays;

public class Question {
  
    private int id;
    private String contenu;
    private String[]propositions;
    private String answer;
    private String soumise;
    private String niveaux;
    private String theme;
    public String getTheme() {
        return theme;
    }
    public void setTheme(String theme) {
        this.theme = theme;
    }
    public String getNiveaux() {
        return niveaux;
    }
    public Question(String contenu, String[] propositions, String answer, String theme, String niveaux) {
        this.contenu = contenu;
        this.propositions = propositions;
        this.answer = answer;
        this.theme = theme;
        this.niveaux=niveaux;
    }
    public Question(String contenu, String[] propositions, String answer, String theme, String niveaux,int id) {
        this.contenu = contenu;
        this.propositions = propositions;
        this.answer = answer;
        this.theme = theme;
        this.niveaux=niveaux;
        this.id=id;
    }
    public boolean verifyAnswer(){
        if(answer==soumise){
            return true;
        }
        return false;
    }
    @Override
    public String toString() {
        return "Question [contenu=" + contenu + ", propositions=" + Arrays.toString(propositions) + ", answer=" + answer
                + ", niveaux=" + niveaux + ", theme=" + theme + "]";
    }

    public String getContenu() {
        return contenu;
    }
    
    public void setContenu(String contenu) {
        this.contenu = contenu;
    }
    public String[] getPropositions() {
        return propositions;
    }
    public void setPropositions(String[] propositions) {
        this.propositions = propositions;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public String getSoumise() {
        return soumise;
    }
    public void setSoumise(String soumise) {
        this.soumise = soumise;
    }
    public void setNiveaux(String niveaux) {
        this.niveaux = niveaux;
    }
    public int getId() {
        return id;
    }
}
