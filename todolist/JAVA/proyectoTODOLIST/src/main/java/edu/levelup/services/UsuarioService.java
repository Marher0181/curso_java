/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.levelup.services;

import edu.levelup.entities.Usuario;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import java.util.List;

/**
 *
 * @author marher
 */
public class UsuarioService {

    //edu.levelup_TodoList_MCCM_war_1.0-SNAPSHOTPU
    public void crearUsuario(Usuario unUsuario) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(unUsuario);
        entityManager.getTransaction().commit();
        entityManager.close();

    }

    public void eliminarUsuario(int idUsuario) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        Usuario usuarioAEliminar = entityManager.find(Usuario.class, idUsuario);
        if (usuarioAEliminar != null) {
            entityManager.remove(usuarioAEliminar);
            entityManager.getTransaction().commit();
        }
        entityManager.close();
    }

    public void editarUsuario(Usuario usuarioModificado) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        Usuario usuarioExistente = entityManager.find(Usuario.class, usuarioModificado.getIdUsuario());
        if (usuarioExistente != null) {
            usuarioExistente.setNombre(usuarioModificado.getNombre());
            usuarioExistente.setApellido(usuarioModificado.getApellido());
            usuarioExistente.setEmail(usuarioModificado.getEmail());
            // modificar otros atributos si es necesario
            entityManager.merge(usuarioExistente);
            entityManager.getTransaction().commit();
        }
        entityManager.close();
    }

    // autenticar (usuario) 
    /**
     * realiza la autenticacion y devuelve el usuario o null si el usuario no
     * existe o no cumple con la contraseña
     */
    public Usuario autenticar(String usuario, String password) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();

        Query consulta = entityManager.createQuery("from Usuario where email = '" + usuario + "'");
        List<Usuario> usuarios = consulta.getResultList();
        if (usuarios != null && usuarios.isEmpty() == false) {
            Usuario usr = usuarios.get(0);
            if (usr.getPassword().equals(password)) {
                return usr; // si es valido
            }
        }

        return null; //no valido
    }

    //agregar tarea (usuario, tarea)
    //editar tarea  (usuario, tarea)
    //eliminar tarea  (usuario, tarea)
    // cambiar estado de tarea  (usuario, tarea)
    //listar tareas
}
