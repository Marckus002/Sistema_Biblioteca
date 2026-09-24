package com.biblioteca.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.biblioteca.entity.Multa;
import com.biblioteca.repository.MultaRepository;

@Service
public class MultaService {

    private final MultaRepository multaRepository;

    public MultaService(MultaRepository multaRepository) {
        this.multaRepository = multaRepository;
    }

    public List<Multa> listar() {
        return multaRepository.findAll();
    }

    public Optional<Multa> buscarPorId(Long id) {
        return multaRepository.findById(id);
    }

    public Multa guardar(Multa multa) {
        return multaRepository.save(multa);
    }

    public void eliminar(Long id) {
        multaRepository.deleteById(id);
    }
}