package com.bowang.joybundler.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bowang.joybundler.models.Name.Name;
import com.bowang.joybundler.repositories.NameRepository;

@Service
public class NameService {
    
    @Autowired 
    private NameRepository nameRepository;

    //! CREATE
    public void createName(Name name){
        nameRepository.save(name);
    }

    //! READ ALL
    public List<Name> readAllNames(){
        return nameRepository.findAll();
    }

    //! READ ONE
    public Name readOneName(Long id){
        Optional<Name> optionalName = nameRepository.findById(id);
        return optionalName.orElse(null);
    }

    //! UPDATE
    public void updateOneName(Name name){
        nameRepository.save(name);
    }

    //! DELETE
    public void deleteOneName(Long id){
        nameRepository.deleteById(id);
    }

}
