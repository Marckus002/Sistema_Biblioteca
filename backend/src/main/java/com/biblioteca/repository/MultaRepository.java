package com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblioteca.entity.Multa;

public interface MultaRepository extends JpaRepository<Multa, Long> {
}
