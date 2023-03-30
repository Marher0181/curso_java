/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.levelup.services;

import edu.levelup.entities.Tarea;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import java.util.List;

/**
 *
 * @author marher
 */
public class TareaService {
        //agregar tarea (usuario, tarea)

    public void crearTarea(Integer Usuario, Tarea unaTarea) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(unaTarea);
        entityManager.getTransaction().commit();
        entityManager.close();

    }
    //listar tareas
    public List<Tarea> listarTareas() {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        Query query = entityManager.createQuery("SELECT t FROM Tarea t");
        List<Tarea> listaTareas = query.getResultList();
        entityManager.close();
        return listaTareas;
    }

        //editar tarea  (usuario, tarea)
    public void actualizarTarea(Tarea tareaActualizada) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        Tarea tareaExistente = entityManager.find(Tarea.class, tareaActualizada.getIdTarea());
        if (tareaExistente != null) {
            tareaExistente.setNombre(tareaActualizada.getNombre());
            tareaExistente.setFinalizado(tareaActualizada.getFinalizado());
            entityManager.merge(tareaExistente);
            entityManager.getTransaction().commit();
        }
        entityManager.close();
    }
    //eliminar tarea  (usuario, tarea)
    public void eliminarTarea(int idTarea) {
        EntityManager entityManager
                = Persistence.createEntityManagerFactory("TODOLISTPU")
                        .createEntityManager();
        entityManager.getTransaction().begin();
        Tarea tareaAEliminar = entityManager.find(Tarea.class, idTarea);
        if (tareaAEliminar != null) {
            entityManager.remove(tareaAEliminar);
            entityManager.getTransaction().commit();
        }
        entityManager.close();
    }



    // cambiar estado de tarea  (usuario, tarea)
    public void cambiarEstadoTarea(int idTarea) {
    EntityManager entityManager = Persistence.createEntityManagerFactory("TODOLISTPU")
            .createEntityManager();
    entityManager.getTransaction().begin();
    Tarea tarea = entityManager.find(Tarea.class, idTarea); // buscar tarea por ID
    boolean estadoActual = tarea.getFinalizado(); // obtener estado actual
    tarea.setFinalizado(!estadoActual); // invertir el estado actual
    entityManager.getTransaction().commit();
    entityManager.close();
}

}
