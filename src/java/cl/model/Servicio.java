/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import java.util.*;
import cl.entities.*;
/**
 *
 * @author Reynaldo. M
 */
@Stateless
public class Servicio implements ServicioLocal {

    @PersistenceContext(unitName = "tiendaonlinePU")
    private EntityManager em;

    @Override
    public void insertar(Object o) {
        em.persist(o);
    }

    @Override
    public void sincronzar(Object o) {
        em.merge(o);
        em.flush();
    }

    @Override
    public Categoria buscarCategoria(int codigo) {
        return em.find(Categoria.class, codigo);
    }

    @Override
    public void editarCategoria(int codigo, int estado) {
        Categoria cat = buscarCategoria(codigo);
        cat.setEstado(estado);
        em.merge(cat);
        em.flush();
        em.refresh(cat);
    }

    @Override
    public List<Categoria> getCategoria() {
        return em.createQuery("select c from Categoria c").getResultList();
    }

    @Override
    public Usuario buscarUsuario(String usuario) {
        return em.find(Usuario.class, usuario);
    }

    @Override
    public void editarUsuario(String usuario, String clave) {
        Usuario user = buscarUsuario(usuario);
        user.setClave(clave);
        em.merge(user);
        em.flush();
        em.refresh(user);
    }

    @Override
    public List<Usuario> getUsuario() {
        return em.createQuery("select u from Usuario u").getResultList();
    }

    @Override
    public Producto buscarProducto(int codigo) {
        return em.find(Producto.class, codigo);
    }

    @Override
    public void editarProducto(int codigo, int precio, int stock, int estado) {
        Producto p = buscarProducto(codigo);
        p.setPrecio(precio);
        p.setStock(p.getStock()+stock);
        p.setEstado(estado);
        em.merge(p);
        em.flush();
        em.refresh(p);
    }

    @Override
    public List<Producto> getProducto() {
        return em.createQuery("select p from Producto p").getResultList();
    }

    @Override
    public Usuario iniciarSesion(String usuario, String clave) {
        Usuario user = buscarUsuario(usuario);
        return (user !=null && user.getClave().equals(clave))?user:null;
    }

    

    
    
    
    
}
