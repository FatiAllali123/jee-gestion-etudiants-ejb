package ma.fstt.webgstetudiants.Servlet;

import ma.fstt.ejb_module.ejb.GstEtudiantBean;
import ma.fstt.ejb_module.entities.Etudiant;
import ma.fstt.ejb_module.entities.Module;
import ma.fstt.ejb_module.entities.Suivie;
import ma.fstt.ejb_module.interfaces.IGestionEtudiantRemote;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/suivies")
public class SuivieServlet extends HttpServlet {

    @EJB
    private IGestionEtudiantRemote ejb;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null || action.equals("list")) {
            List<Suivie> suivies = ejb.listerSuivies();
            req.setAttribute("suivies", suivies);
            req.getRequestDispatcher("/suivies/list.jsp").forward(req, resp);

        } else if (action.equals("add")) {
            req.setAttribute("etudiants", ejb.listerEtudiants());
            req.setAttribute("modules", ejb.listerModules());
            req.getRequestDispatcher("/suivies/add.jsp").forward(req, resp);

        } else if (action.equals("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Suivie s = ejb.trouverSuivie(id);
            req.setAttribute("suivie", s);
            req.setAttribute("etudiants", ejb.listerEtudiants());
            req.setAttribute("modules", ejb.listerModules());
            req.getRequestDispatcher("/suivies/edit.jsp").forward(req, resp);

        } else if (action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            ejb.supprimerSuivie(id);
            resp.sendRedirect("suivies?action=list&success=1");
        }
        else if ("listByEtudiant".equals(action)) {
            int idEtudiant = Integer.parseInt(req.getParameter("id"));
            Etudiant etudiant = ejb.trouverEtudiant(idEtudiant);
            List<Suivie> notes = ejb.listerSuivies()
                    .stream()
                    .filter(s -> s.getEtudiant().getId_etudiant() == idEtudiant)
                    .toList();
            req.setAttribute("notes", notes);
            req.setAttribute("etudiant", etudiant);
            req.getRequestDispatcher("/suivies/listByEtudiant.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if ("save".equals(action)) {
            Suivie s = new Suivie();
            int idEtud = Integer.parseInt(req.getParameter("id_etudiant"));
            int idMod = Integer.parseInt(req.getParameter("id_module"));
            Etudiant e = ejb.trouverEtudiant(idEtud);
            Module m = ejb.trouverModule(idMod);
            s.setEtudiant(e);
            s.setModule(m);
            s.setNote(Double.parseDouble(req.getParameter("note")));
            try {
                s.setDate_suivie(sdf.parse(req.getParameter("date_suivie")));
            } catch (Exception ex) {
                s.setDate_suivie(new Date());
            }
            ejb.ajouterSuivie(s);
            resp.sendRedirect("suivies?action=list&success=1");

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Suivie s = ejb.trouverSuivie(id);
            int idEtud = Integer.parseInt(req.getParameter("id_etudiant"));
            int idMod = Integer.parseInt(req.getParameter("id_module"));
            s.setEtudiant(ejb.trouverEtudiant(idEtud));
            s.setModule(ejb.trouverModule(idMod));
            s.setNote(Double.parseDouble(req.getParameter("note")));
            try {
                s.setDate_suivie(sdf.parse(req.getParameter("date_suivie")));
            } catch (Exception ex) {
                s.setDate_suivie(new Date());
            }
            ejb.modifierSuivie(s);
            resp.sendRedirect("suivies?action=list&success=1");
        }
    }
}