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
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/criar.html", "/listar.html", "/excluir.html", "/editar.html"})
public class UsuarioServlet extends HttpServlet {

    @PersistenceUnit(unitName = "lppo-2017-1-jpa2")
    EntityManagerFactory emf;
    
    @Resource(name = "java:comp/UserTransaction")
    
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getServletPath().contains("criar.html")){
            doCriarGet(request, response);
        } else if (request.getServletPath().contains("listar.html")){
            doListarGet(request, response);
        } else if (request.getServletPath().contains("excluir.html")){
            doExcluirGet(request, response);
        } else if (request.getServletPath().contains("editar.html")){
            doEditarGet(request, response);
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if (request.getServletPath().contains("/editar.html")) {
            doEditarPost(request, response);
        } if (request.getServletPath().contains("/criar.html")) {
            doCriarPost(request, response);
        
       
    }
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("WEB-INF/novoUsuario.jsp").forward(request, response);
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) {
       
    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response) {
       
    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) {
       
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) {
        
        Usuario user = new Usuario();
        user.setNome(request.getParameter("nome"));
        user.setEmail(request.getParameter("email"));
        user.setSenha(request.getParameter("senha"));
        
        UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
        
        try{
            dao.create(user);
            response.sendRedirect("listar.html");
         } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }

}