CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- Insere os dados apenas se o email ainda não estiver cadastrado
INSERT IGNORE INTO usuarios (nome, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Carlos', 'carlos@example.com');

