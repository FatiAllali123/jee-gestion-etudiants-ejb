package ma.fstt.webgstetudiants.Servlet; // CORRIGÉ : package correct

import ma.fstt.ejb_module.ejb.GstEtudiantBean;
import ma.fstt.ejb_module.entities.Module;
import ma.fstt.ejb_module.interfaces.IGestionEtudiantRemote;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/modules")
public class ModuleServlet extends HttpServlet {

    @EJB
    private IGestionEtudiantRemote ejb;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null || "list".equals(action)) {
            List<Module> modules = ejb.listerModules();
            req.setAttribute("modules", modules);
            req.getRequestDispatcher("/modules/list.jsp").forward(req, resp);

        } else if ("add".equals(action)) {
            req.getRequestDispatcher("/modules/add.jsp").forward(req, resp);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Module m = ejb.trouverModule(id);
            req.setAttribute("module", m);
            req.getRequestDispatcher("/modules/edit.jsp").forward(req, resp);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            ejb.supprimerModule(id);
            // Message une seule fois + rechargement propre
            req.setAttribute("success", "true");
            List<Module> modules = ejb.listerModules();
            req.setAttribute("modules", modules);
            req.getRequestDispatcher("/modules/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("save".equals(action)) {
            Module m = new Module();
            m.setCode(req.getParameter("code"));
            m.setTitre(req.getParameter("titre"));
            m.setCoefficient(Integer.parseInt(req.getParameter("coefficient")));
            ejb.ajouterModule(m);

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Module m = ejb.trouverModule(id);
            m.setCode(req.getParameter("code"));
            m.setTitre(req.getParameter("titre"));
            m.setCoefficient(Integer.parseInt(req.getParameter("coefficient")));
            ejb.modifierModule(m);
        }

        // Message + liste mise à jour
        req.setAttribute("success", "true");
        List<Module> modules = ejb.listerModules();
        req.setAttribute("modules", modules);
        req.getRequestDispatcher("/modules/list.jsp").forward(req, resp);
    }
}