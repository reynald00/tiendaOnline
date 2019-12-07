<%-- 
    Document   : usuario
    Created on : 29-nov-2019, 16:55:50
    Author     : Reynaldo.M
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="cl.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! ServicioLocal servicio; %>

<% 
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/tiendaonline/Servicio!cl.model.ServicioLocal");
    
    List<Usuario> lista = servicio.getUsuario();
    
%>
<c:set scope="page" var="lista" value="<%=lista%>"/>

  <!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
   
    <!-- JQuery-->
       <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>     
    <!-- JavaScript -->
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"> </script> 
    
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
         <div class="row"> 
            <div class="col s12 m12 l6 xl5">
                <h5>Nuevo Usuario</h5>
                ${msg}
                <form action="control.do" method="POST">
                  <div class="input-field">
                      <input id="usuario" type="text" name="usuario">
                        <label for="usuario">Usuario</label>
                  </div>
                  <div class="input-field">
                      <input id="nombre" type="text" name="nombre">
                        <label for="nombre">Nombre</label>
                  </div>
                  <div class="input-field">
                      <input id="apellido" type="text" name="apellido">
                        <label for="apellido">Apellido</label>
                  </div>
                  <div class="input-field">
                        <input id="correo" type="email" name="correo">
                        <label for="correo">Correo</label>
                  </div>
                  <div class="input-field">
                        <input id="clave" type="password" name="clave">
                        <label for="clave">Contraseña</label>
                  </div>
                    <select name="tipo">
                        <option>Vendedor</option>
                        <option>Cliente</option>
                        <option value="admin">Administrador</option>
                    </select>
                    <button class="btn right" name="bt" value="adduser" type="submit">
                        Guardar
                    </button>
                </form>
           </div> 
           <div class="col s12 m12 l6 xl7">
               <h5>Usuarios Registrados</h5>
                <table class="striped ">
                    <thead>
                    <tr>
                        <td>Usuario</td>
                        <td>Nombre</td>
                        <td>Apellido</td>
                        <td>Correo</td>
                        <td>Contraseña</td>
                        <td>Tipo</td>                        
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lista}" var="u">
                      <tr>
                        <td>${u.usuario}</td>
                        <td>${u.nombre}</td>
                        <td>${u.apellido}</td>
                        <td>${u.email}</td>
                        <td>${u.clave}</td>
                        <td>${u.tipo}</td>                  
                      </tr>
                    </c:forEach>
                    </tbody>
                </table>
           </div>        
        </div>

      <script>
         $(document).ready(function() {
            $('select').material_select();
         });
      </script>
      
    </body>
  </html>
