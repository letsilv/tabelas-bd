
CREATE DATABASE bdfluxocaixa;
USE bdfluxocaixa;
 
CREATE TABLE Empresa (
    idempresa INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(100),
    cidade VARCHAR(100),
    cnpj VARCHAR(14),
    contato VARCHAR(20),
    email VARCHAR(100),
    situacao ENUM('A', 'I') DEFAULT 'A'
);
 
CREATE TABLE Fluxo (
    idfluxo INT AUTO_INCREMENT PRIMARY KEY,
    idfluxo_empresa INT,
    data DATE,
    valor DECIMAL(10, 2),
    descricao VARCHAR(100),
    situacao ENUM('P', 'A') DEFAULT 'A',
    FOREIGN KEY (idfluxo_empresa) REFERENCES Empresa(idempresa)
);
 
INSERT INTO Empresa (nome_empresa, cidade, cnpj, contato, email, situacao) VALUES
('Coopercitrus', 'Bebedouro', '12345678901234', '(17) 1234-5678', 'cooper@techvision.com', 'A'),
('Credicitrus', 'Bebedouro', '98765432109876', '(17) 9876-5432', 'credi@greenleaf.com', 'I'),
('Granpalato', 'Bebedouro', '45678901234567', '(17) 4567-8901', 'gran@crimsonsunrise.com', 'A'),
('ApisVida', 'Bebedouro', '65432109876543', '(17) 6543-2109', 'apisvida@phoenixinnovations.com', 'I'),
('Forno Paulista', 'Bebedouro', '32109876543210', '(17) 3210-9876', 'forno@ecobloom.com', 'A');
 
INSERT INTO Fluxo (idfluxo_empresa, data, valor, descricao, situacao) VALUES
(1, '2024-03-01', 1000.00, 'Pagamento de fornecedor', 'P'),
(1, '2024-06-25', 1500.00, 'Recebimento de cliente', 'P'),
(2, '2024-03-10', 800.00, 'Pagamento de despesas', 'A'),  
(3, '2024-03-15', 2000.00, 'Recebimento de venda', 'P'),
(4, '2024-03-20', 500.00, 'Pagamento de aluguel', 'A'),
(5, '2024-03-25', 1200.00, 'Recebimento de serviço', 'P'),
(1, '2024-03-28', 1800.00, 'Pagamento de fornecedor', 'P');
 
SELECT * FROM Fluxo WHERE situacao = 'P';
 
SELECT * FROM Fluxo WHERE valor > 1000;