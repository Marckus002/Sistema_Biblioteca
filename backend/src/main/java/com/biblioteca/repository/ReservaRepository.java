package com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblioteca.entity.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Long> {
}
