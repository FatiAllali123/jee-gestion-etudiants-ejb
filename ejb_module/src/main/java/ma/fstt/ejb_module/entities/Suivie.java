package ma.fstt.ejb_module.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "suivie")
@Getter
@Setter
@NoArgsConstructor
public class Suivie implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    private double note;
    private Date date_suivie;


    @ManyToOne
    @JoinColumn(name = "id_etudiant")
    private Etudiant etudiant;

    @ManyToOne
    @JoinColumn(name = "id_module")
    private Module module;



    public Suivie(Etudiant etudiant, Module module, double note, Date date_suivie) {
        this.etudiant = etudiant;
        this.module = module;
        this.note = note;
        this.date_suivie = date_suivie;
    }


}
