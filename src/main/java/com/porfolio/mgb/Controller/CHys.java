/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.porfolio.mgb.Controller;

import com.porfolio.mgb.Dto.dtoHys;
import com.porfolio.mgb.Entity.hys;
import com.porfolio.mgb.Security.Controller.Mensaje;
import com.porfolio.mgb.Service.Shys;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
/*@CrossOrigin(origins = "https://frondend-ronaldo-cortez.web.app")*/
@RequestMapping("/skill")
public class CHys {
    @Autowired
    Shys shys;
    
     @GetMapping("/lista")
    public ResponseEntity<List<hys>> list() {
        List<hys> list = shys.list();
        return new ResponseEntity(list, HttpStatus.OK);
    }
    @GetMapping("/detail/{id}")
    public ResponseEntity<hys>getByld(@PathVariable("id")int id){
        if(!shys.existsById(id))
            return new ResponseEntity(new Mensaje("no existe"),HttpStatus.NOT_FOUND);
        hys hYs = shys.getOne(id).get();
        return new ResponseEntity(hYs,HttpStatus.OK);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") int id) {
        if (! shys. existsById(id)) {
            return  new ResponseEntity(new Mensaje("no existe"), HttpStatus. NOT_FOUND);
        }
        shys.delete(id);
        return  new ResponseEntity(new Mensaje(" skill eliminado"), HttpStatus.OK);
    }
    
    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody dtoHys dtohys) {
        if (StringUtils.isBlank(dtohys.getNombre()))
            return new ResponseEntity(new Mensaje("El nombre es obligatorio"), HttpStatus.BAD_REQUEST);
        if(shys.existsByNombre(dtohys.getNombre()))
            return new ResponseEntity(new Mensaje("Esa experiencia  ya existe"), HttpStatus.BAD_REQUEST);
        
        hys hYs = new hys(dtohys.getNombre(), dtohys.getPorcentaje());
        shys.save(hYs);
        
        return new ResponseEntity(new Mensaje("skill agregada"), HttpStatus.OK);
    }
    
    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") int id, @RequestBody dtoHys dtohys){
        //Validamos si existe el ID
        if(!shys.existsById(id))
            return new ResponseEntity(new Mensaje("El ID no existe"), HttpStatus.BAD_REQUEST);
        //Compara nombre de skill
        if(shys.existsByNombre(dtohys.getNombre()) && shys.getByNombre(dtohys.getNombre()).get().getId() != id)
            return new ResponseEntity(new Mensaje("Esa skill ya existe"), HttpStatus.BAD_REQUEST);
        //No puede estar vacio
        if(StringUtils.isBlank(dtohys.getNombre()))
            return new ResponseEntity(new Mensaje("El nombre es obligatorio"), HttpStatus.BAD_REQUEST);
        
        hys hYs = shys.getOne(id).get();
        hYs.setNombre(dtohys.getNombre());
        hYs.setPorcentaje(dtohys.getPorcentaje());
        
        shys.save(hYs);
        return new ResponseEntity(new Mensaje("Skill actualizada"), HttpStatus.OK);
    }
    
}
