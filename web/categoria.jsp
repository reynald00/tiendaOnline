<%-- 
    Document   : categoria
    Created on : 29-nov-2019, 16:51:08
    Author     : Reynaldo.M
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="cl.entities.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! ServicioLocal servicio; %>

<% 
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/tiendaonline/Servicio!cl.model.ServicioLocal");
    
    List<Categoria> lista = servicio.getCategoria();
    
%>
<c:set scope="page" var="lista" value="<%=lista%>"/>

  <!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        
        <div class="row">
            <div class="col s6">
                <h4>Categorías</h4>
                <form action="control.do" method="POST">
                  <div class="input-field">
                      <input id="nombre" type="text" name="nombre">
                        <label for="nombre">Nombre</label>
                  </div>
                  <div class="input-field">
                        <input id="desc" type="text" name="desc">
                        <label for="desc">Descripción</label>
                  </div>
                    <button class="btn right" name="bt" value="addcat" type="submit">
                        Guardar
                    </button>
                </form>
                
                <br><br>
                <table class="">
                    <tr>
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Descripción</td>
                        <td>Estado</td>
                    </tr>
                    <c:forEach items="${lista}" var="c">
                        <tr>
                        <td>${c.codigocategoria}</td>
                        <td>${c.nombre}</td>
                        <td>${c.descripcion}</td>
                        <td>
                            <c:if test="${c.estado eq 1}">
                                Activado
                            </c:if>
                            <c:if test="${c.estado eq 0}">
                                Desactivado
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${c.estado eq 1}">
                                <a href="control.do?bt=editcat&codigo=${c.codigocategoria}&estado=0" class="btn-floating">
                                    <i class="material-icons">done</i>
                                </a>
                            </c:if>
                            <c:if test="${c.estado eq 0}">
                                <a href="control.do?bt=editcat&codigo=${c.codigocategoria}&estado=1" class="btn-floating red">
                                    <i class="material-icons">close</i>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>            
        </div>

      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>
