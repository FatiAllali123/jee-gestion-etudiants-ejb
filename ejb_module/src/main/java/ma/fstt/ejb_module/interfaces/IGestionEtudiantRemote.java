package ma.fstt.ejb_module.interfaces;

import ma.fstt.ejb_module.entities.Etudiant;
import jakarta.ejb.Remote;
import ma.fstt.ejb_module.entities.Module;
import ma.fstt.ejb_module.entities.Suivie;

import java.util.List;

@Remote
public interface IGestionEtudiantRemote {

    // --- CRUD Etudiant ---
    void ajouterEtudiant(Etudiant e);
    void modifierEtudiant(Etudiant e);
    void supprimerEtudiant(int id);
    Etudiant trouverEtudiant(int id);
    List<Etudiant> listerEtudiants();



    // --- CRUD Module ---
    void ajouterModule(ma.fstt.ejb_module.entities.Module m);
    void modifierModule(ma.fstt.ejb_module.entities.Module m);
    void supprimerModule(int id);
    ma.fstt.ejb_module.entities.Module trouverModule(int id);
    List<Module> listerModules();


    // --- CRUD Suivie (notes) ---
    void ajouterSuivie(Suivie s);
    void modifierSuivie(Suivie s);
    void supprimerSuivie(int id);
    Suivie trouverSuivie(int id);
    List<Suivie> listerSuivies();
}
