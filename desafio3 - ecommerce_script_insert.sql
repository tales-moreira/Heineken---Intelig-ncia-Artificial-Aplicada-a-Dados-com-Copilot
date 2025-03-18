use ecommerce;

insert into clients (FName, MInit, LName, CPF, Address)
		values ('Maria', 'M', 'Silva', '12345678910','Rua Silva de prata 29, Carangola - Cidade das flores'),
				('Matheus', 'O', 'Pimentel', '01987654321','Avenida Alameda 289, Centro - Cidade das flores'),
                ('Ricardo', 'F', 'Silva', '97423267481','Avenida Alameda vinha 1009, Centro - Cidade das flores'),
                ('Julia', 'S', 'França', '62974328802','Rua Laranjeiras 861, Centro - Cidade das flores'),
                ('Roberta', 'G', 'Assis', '43576867183','Avenida Koller 19, Centro - Cidade das flores'),
                ('Isabela', 'M', 'Cruz', '75353577874','Rua Alameda das flores 28, Centro - Cidade das flores');

insert into product(PName, classification_kids, category, Avaliação, size)values
		('Fone de ouvido',false,'Eletrônicos','4',null),
        ('Barbie Elsa',true,'Brinquedos','3',null),
        ('Body Carters',true,'Vestimenta','5',null),
        ('Microfone Vedo - Youtuber',false,'Eletrônicos','4',null),
        ('Sofá retrátil',false,'Móveis','3','3x57x80'),
        ('Farinha de arroz',false,'Alimentos','2',null),
        ('Fire stick Amazon',false,'Eletrônicos','3',null);
        
insert into orders(IdOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash)values
		(1,default,'compra via aplicativo',null,1),
        (2,default,'compra via aplicativo',50,0),
        (3,'Confirmado','null',null,1),
        (4,default,'compra via website',150,0);

insert into ProductOrder (IdPOproduct,idPOrder,PoQuantity,PoStatus)values
		(1,1,2,null),
        (2,1,1,null),
        (3,2,1,null);
        
insert into productStorage (StorageLocation,Quantity)values
		('Rio deJaneiro',1000),
        ('Rio de Janeiro',500),
        ('São Paulo',10),
        ('São Paulo',100),
        ('São Paulo',10),
        ('Brasília',60);

insert into StorageLocation(IdLproduct,IdLstorage,Location)values
        (1,2,'RJ'),
        (2,6,'GO');

insert into supplier (SocialName,CNPJ,contact) values
		('Almeida e filhos',123456789123456,'21985474'),
        ('Eletrônicos Silva',854519649143457,'21985484'),
        ('Eletrônicos Valma',934567893934695,'21975474');

insert into ProductSupplier(IdPsSupplier,IdPsProduct,Quantity)values
		(1,1,500),
        (1,2,400),
        (2,4,633),
        (2,3,5),
        (2,5,10);
        
insert into seller(SocialName,AbstName,CNPJ,CPF,Location,Contact) values
		('Tech eletronics',null,123456789456321,null,'Rio de Janeiro',219946287),
        ('Botique Durgas', null, null,123456783,'Rio de Janeiro',219567895),
        ('Kids World',null,456789123654485,null,'São Paulo',1198657484);

insert into ProductSeller(idPSeller,idProduct,ProdQuantity) values
		(1,6,80),
        (2,7,10);
        
