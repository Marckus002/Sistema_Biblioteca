package com.biblioteca.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.biblioteca.entity.DetallePrestamo;
import com.biblioteca.repository.DetallePrestamoRepository;

@Service
public class DetallePrestamoService {

    private final DetallePrestamoRepository detallePrestamoRepository;

    public DetallePrestamoService(DetallePrestamoRepository detallePrestamoRepository) {
        this.detallePrestamoRepository = detallePrestamoRepository;
    }

    public List<DetallePrestamo> listar() {
        return detallePrestamoRepository.findAll();
    }

    public Optional<DetallePrestamo> buscarPorId(Long id) {
        return detallePrestamoRepository.findById(id);
    }

    public DetallePrestamo guardar(DetallePrestamo detallePrestamo) {
        return detallePrestamoRepository.save(detallePrestamo);
    }

    public void eliminar(Long id) {
        detallePrestamoRepository.deleteById(id);
    }
}
