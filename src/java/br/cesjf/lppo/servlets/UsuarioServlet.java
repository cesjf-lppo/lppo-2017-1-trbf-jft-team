/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.lppo.servlets;

import br.cesjf.lppo.dao.UsuarioJpaController;
import br.cesjf.lppo.entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
 * @author cpd
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/criarUsuario.html", "/listarUsuario.html", "/excluirUsuario.html", "/editarUsuario.html"})
public class UsuarioServlet extends HttpServlet {

    @PersistenceUnit(unitName = "lppo-2017-1-trbf-jft-teamPU")
    EntityManagerFactory emf;
    
    @Resource(name = "java:comp/UserTransaction")
    
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getServletPath().contains("criarUsuario.html")){
            doCriarGet(request, response);
        } else if (request.getServletPath().contains("listarUsuario.html")){
            doListarGet(request, response);
        } else if (request.getServletPath().contains("excluirUsuario.html")){
            doExcluirGet(request, response);
	    response.sendRedirect("listarUsuario.html");
        } else if (request.getServletPath().contains("editarUsuario.html")){
            doEditarGet(request, response);
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if (request.getServletPath().contains("/editarUsuario.html")) {
            doEditarPost(request, response);
        } if (request.getServletPath().contains("/criarUsuario.html")) {
            doCriarPost(request, response);
        
       
    }
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("WEB-INF/novoUsuario.jsp").forward(request, response);
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	List<Usuario> usuarios = new ArrayList<>();
	
	UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
	
	usuarios = dao.findUsuarioEntities();
	
	request.setAttribute("usuario", usuarios);
	request.getRequestDispatcher("WEB-INF/listarUsuario.jsp").forward(request, response);
	
    }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	try {
	    UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));
	    dao.destroy(id);
	} catch (Exception ex) {
	    response.sendRedirect("listarUsuario.html");
	}
       
    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));
	    Usuario usuario = dao.findUsuario(id);
	    request.setAttribute("usuario", usuario);
	    request.getRequestDispatcher("WEB-INF/editarUsuario.jsp").forward(request, response);
	} catch (Exception e){
	    response.sendRedirect("listarUsuario.html");
	    
	}
       
    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));
	    Usuario usuario = dao.findUsuario(id);
	    usuario.setNome(request.getParameter("nome"));
	    usuario.setEmail(request.getParameter("email"));
	    usuario.setSenha(request.getParameter("senha"));
	    dao.edit(usuario);
	    
	    response.sendRedirect("listarUsuario.html");
	} catch (Exception e){
	    response.sendRedirect("listarUsuario.html");
	}
       
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) {
        
        Usuario user = new Usuario();
        user.setNome(request.getParameter("nome"));
        user.setEmail(request.getParameter("email"));
        user.setSenha(request.getParameter("senha"));
        
        UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
        
        try{
            dao.create(user);
            response.sendRedirect("listarUsuario.html");
         } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }

}
