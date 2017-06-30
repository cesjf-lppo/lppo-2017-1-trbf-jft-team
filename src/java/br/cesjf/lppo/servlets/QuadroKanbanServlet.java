package br.cesjf.lppo.servlets;

import br.cesjf.lppo.dao.EtiquetaJpaController;
import br.cesjf.lppo.dao.UsuarioJpaController;
import br.cesjf.lppo.entidades.Etiqueta;
import br.cesjf.lppo.entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Júnior
 */
@WebServlet(name = "QuadroKanbanServlet", urlPatterns = {"/quadroKanban.html"})
public class QuadroKanbanServlet extends HttpServlet {

    @PersistenceUnit(unitName = "lppo-2017-1-trbf-jft-teamPU")
    EntityManagerFactory emf;

    @Resource(name = "java:comp/UserTransaction")
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> usuario;
        UsuarioJpaController userDAO = new UsuarioJpaController(ut, emf);
        usuario = userDAO.findUsuarioEntities();
        
        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("WEB-INF/buscaUsuarioQuadroKanban.jsp").forward(request, response);  
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("idUsuario")!=null) {
            Long id = Long.parseLong(request.getParameter("idUsuario"));

            Usuario usuario = new Usuario();
            UsuarioJpaController usuarioDao = new UsuarioJpaController(ut, emf);
            usuario = usuarioDao.findUsuario(id);
            request.setAttribute("usuario", usuario);
            
            List<Etiqueta> etiqueta;
            EtiquetaJpaController etiquetaDao = new EtiquetaJpaController(ut, emf);
            etiqueta = etiquetaDao.getEtiquetaByAutor(id);
            request.setAttribute("etiqueta", etiqueta);            
            
        } else {
            List<Usuario> usuario;
            UsuarioJpaController userDAO = new UsuarioJpaController(ut, emf);
            usuario = userDAO.findUsuarioEntities();

            request.setAttribute("usuario", usuario);
        }
        request.getRequestDispatcher("WEB-INF/quadroKanban.jsp").forward(request, response);        
    }

}
