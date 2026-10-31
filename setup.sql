
-- =====================================================
-- SETUP.SQL - Banco de Dados Biblioteca
-- Recria o banco, as tabelas, os usuários e os dados.
-- Executar conectado como root no MariaDB.
-- =====================================================

DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    ano_nascimento INT
) ENGINE=InnoDB;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    preco DECIMAL(10,2),
    autor_id INT,
    CONSTRAINT fk_livros_autores
        FOREIGN KEY (autor_id) REFERENCES autores(id)
) ENGINE=InnoDB;

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE DEFAULT NULL,
    CONSTRAINT fk_emprestimos_livros
        FOREIGN KEY (livro_id) REFERENCES livros(id)
) ENGINE=InnoDB;

INSERT INTO autores (id, nome, pais, ano_nascimento) VALUES
(1, 'Machado de Assis', 'Brasil', 1839),
(2, 'Clarice Lispector', 'Brasil', 1920),
(3, 'Gabriel García Márquez', 'Colômbia', 1927),
(4, 'Jane Austen', 'Inglaterra', 1775),
(5, 'José de Alencar', 'Brasil', 1829),
(6, 'Jorge Amado', 'Brasil', 1912),
(7, 'Monteiro Lobato', 'Brasil', 1882),
(8, 'Fernando Pessoa', 'Portugal', 1888),
(9, 'Victor Hugo', 'França', 1802),
(10, 'Charles Dickens', 'Inglaterra', 1812),
(11, 'George Orwell', 'Inglaterra', 1903),
(12, 'Agatha Christie', 'Inglaterra', 1890),
(13, 'Ernest Hemingway', 'Estados Unidos', 1899),
(14, 'Federico García Lorca', 'Espanha', 1898);

INSERT INTO livros (id, titulo, ano_publicacao, preco, autor_id) VALUES
(1, 'Dom Casmurro', 1899, 39.90, 1),
(2, 'Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
(3, 'A Hora da Estrela', 1977, 32.50, 2),
(4, 'Cem Anos de Solidão', 1967, 59.90, 3),
(5, 'Orgulho e Preconceito', 1813, 29.90, 4),
(6, 'O Guarani', 1857, 34.90, 5),
(7, 'Iracema', 1865, 29.90, 5),
(8, 'Senhora', 1875, 39.90, 5),
(9, 'Capitães da Areia', 1937, 42.90, 6),
(10, 'Gabriela, Cravo e Canela', 1958, 49.90, 6),
(11, 'Dona Flor e Seus Dois Maridos', 1966, 45.90, 6),
(12, 'O Sítio do Picapau Amarelo', 1920, 35.90, 7),
(13, 'Urupês', 1918, 32.90, 7),
(14, 'Mensagem', 1934, 39.90, 8),
(15, 'Livro do Desassossego', 1982, 55.90, 8),
(16, 'Os Miseráveis', 1862, 59.90, 9),
(17, 'O Corcunda de Notre-Dame', 1831, 49.90, 9),
(18, 'Oliver Twist', 1838, 44.90, 10),
(19, 'Um Conto de Duas Cidades', 1859, 49.90, 10),
(20, 'David Copperfield', 1850, 54.90, 10),
(21, 'A Revolução dos Bichos', 1945, 35.90, 11),
(22, '1984', 1949, 42.90, 11),
(23, 'Assassinato no Expresso do Oriente', 1934, 45.90, 12),
(24, 'E Não Sobrou Nenhum', 1939, 39.90, 12),
(25, 'Morte no Nilo', 1937, 42.90, 12),
(26, 'O Velho e o Mar', 1952, 37.90, 13),
(27, 'Adeus às Armas', 1929, 43.90, 13),
(28, 'Romancero Gitano', 1928, 39.90, 14),
(29, 'Bodas de Sangue', 1933, 34.90, 14),
(30, 'A Casa de Bernarda Alba', 1936, 36.90, 14);

INSERT INTO emprestimos
    (id, livro_id, data_emprestimo, data_devolucao)
VALUES
(1, 1, '2026-10-20', NULL),
(2, 2, '2026-10-22', NULL),
(3, 3, '2026-10-15', '2026-10-25');

DROP USER IF EXISTS 'app_biblioteca'@'%';
DROP USER IF EXISTS 'consulta'@'%';

CREATE USER 'app_biblioteca'@'%'
    IDENTIFIED BY 'AppBiblioteca_Trocar123!';

CREATE USER 'consulta'@'%'
    IDENTIFIED BY 'Consulta_Trocar456!';

GRANT SELECT, INSERT, UPDATE, DELETE
    ON biblioteca.*
    TO 'app_biblioteca'@'%';

GRANT SELECT
    ON biblioteca.*
    TO 'consulta'@'%';

FLUSH PRIVILEGES;
