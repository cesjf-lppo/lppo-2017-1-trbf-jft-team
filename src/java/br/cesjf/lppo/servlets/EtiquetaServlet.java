package br.cesjf.lppo.servlets;

import br.cesjf.lppo.dao.EtiquetaJpaController;
import br.cesjf.lppo.dao.TarefaJpaController;
import br.cesjf.lppo.dao.UsuarioJpaController;
import br.cesjf.lppo.entidades.Etiqueta;
import br.cesjf.lppo.entidades.Tarefa;
import br.cesjf.lppo.entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
 * @author Júnior
 */
@WebServlet(name = "EtiquetaServlet", urlPatterns = {"/criarEtiqueta.html", "/listarEtiqueta.html", "/excluirEtiqueta.html", "/editarEtiqueta.html", "/listarEtiquetaPorAutor.html", "/listarEtiquetaPorAutorETitulo.html"})
public class EtiquetaServlet extends HttpServlet {

    @PersistenceUnit(unitName = "lppo-2017-1-trbf-jft-teamPU")
    EntityManagerFactory emf;

    @Resource(name = "java:comp/UserTransaction")

    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	if (request.getServletPath().contains("/editarEtiqueta.html")) {
	    doEditarGet(request, response);
	} else if (request.getServletPath().contains("/excluirEtiqueta.html")) {
	    doExcluirGet(request, response);
	    response.sendRedirect("listarEtiqueta.html");
	} else if (request.getServletPath().contains("/listarEtiqueta.html")) {
	    doListarGet(request, response);
	} else if (request.getServletPath().contains("/criarEtiqueta.html")) {
	    doCriarGet(request, response);
	} else if (request.getServletPath().contains("/listarEtiquetaPorAutor.html")) {
	    doListarEtiquetaPorAutorGet(request, response);
	} else if (request.getServletPath().contains("/listarEtiquetaPorAutorETitulo.html")) {
	    doListarEtiquetaPorAutorETituloGet(request, response);
	}

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	if (request.getServletPath().contains("/editarEtiqueta.html")) {
	    doEditarPost(request, response);
	}
	if (request.getServletPath().contains("/criarEtiqueta.html")) {
	    doCriarPost(request, response);
	}
	if (request.getServletPath().contains("/listarEtiquetaPorAutor.html")) {
	    doListarEtiquetaPorAutorPost(request, response);
	}
	if (request.getServletPath().contains("/listarEtiquetaPorAutoreTitulo.html")) {
	    doListarEtiquetaPorAutorETituloPost(request, response);
	}
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	List<Etiqueta> etiquetas = new ArrayList<>();
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	
	// se autor for null 
	
	if (request.getParameter("autorId")!=null){
	    Long autorId = Long.parseLong(request.getParameter("autorId"));
	    etiquetas = dao.getEtiquetaByAutor(autorId);
	} else if (request.getParameter("titulo") != null) {
	    String titulo = request.getParameter("titulo");
	    etiquetas = dao.getEtiquetaByTitulo(titulo);
	} else {
	    etiquetas = dao.findEtiquetaEntities();
	}

	request.setAttribute("etiqueta", etiquetas);
	request.getRequestDispatcher("WEB-INF/listarEtiqueta.jsp").forward(request, response);
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	List<Usuario> usuarios;
	List<Tarefa> tarefas;
	UsuarioJpaController usuarioDao = new UsuarioJpaController(ut, emf);
	TarefaJpaController tarefaDao = new TarefaJpaController(ut, emf);
	usuarios = usuarioDao.findUsuarioEntities();
	tarefas = tarefaDao.findTarefaEntities();

	request.setAttribute("usuario", usuarios);
	request.setAttribute("tarefa", tarefas);

	request.getRequestDispatcher("WEB-INF/novaEtiqueta.jsp").forward(request, response);
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	Etiqueta eti = new Etiqueta();
	eti.setTitulo(request.getParameter("titulo"));
	
	
	Long idUser = Long.parseLong(request.getParameter("usuarioId"));
	
	Long idTar = Long.parseLong(request.getParameter("tarefaId"));
	
	Usuario user = new Usuario();
	UsuarioJpaController daoUser = new UsuarioJpaController(ut, emf);
	
	user = daoUser.findUsuario(idUser);
	
	Tarefa tar = new Tarefa();
	TarefaJpaController daoTar = new TarefaJpaController(ut, emf);
	
	tar = daoTar.findTarefa(idTar);
	
	eti.setUsuario(user);
	eti.setTarefa(tar);
	
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	
	try {
	    dao.create(eti);
	    response.sendRedirect("listarEtiqueta.html");
	} catch (Exception ex){
	    request.getRequestDispatcher("WEB-INF/erro.jsp").forward(request, response);
	}
	
	

    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));
	    Etiqueta etiqueta = dao.findEtiqueta(id);
	    request.setAttribute("etiqueta", etiqueta);
	    request.getRequestDispatcher("WEB-INF/editarEtiqueta.jsp").forward(request, response);
	} catch (Exception e) {
	    response.sendRedirect("listarEtiqueta.html");

	}

    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));
	    Etiqueta etiqueta = dao.findEtiqueta(id);
	    UsuarioJpaController u = new UsuarioJpaController(ut, emf);
	    TarefaJpaController t = new TarefaJpaController(ut, emf);

	    etiqueta.setUsuario((u.findUsuario(Long.parseLong(request.getParameter("usuario_id")))));
	    etiqueta.setTarefa((t.findTarefa(Long.parseLong(request.getParameter("tarefa_id")))));
	    etiqueta.setTitulo(request.getParameter("titulo"));

	    dao.edit(etiqueta);

	    response.sendRedirect("listarEtiqueta.html");

	} catch (Exception e) {
	    response.sendRedirect("listarEtiqueta.html");
	}

    }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	    EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	    Long id = Long.parseLong(request.getParameter("id"));

	    dao.destroy(id);
	} catch (Exception ex) {
	    response.sendRedirect("listarEtiqueta.html");
	}
    }

    private void doListarEtiquetaPorAutorGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	List<Etiqueta> etiqueta = new ArrayList<>();
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	etiqueta = dao.findEtiquetaEntities();
	request.setAttribute("etiqueta", etiqueta);

	List<Usuario> usuario = new ArrayList<>();
	UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
	usuario = dao2.findUsuarioEntities();
	request.setAttribute("usuario", usuario);

	request.getRequestDispatcher("WEB-INF/listarEtiquetaPorAutor.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutorPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Long id = Long.parseLong(request.getParameter("usuario"));

	List<Etiqueta> etiqueta = new ArrayList<>();
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	etiqueta = dao.getEtiquetaByAutor(id);
	request.setAttribute("etiqueta", etiqueta);

	List<Usuario> usuario = new ArrayList<>();
	UsuarioJpaController daoUser = new UsuarioJpaController(ut, emf);
	usuario = daoUser.findUsuarioEntities();
	request.setAttribute("usuario", usuario);

	List<Etiqueta> etiquetas = new ArrayList<>();
	etiquetas = dao.findEtiquetaEntities();
	request.setAttribute("etiquetas", etiquetas);

	request.getRequestDispatcher("WEB-INF/listarEtiquetaPorAutor.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutorETituloGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	List<Etiqueta> etiqueta = new ArrayList<>();
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	etiqueta = dao.findEtiquetaEntities();
	request.setAttribute("etiqueta", etiqueta);

	request.getRequestDispatcher("WEB-INF/listarEtiquetaPorAutorETitulo.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutorETituloPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String titulo = request.getParameter("titulo");

	List<Etiqueta> etiqueta = new ArrayList<>();
	EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
	etiqueta = dao.getEtiquetaByTitulo(titulo);
	request.setAttribute("etiqueta", etiqueta);

	List<Etiqueta> etiquetas = new ArrayList<>();
	etiquetas = dao.findEtiquetaEntities();
	request.setAttribute("etiquetas", etiquetas);

	request.getRequestDispatcher("WEB-INF/listarEtiquetaPorAutorETitulo.jsp").forward(request, response);
    }

}
