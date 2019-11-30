/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.model.ServicioLocal;
import java.io.IOException;

import cl.entities.*;
import java.util.*;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Reynaldo.M
 */
@WebServlet(name = "Controller", urlPatterns = {"/control.do"})
public class Controller extends HttpServlet {

    @EJB
    private ServicioLocal servicio;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String bt = request.getParameter("bt");
      switch (bt){
          case "addcat":
              addcat(request, response);
              break;
          case "editcat":
              editcat(request, response);
              break;
      }
    }
    protected void addcat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String nombre = request.getParameter("nombre");
      String desc = request.getParameter("desc");
      
      Categoria newcat = new Categoria();
      newcat.setNombre(nombre);
      newcat.setDescripcion(desc);
      newcat.setEstado(1);
      
      servicio.insertar(newcat);
      
      response.sendRedirect("categoria.jsp");
    }
    
    protected void editcat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String cod = request.getParameter("codigo");
      String est = request.getParameter("estado");
      
      int codigo = Integer.parseInt(cod);
      int estado = Integer.parseInt(est);
      
      servicio.editarCategoria(codigo, estado);
      
      response.sendRedirect("categoria.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
