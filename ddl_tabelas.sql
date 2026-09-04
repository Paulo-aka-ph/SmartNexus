

CREATE DATABASE IF NOT EXISTS SmartNexus;

USE SmartNexus;




CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    foto_perfil VARCHAR(255),
    data_cadastro DATE NOT NULL
);


CREATE TABLE portfolio (
    id_portfolio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    imagem VARCHAR(255),
    data_publicacao DATE NOT NULL,

    CONSTRAINT fk_portfolio_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




CREATE TABLE feedback (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    avaliacao TINYINT NOT NULL,
    comentario TEXT NOT NULL,
    data_feedback DATE NOT NULL,

    CONSTRAINT chk_avaliacao
        CHECK (avaliacao BETWEEN 1 AND 5),

    CONSTRAINT fk_feedback_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




CREATE TABLE configuracao (
    id_config INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    foto VARCHAR(255),
    senha VARCHAR(255) NOT NULL,
    idioma VARCHAR(30) NOT NULL,
    tema VARCHAR(20) NOT NULL,
    notificacoes BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_configuracao_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE suporte (
    id_suporte INT AUTO_INCREMENT PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT,
    mensagem TEXT,
    data_abertura DATE NOT NULL
);



CREATE TABLE politica_privacidade (
    id_politica INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT NOT NULL,
    data_atualizacao DATE NOT NULL
);




CREATE TABLE sobre_site (
    id_sobre INT AUTO_INCREMENT PRIMARY KEY,
    historia TEXT NOT NULL,
    missao TEXT NOT NULL,
    objetivos TEXT NOT NULL,
    informacoes_empresa TEXT NOT NULL
);




CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    assunto VARCHAR(100) NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio DATE NOT NULL
);
