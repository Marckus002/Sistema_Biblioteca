package com.biblioteca.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.biblioteca.entity.Editorial;
import com.biblioteca.repository.EditorialRepository;

@Service
public class EditorialService {

    private final EditorialRepository editorialRepository;

    public EditorialService(EditorialRepository editorialRepository) {
        this.editorialRepository = editorialRepository;
    }

    public List<Editorial> listar() {
        return editorialRepository.findAll();
    }

    public Optional<Editorial> buscarPorId(Long id) {
        return editorialRepository.findById(id);
    }

    public Editorial guardar(Editorial editorial) {
        return editorialRepository.save(editorial);
    }

    public void eliminar(Long id) {
        editorialRepository.deleteById(id);
    }
}
