-- =========================================================
-- SISTEMA DE BIBLIOTECA
-- Base de datos: biblioteca_db
-- =========================================================

-- =========================================================
-- 1. ROL
-- =========================================================
CREATE TABLE rol (
    id_rol BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================================================
-- 2. USUARIO
-- =========================================================
CREATE TABLE usuario (
    id_usuario BIGSERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni VARCHAR(8) NOT NULL UNIQUE,
    correo VARCHAR(120) UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    id_rol BIGINT NOT NULL,

    CONSTRAINT fk_usuario_rol
        FOREIGN KEY (id_rol)
        REFERENCES rol(id_rol)
);

-- =========================================================
-- 3. AUTOR
-- =========================================================
CREATE TABLE autor (
    id_autor BIGSERIAL PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(80)
);

-- =========================================================
-- 4. CATEGORIA
-- =========================================================
CREATE TABLE categoria (
    id_categoria BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(200)
);

-- =========================================================
-- 5. EDITORIAL
-- =========================================================
CREATE TABLE editorial (
    id_editorial BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE,
    pais VARCHAR(80),
    telefono VARCHAR(20),
    correo VARCHAR(120)
);

-- =========================================================
-- 6. LIBRO
-- =========================================================
CREATE TABLE libro (
    id_libro BIGSERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    anio_publicacion INTEGER,
    numero_paginas INTEGER,
    id_autor BIGINT NOT NULL,
    id_categoria BIGINT NOT NULL,
    id_editorial BIGINT NOT NULL,

    CONSTRAINT fk_libro_autor
        FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor),

    CONSTRAINT fk_libro_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),

    CONSTRAINT fk_libro_editorial
        FOREIGN KEY (id_editorial)
        REFERENCES editorial(id_editorial)
);

-- =========================================================
-- 7. EJEMPLAR
-- =========================================================
CREATE TABLE ejemplar (
    id_ejemplar BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    estado VARCHAR(30) NOT NULL DEFAULT 'DISPONIBLE',
    ubicacion VARCHAR(100),
    id_libro BIGINT NOT NULL,

    CONSTRAINT fk_ejemplar_libro
        FOREIGN KEY (id_libro)
        REFERENCES libro(id_libro)
);

-- =========================================================
-- 8. PRESTAMO
-- =========================================================
CREATE TABLE prestamo (
    id_prestamo BIGSERIAL PRIMARY KEY,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion_prevista DATE NOT NULL,
    fecha_devolucion_real DATE,
    estado VARCHAR(30) NOT NULL DEFAULT 'ACTIVO',
    id_usuario BIGINT NOT NULL,

    CONSTRAINT fk_prestamo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);

-- =========================================================
-- 9. DETALLE_PRESTAMO
-- =========================================================
CREATE TABLE detalle_prestamo (
    id_detalle BIGSERIAL PRIMARY KEY,
    id_prestamo BIGINT NOT NULL,
    id_ejemplar BIGINT NOT NULL,

    CONSTRAINT fk_detalle_prestamo
        FOREIGN KEY (id_prestamo)
        REFERENCES prestamo(id_prestamo),

    CONSTRAINT fk_detalle_ejemplar
        FOREIGN KEY (id_ejemplar)
        REFERENCES ejemplar(id_ejemplar),

    CONSTRAINT uk_prestamo_ejemplar
        UNIQUE (id_prestamo, id_ejemplar)
);

-- =========================================================
-- 10. MULTA
-- =========================================================
CREATE TABLE multa (
    id_multa BIGSERIAL PRIMARY KEY,
    monto NUMERIC(10,2) NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    fecha_multa DATE NOT NULL DEFAULT CURRENT_DATE,
    estado VARCHAR(30) NOT NULL DEFAULT 'PENDIENTE',
    id_usuario BIGINT NOT NULL,
    id_prestamo BIGINT,

    CONSTRAINT fk_multa_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT fk_multa_prestamo
        FOREIGN KEY (id_prestamo)
        REFERENCES prestamo(id_prestamo)
);

-- =========================================================
-- 11. RESERVA
-- =========================================================
CREATE TABLE reserva (
    id_reserva BIGSERIAL PRIMARY KEY,
    fecha_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_vencimiento DATE,
    estado VARCHAR(30) NOT NULL DEFAULT 'ACTIVA',
    id_usuario BIGINT NOT NULL,
    id_libro BIGINT NOT NULL,

    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT fk_reserva_libro
        FOREIGN KEY (id_libro)
        REFERENCES libro(id_libro)
);