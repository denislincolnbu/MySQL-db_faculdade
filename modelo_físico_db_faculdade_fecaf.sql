-- Criação da tabela de cursos
CREATE TABLE tbl_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    duracao INT NOT NULL
);

-- Criação da tabela de alunos
CREATE TABLE tbl_alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(15),
    status ENUM('ativo', 'trancado', 'formado') NOT NULL,
    id_curso INT,
    data_matricula DATE,
    data_conclusao DATE,
    FOREIGN KEY (id_curso) REFERENCES tbl_cursos(id_curso)
);

-- Criação da tabela de matérias
CREATE TABLE tbl_materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    carga_horaria INT NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES tbl_cursos(id_curso)
);

-- Criação da tabela de professores
CREATE TABLE tbl_professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(15)
);

-- Criação da tabela de turmas
CREATE TABLE tbl_turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_materia INT,
    id_professor INT,
    ano_semestre VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_materia) REFERENCES tbl_materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES tbl_professores(id_professor)
);

-- Criação da tabela de alunos matriculados (relaciona alunos com turmas)
CREATE TABLE tbl_alunos_matriculados (
    id_aluno INT,
    id_turma INT,
    PRIMARY KEY (id_aluno, id_turma),
    FOREIGN KEY (id_aluno) REFERENCES tbl_alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES tbl_turmas(id_turma)
);

-- Criação da tabela de notas
CREATE TABLE tbl_notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    nota DECIMAL(5,2) NOT NULL,
    faltas INT DEFAULT 0,
    data_avaliacao DATE,
    FOREIGN KEY (id_aluno) REFERENCES tbl_alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES tbl_turmas(id_turma)
);
