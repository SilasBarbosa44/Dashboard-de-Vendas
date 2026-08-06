USE VendasDATABASE;

-- 1. ESTADO
INSERT INTO estado (id_estado, estado) VALUES
(1, 'SP'),
(2, 'RJ'),
(3, 'MG'),
(4, 'BA'),
(5, 'PR');

-- 2. CIDADE
INSERT INTO cidade (id_cidade, cidade, id_estado) VALUES
(1, 'Sao Paulo', 1),
(2, 'Campinas', 1),
(3, 'Rio de Janeiro', 2),
(4, 'Belo Horizonte', 3),
(5, 'Salvador', 4),
(6, 'Curitiba', 5);

-- 3. CLIENTES
INSERT INTO clientes (id_cliente, nome, email, cpf, id_cidade) VALUES
(1, 'Pedro Alves', 'pedro@email.com', '12345678901', 1),
(2, 'Julia Costa', 'julia@email.com', '23456789012', 2),
(3, 'Lucas Martins', 'lucas@email.com', '34567890123', 3),
(4, 'Fernanda Lima', 'fernanda@email.com', '45678901234', 4),
(5, 'Rafael Souza', 'rafael@email.com', '56789012345', 5);

-- 4. PRODUTOS
INSERT INTO produtos (id_produto, nome, categoria, marca, fornecedor, preco) VALUES
(1, 'Notebook Dell', 'Informatica', 'Dell', 'TechForne', 4500.00),
(2, 'Mouse Gamer', 'Informatica', 'Logitech', 'TechForne', 250.00),
(3, 'Teclado Mecanico', 'Informatica', 'Razer', 'GameSupply', 600.00),
(4, 'Monitor 24p', 'Informatica', 'LG', 'TechForne', 1200.00),
(5, 'Cadeira Gamer', 'Moveis', 'DXRacer', 'MoveisCorp', 1800.00);

-- 5. VENDEDORES
INSERT INTO vendedores (id_vendedor, nome) VALUES
(1, 'Carlos Silva'),
(2, 'Ana Souza'),
(3, 'Joao Lima'),
(4, 'Maria Oliveira');

-- 6. VENDAS
INSERT INTO vendas (id_venda, id_cliente, id_vendedor, forma_pagamento, data_venda) VALUES
(1, 1, 1, 'PIX', '2025-04-15'),
(2, 2, 2, 'Credito', '2025-04-20'),
(3, 3, 1, 'Debito', '2025-05-10'),
(4, 1, 3, 'PIX', '2025-05-22'),
(5, 4, 2, 'Credito', '2025-06-05'),
(6, 5, 4, 'Debito', '2025-06-18'),
(7, 2, 1, 'PIX', '2025-06-25');

-- 7. ITENS_VENDAS
INSERT INTO itens_vendas (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00),
(1, 2, 2, 250.00),
(2, 3, 1, 600.00),
(2, 4, 1, 1200.00),
(3, 2, 3, 250.00),
(3, 5, 1, 1800.00),
(4, 1, 1, 4500.00),
(4, 3, 1, 600.00),
(5, 2, 1, 250.00),
(5, 4, 2, 1200.00),
(6, 5, 1, 1800.00),
(7, 1, 1, 4500.00),
(7, 2, 2, 250.00);
