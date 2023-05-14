package com.porfolio.mgb.Interface;

import com.porfolio.mgb.Entity.Persona;
import java.util.List;


public interface IPersonaService {
    //traer una listad e personas
    public List<Persona> getPersona();
    
    //guardar un objeto de tipo persona
    public void savePersona(Persona persona) ;
    
    //eliminar un objeto pero lo buscamos por Id
    public void deletePersona(Long id) ;
    
    //Buscar una persona por Id
    public Persona findPersona(Long id);
}
