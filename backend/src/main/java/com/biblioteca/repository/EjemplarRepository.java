package com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblioteca.entity.Ejemplar;

public interface EjemplarRepository extends JpaRepository<Ejemplar, Long> {
}
