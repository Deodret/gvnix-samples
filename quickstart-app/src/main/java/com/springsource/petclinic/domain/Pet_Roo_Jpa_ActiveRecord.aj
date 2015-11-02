// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Pet;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Pet_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Pet.entityManager;
    
    public static final List<String> Pet.fieldNames4OrderClauseFilter = java.util.Arrays.asList("sendReminders", "name", "weight", "owner", "type", "visits", "occChecksum");
    
    public static final EntityManager Pet.entityManager() {
        EntityManager em = new Pet().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Pet.countPets() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Pet o", Long.class).getSingleResult();
    }
    
    public static List<Pet> Pet.findAllPets() {
        return entityManager().createQuery("SELECT o FROM Pet o", Pet.class).getResultList();
    }
    
    public static List<Pet> Pet.findAllPets(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Pet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Pet.class).getResultList();
    }
    
    public static Pet Pet.findPet(Long id) {
        if (id == null) return null;
        return entityManager().find(Pet.class, id);
    }
    
    public static List<Pet> Pet.findPetEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Pet o", Pet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Pet> Pet.findPetEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Pet o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Pet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Pet.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Pet.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Pet attached = Pet.findPet(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Pet.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Pet.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Pet Pet.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Pet merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
