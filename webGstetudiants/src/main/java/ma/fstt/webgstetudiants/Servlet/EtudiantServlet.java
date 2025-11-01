package ma.fstt.webgstetudiants.Servlet;

import ma.fstt.ejb_module.ejb.GstEtudiantBean;
import ma.fstt.ejb_module.entities.Etudiant;
import ma.fstt.ejb_module.interfaces.IGestionEtudiantRemote;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/etudiants")
public class EtudiantServlet extends HttpServlet {

    @EJB
    private IGestionEtudiantRemote ejb;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null || action.equals("list")) {
            List<Etudiant> etudiants = ejb.listerEtudiants();
            req.setAttribute("etudiants", etudiants);
            req.getRequestDispatcher("/etudiants/listeEtudiants.jsp").forward(req, resp);

        } else if (action.equals("add")) {
            req.getRequestDispatcher("/etudiants/add.jsp").forward(req, resp);

        } else if (action.equals("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Etudiant e = ejb.trouverEtudiant(id);
            req.setAttribute("etudiant", e);
            req.getRequestDispatcher("/etudiants/edit.jsp").forward(req, resp);

        } else if (action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            ejb.supprimerEtudiant(id);
            resp.sendRedirect("etudiants?action=list&success=1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("save".equals(action)) {
            Etudiant e = new Etudiant();
            e.setNom(req.getParameter("nom"));
            e.setPrenom(req.getParameter("prenom"));
            e.setCne(req.getParameter("cne"));
            e.setAdresse(req.getParameter("adresse"));
            e.setNiveau(req.getParameter("niveau"));
            ejb.ajouterEtudiant(e);
            resp.sendRedirect("etudiants?action=list&success=1");

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Etudiant e = ejb.trouverEtudiant(id);
            e.setNom(req.getParameter("nom"));
            e.setPrenom(req.getParameter("prenom"));
            e.setCne(req.getParameter("cne"));
            e.setAdresse(req.getParameter("adresse"));
            e.setNiveau(req.getParameter("niveau"));
            ejb.modifierEtudiant(e);
            resp.sendRedirect("etudiants?action=list&success=1");
        }
    }
}



