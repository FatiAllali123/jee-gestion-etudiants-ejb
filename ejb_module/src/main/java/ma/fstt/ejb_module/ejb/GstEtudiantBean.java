package ma.fstt.ejb_module.ejb;

import ma.fstt.ejb_module.entities.Etudiant;
import ma.fstt.ejb_module.entities.Module;
import ma.fstt.ejb_module.entities.Suivie;
import ma.fstt.ejb_module.interfaces.IGestionEtudiantRemote;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class GstEtudiantBean implements IGestionEtudiantRemote {

    @PersistenceContext(unitName = "mycnx")
    private EntityManager em;

    // ======== CRUD ETUDIANT ========

    @Override
    public void ajouterEtudiant(Etudiant e) {
        em.persist(e);
    }

    @Override
    public void modifierEtudiant(Etudiant e) {
        em.merge(e);
    }

    @Override
    public void supprimerEtudiant(int id) {
        Etudiant e = em.find(Etudiant.class, id);
        if (e != null) em.remove(e);
    }

    @Override
    public Etudiant trouverEtudiant(int id) {
        return em.find(Etudiant.class, id);
    }

    @Override
    public List<Etudiant> listerEtudiants() {
        return em.createQuery("SELECT e FROM Etudiant e", Etudiant.class).getResultList();
    }


    // ======== CRUD MODULE ========

    @Override
    public void ajouterModule(ma.fstt.ejb_module.entities.Module m) {
        em.persist(m);
    }

    @Override
    public void modifierModule(ma.fstt.ejb_module.entities.Module m) {
        em.merge(m);
    }

    @Override
    public void supprimerModule(int id) {
        ma.fstt.ejb_module.entities.Module m = em.find(ma.fstt.ejb_module.entities.Module.class, id);
        if (m != null) em.remove(m);
    }

    @Override
    public ma.fstt.ejb_module.entities.Module trouverModule(int id) {
        return em.find(ma.fstt.ejb_module.entities.Module.class, id);
    }

    @Override
    public List<ma.fstt.ejb_module.entities.Module> listerModules() {
        return em.createQuery("SELECT m FROM Module m", Module.class).getResultList();
    }


    // ======== CRUD SUIVIE ========

    @Override
    public void ajouterSuivie(Suivie s) {
        em.persist(s);
    }

    @Override
    public void modifierSuivie(Suivie s) {
        em.merge(s);
    }

    @Override
    public void supprimerSuivie(int id) {
        Suivie s = em.find(Suivie.class, id);
        if (s != null) em.remove(s);
    }

    @Override
    public Suivie trouverSuivie(int id) {
        return em.find(Suivie.class, id);
    }

    @Override
    public List<Suivie> listerSuivies() {
        return em.createQuery("SELECT s FROM Suivie s", Suivie.class).getResultList();
    }

}
