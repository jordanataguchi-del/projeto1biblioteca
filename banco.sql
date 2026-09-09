CREATE DATABASE biblioteca_1ano;
USE biblioteca_1ano;


#Criando usuário
CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';


#Dar Permissão ao usuário
GRANT ALL PRIVILEGES
ON biblioteca_1ano.*
TO 'biblioteca_user1'@'localhost';


#Atualiza Permissão
FLUSH PRIVILEGES;


#Visualizar todas as bases existentes
SHOW DATABASES;


#Visualizar todos os usuários
SELECT user FROM mysql.user;


#Criação da tabela de Aluno
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);


#Criação da tabela de Livro
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);


#Criação da tabela de Professor
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL);


#Criação da tabela de Bibliotecário
CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);


#Criação da tabela de Empréstimo
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    id_bibliotecario INT,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Emprestado',


    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);


#Criação da tabela Usuário
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor ) REFERENCES professor(id_professor ),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)


);


insert into aluno (nome,serie,turma,telefone) 
values('jordana','1 ano','1b','449999-9999'),
('maria eduarda','1 ano','1b','4499999-9999'),
('anthony','1 ano','1b','4499999-9999'),
('kawane','1 ano','1b','4499999-9999'),
('lara','1 ano','1b','4499999-9999');

select * from aluno;

insert into livro (titulo,autor,categoria)
values('dom casmurro','machado de assis','romance'),
('1984','George Orwell','Ficção Científica'),
('O Alquimista','Paulo Coelho','Ficcional'),
('O Pequeno Príncipe','Antoine de Saint-Exupéry','Fábula'),
('As Duas Torres','J. R. R. Tolkien','Alta fantasia');

select * from livro;

insert into professor (nome,email,telefone)
values('claudia','claudia@gmail.com','4499234-4444'),
('rodrigo','rodrigo@gmail.com','4423568-5612'),
('tania','tania@gmail.com','4422134-0593'),
('eliane','eliane@gmail.com','4455676-1234'),
('marcos','marcos@gmail.com','4434334-5567');

select * from professor;

insert into bibliotecario (nome,email)
values('alexandre','alexandre@gmail.com'),
('bernardo','bernardo@gmail.com'),
('claudia','claudia@gmail.com'),
('daiane','daiane@gmail.com'),
('isadora','isadora@gmail.com');

select * from bibliotecario;

insert into emprestimo (data_emprestimo,data_prevista_devolucao,data_devolucao,id_aluno,id_livro,id_bibliotecario,status)
values('2026-06-10','2026-06-20',null,1,1,1,'emprestado'),
('2026-07-07','2026-07-24','2026-07-23',3,2,1,'devolvido'),
('2026-07-15','2026-07-30','2026-07-30',2,3,1,'devolvido'),
('2026-08-07','2026-08-15','2026-08-15',4,5,1,'devolvido'),
('2026-08-10','2026-08-20',null,5,4,1,'emprestado');

select * from emprestimo;

insert into usuario (nome,email,senha,perfil,id_aluno,id_professor,id_bibliotecario)
values('jordana','jordana@gmail.com','1234','aluno',1,null,null),
('kawane','kawane@gmail.com','34567','aluno',4,null,null),
('claudia','claudia@gmail.com','22456','professor',null,1,null),
('tania','tania@gmail.com','34567','professor',null,3,null),
('maria eduarda','maria@gmail.com','12345','aluno',2,null,null);

select * from usuario;



