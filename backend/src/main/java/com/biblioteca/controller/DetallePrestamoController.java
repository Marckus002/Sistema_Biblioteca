package com.biblioteca.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.biblioteca.entity.DetallePrestamo;
import com.biblioteca.service.DetallePrestamoService;

@RestController
@RequestMapping("/api/detalles-prestamo")
public class DetallePrestamoController {

    private final DetallePrestamoService detallePrestamoService;

    public DetallePrestamoController(DetallePrestamoService detallePrestamoService) {
        this.detallePrestamoService = detallePrestamoService;
    }

    @GetMapping
    public List<DetallePrestamo> listar() {
        return detallePrestamoService.listar();
    }

    @GetMapping("/{id}")
    public ResponseEntity<DetallePrestamo> buscarPorId(@PathVariable Long id) {
        return detallePrestamoService.buscarPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<DetallePrestamo> guardar(@RequestBody DetallePrestamo detallePrestamo) {
        DetallePrestamo guardado = detallePrestamoService.guardar(detallePrestamo);
        return ResponseEntity.status(HttpStatus.CREATED).body(guardado);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        detallePrestamoService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
