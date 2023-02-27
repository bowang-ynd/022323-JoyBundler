package com.bowang.joybundler.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.bowang.joybundler.models.Name.Name;

public interface NameRepository extends CrudRepository<Name, Long>{
    List<Name> findAll();
}
