package cl.model;

import javax.ejb.Local;
import java.util.*;
import cl.entities.*;

/**
 *
 * @author Reynaldo.M
 */
@Local
public interface ServicioLocal {
    void insertar(Object o);
    void sincronzar(Object o);
    
    //MÓDULO CATEGORÍA
        Categoria buscarCategoria (int codigo);
        void editarCategoria(int codigo, int estado);
        List<Categoria> getCategoria();
    //MÓDULO USUARIO
        Usuario buscarUsuario(String usuario);
        void editarUsuario(String usuario, String clave);
        List<Usuario> getUsuario();
    //MÓDULO PRODUCTO
        Producto buscarProducto(int codigo);
        void editarProducto(int codigo, int precio, int stock, int estado);
        List<Producto> getProducto();
    //INICIAR SESIÓN
        Usuario iniciarSesion(String usuario, String clave);
        
}

