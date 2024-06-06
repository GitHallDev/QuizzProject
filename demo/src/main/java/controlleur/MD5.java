package controlleur;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HKass
 */
public class MD5 {
    public static String hasher(String str) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str.getBytes());

        byte byteData[] = md.digest();

        //convertir le tableau de bits en une format hexadécimal - méthode 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        return sb.toString();
    }
    
    public static void main(String[] args)throws Exception
    {
        //String password = "Azerty@2022";
        //System.out.println("Mot de passe: " + hasher(password));
        
        String password = "ea297a2d80b00784cfe4e9efbe5b3d53";
        
        // Vérification
        System.out.println("Entrer un mot de passe: ");
        Scanner in = new Scanner(System.in);
        String mot = in.nextLine();
        
        if (password.equals(hasher(mot))) System.out.println("Connexion");
        else System.out.println("Echec");
    }
}
