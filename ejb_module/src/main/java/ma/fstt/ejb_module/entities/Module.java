package ma.fstt.ejb_module.entities;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "module")
@Getter
@Setter
@NoArgsConstructor
public class Module implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_module;

    private String code;
    private String titre;
    private int coefficient;


    public Module(String code, String titre , int coefficient) {
        this.code = code;
        this.titre = titre;
        this.coefficient = coefficient;
    }


}
