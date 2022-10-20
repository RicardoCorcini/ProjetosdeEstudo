-- inserção de dados e queries

use ecommerce;

show tables;

-- idCLient, Fname, Minit, Lname,CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values ('Maria', 'M', 'Silva', 123456789, 'rua Silva de prata'),
			('Mateus', 'O', 'Pimentel', 987654321, 'rua alameda Cidade'),
            ('Ricardo', 'F', 'Silva', 098485736, 'avenida alameda Centro'),
            ('Julia', 'G', 'França', 987645362, 'rua das laranjeiras '),
			('Roberta', 'N', 'Assis', 859309876, 'rua koller 287 centro'),
            ('Isabela', 'G', 'Santos', 758398763, 'Rua 29 cidade de Lisboa');
            
desc product;
            
-- idproduct, Pname, description, price
insert into product (Pname, descritpion, price) values
						('Fone','Eletrônico', 1.50),
                       ('Barbie','Brinquedos', 200.56),
                       ('Body' ,'Vestimenta', 450.95),
                       ('Microfone','Eletrônico', 800.98),
                       ('Sofá','Móveis', 1500.78),
                       ('Farinha', 'ALimentos', 58.50),
                       ('Fire','Eletrônico', 700.89);
                       
-- idOrders, idOrdersClient, OrdersStatus, OrdersDescription, sendValue, paymentCash
insert into orders (idOrdersClient, OrdersStatus, OrdersDescription, sendValue, paymentCash) values
					(1, default, 'compra via aplicativo', null, 1),
                    (2, default, 'compra via aplicativo', 50, 0),
                    (3, 'confirmado', null, null, 1),
                    (4, default, 'compra via web site', 150,0);
                    
-- idPoproduct, idPoorder, poQuantity, poStatus
insert into productOrder (idPoproduct, idPoorder, poQuantity, poStatus) values
							(1,5,2, null),
                            (2,5,1, null),
                            (3,6,1, null);
                            
-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
							('Rio de janeiro', 1000),
                            ('Rio de janeiro', 500),
                            ('São Paulo', 10),
                            ('São Paulo', 100),
                            ('São Paulo', 10),
                            ('Brasilia', 60);
                            
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
					('Almeida e filhos',678475839209876, '89876453'),
                    ('Eletrônicos Silva', 987437645382987, '95743627'),
                    ('Eletrônicos Valma', 874658390273645, '47563897');
                    
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics', null, 746583928376453, null, 'Rio de Janeiro', 87654328),
                    ('Botique Durgas', null, null, 67584345689, 'Rio de Janeiro', 54637890),
                    ('Kids world', null, 876543214567898, null, 'São Paulo', 83765438);
                    
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(1,6,80),
                            (2,7,10);


