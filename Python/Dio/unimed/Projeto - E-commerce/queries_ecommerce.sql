-- queries

-- recueprar numero de clientes existentes
select count(*) from clients;

-- clientes e os pedidos feitos por eles
select * from clients c, orders o where c.idClient = idOrdersClient;

select concat(Fname, ' ', Lname)  as CLientes , idOrders as Pedido, ordersStatus Pedido_status
		from clients c, orders o where c.idClient = idOrdersClient; 
	
-- inserindo novo pedido
insert into orders (idOrdersClient, ordersStatus, ordersDescription, sendValue, paymentCash) values
					(2, default, 'compra via aplicativo', null, 1);

select * from clients left outer join orders on idClient = idOrdersClient;


-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Numero_pedidos from clients c inner join orders o on c.idClient = o.idOrdersClient
						inner join productOrder p on p.idPoorder = idOrders
                        group by idClient;
                        
                        