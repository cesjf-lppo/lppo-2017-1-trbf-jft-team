package br.cesjf.lppo.servlets;

import br.cesjf.lppo.dao.TarefaJpaController;
import br.cesjf.lppo.dao.exceptions.RollbackFailureException;
import br.cesjf.lppo.entidades.Tarefa;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * @author Júnior
 */
@WebServlet(name = "TarefaServlet", urlPatterns = {"/criarTarefa.html", "/listarTarefa.html", "/excluirTarefa.html", "/editarTarefa.html"})
public class TarefaServlet extends HttpServlet {

    @PersistenceUnit(unitName = "lppo-2017-1-trbf-jft-teamPU")
    EntityManagerFactory emf;
    
    @Resource(name = "java:comp/UserTransaction")
    
    UserTransaction ut;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getServletPath().contains("/criarTarefa.html")){
            doCriarGet(request, response);
        } else if (request.getServletPath().contains("/listarTarefa.html")){
            doListarGet(request, response);
        } else if (request.getServletPath().contains("/excluirTarefa.html")){
            doExcluirGet(request, response);
        } else if (request.getServletPath().contains("/editarTarefa.html")){
            doEditarGet(request, response);
        }
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        if (request.getServletPath().contains("/criarTarefa.html")) {
            try {
                doCriarPost(request,response);
            } catch (ParseException ex) {
                Logger.getLogger(TarefaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getServletPath().contains("/editarTarefa.html")) {
            doEditarPost(request,response);
        } 
    }


    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getRequestDispatcher("WEB-INF/novaTarefa.jsp").forward(request, response);
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            
            List<Tarefa> tarefa;
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            tarefa = dao.findTarefaEntities();
            
            request.setAttribute("tarefa", tarefa);
            request.getRequestDispatcher("WEB-INF/listarTarefa.jsp").forward(request, response);
            
        }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            dao.destroy(id);
        } catch (Exception e) {
            response.sendRedirect("WEB-INF/erro.jsp");
        }   response.sendRedirect("listarTarefa.html");
    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            
            Long id = Long.parseLong(request.getParameter("id"));
            Tarefa tarefa = dao.findTarefa(id);
            request.setAttribute("tarefa", tarefa);
            request.getRequestDispatcher("WEB-INF/editarTarefa.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("listarTarefa.html");
        }
    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            TarefaJpaController dao = new TarefaJpaController(ut, emf);

            Long id = Long.parseLong(request.getParameter("id"));
            Tarefa tarefa = dao.findTarefa(id);
            
            tarefa.setTitulo(request.getParameter("titulo"));
            tarefa.setDescricao(request.getParameter("descricao"));
            
            SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
        try {
            tarefa.setDataConcluir(data.parse(request.getParameter("dataConcluir")));
        } catch (ParseException ex) {
            Logger.getLogger(TarefaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            tarefa.setDataConclusao(data.parse(request.getParameter("dataConclusao")));
        } catch (ParseException ex) {
            Logger.getLogger(TarefaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        dao.edit(tarefa);
        response.sendRedirect("listaTarefa.html");       
    } catch (Exception e) {
        response.sendRedirect("WEB-INF/erro.jsp");
    }
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        
        Tarefa tarefa = new Tarefa();
        tarefa.setTitulo(request.getParameter("titulo"));
        tarefa.setDescricao(request.getParameter("descricao"));
        
        SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
        try {
            tarefa.setDataConcluir(data.parse(request.getParameter("dataConcluir")));
        } catch (ParseException ex) {
            Logger.getLogger(TarefaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        TarefaJpaController dao = new TarefaJpaController(ut, emf);
        
        try{
            dao.create(tarefa);
            response.sendRedirect("listarTarefa.html");
         } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
