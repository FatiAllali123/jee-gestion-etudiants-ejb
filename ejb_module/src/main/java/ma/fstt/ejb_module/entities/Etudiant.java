package ma.fstt.ejb_module.entities;



import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "etudiant")
@Getter
@Setter
@NoArgsConstructor
public class Etudiant implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_etudiant;
    private String nom;
    private String prenom;
    private String cne;
    private String adresse;
    private String niveau;

    // Constructeurs
    public Etudiant(String nom, String prenom, String cne, String adresse, String niveau) {
        this.nom = nom;
        this.prenom = prenom;
        this.cne = cne;
        this.adresse = adresse;
        this.niveau = niveau;
    }


}
