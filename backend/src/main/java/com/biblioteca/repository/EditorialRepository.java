package com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.biblioteca.entity.Editorial;

public interface EditorialRepository extends JpaRepository<Editorial, Long> {
}
