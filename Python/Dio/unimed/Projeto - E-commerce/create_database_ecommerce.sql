-- Criação do banco de dados para o cenário e-commerce

create database ecommerce;
use ecommerce;

-- Criar tabela cliente 

create table clients(
	idClient int auto_increment primary key,
	Fname varchar (10),
    Minit char (3),
    Lname varchar(10),
    CPF char (11) not null,
	Address varchar (30),
    constraint unique_cpf_client unique (CPF)
    );
desc product;
-- Criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar (10) not null,
    classification_kids bool default false,
    category enum ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar (10)
);

-- ORDER
create table orders(
	idOrders int auto_increment primary key,
    idOrdersClient int,
    OrdersStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    OrdersDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient)
    );
desc orders;
-- Criar tabela pagamento
create table payment(
	idPayment int,
    idClient int,
	typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar (225),
    quantity int default 0
);

-- criar tabela fornecedor 
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char (15) not null,
    contact char (11),
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar (255) not null,
    AbstName varchar (255),
    CNPJ char (15),
    CPF char (11),
    location varchar (255),
    contact char (11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
drop table productSeller;
-- criar tabela produto vendendor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references Seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

-- criar tabela pedido produto
create table productOrder(
	idPoproduct int,
    idPoorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPoproduct, idPoorder),
    constraint fk_productorder_seller foreign key (idPoproduct) references product (idProduct),
    constraint fk_productorder_product foreign key (idPoorder) references orders (idOrders)
);

create table storagelocation(
	idLproduct int,
    idLstorage int,
    location varchar (255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

show tables;
select * from productSupplier;

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product (idProduct)
    );

create table physicalPerson(
	idPhysicalPerson int auto_increment primary key,
    Fname varchar (20) not null,
    Lname varchar (20) not null,
    CPF char(11) not null,
    Address varchar (30),
    constraint unique_cpf_physicalPerson unique (CPF)
);

create table legalPerson(
	idLegalPerson int auto_increment primary key,
    companyName varchar (20) not null,
    CNPJ char (15),
    Address varchar (30),
    constraint unique_cnpj_legalPerson unique (CNPJ)
);






