-- criação do banco de dados para o cenário de ecommerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	IdClient int auto_increment primary key,
    FName varchar(20),
    MInit char(3),
    LName varchar(20),
    CPF char(11) not null,
    Address varchar(255), 
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment = 1;


-- criar tabela produto
create table product(
	IdProduct int auto_increment primary key,
    PName varchar(255),
    classification_kids bool default false,
    category enum('Eletrônicos','Vestimenta','Brinquedos','Alimentos','Móveis')not null,
    Avaliação float default 0,
    size varchar(10)
);

alter table product auto_increment = 1;
-- criar tabela pagamento
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
create table payment(
	IdClient int,
    IdPayment int,
    TypePayment enum ("boleto","cartão","dois cartões") not null,
    LimitAvailable float,
    primary key (IdClient, IdPayment)
);

-- criar tabela pedido
create table orders(
	IdOrder int auto_increment primary key,
    IdOrderClient int,
    OrderStatus enum("Cancelado","Confirmado","Em processamento")default 'Em processamento' ,
    OrderDescription varchar(255),
    SendValue float default 10,
    PaymentCash bool default false,
    IdPayment int,
    constraint fk_Orders_Client foreign key (IdOrderClient) references clients(Idclient)on update cascade
);
alter table orders auto_increment = 1;

-- criar tabela estoque
create table productStorage(
	IdProdStorage int auto_increment primary key,
    StorageLocation varchar(255),
    Quantity int default 0
);
alter table productStorage auto_increment = 1;

-- criar tabela fornecedor
create table supplier(
	IdSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char (11) not null,
    constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment = 1;

-- criar tabela vendedor
create table seller(
	IdSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15) ,
    CPF char(11) ,
    Location varchar(255),
    Contact char (11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
alter table seller auto_increment = 1;


-- criar tabela produto vendedor
create table ProductSeller(
	IdPseller int,
    IdProduct int,
    ProdQuantity int default 1,
    primary key (IdPseller, IdProduct),
    constraint fk_product_seller foreign key  (IdPseller) references seller(IdSeller),
    constraint fk_product_product foreign key (IdProduct) references product(IdProduct)
);

create table ProductOrder(
	IdPOproduct int,
    IdPOrder int,
    PoQuantity int default 1,
    PoStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (IdPOproduct, IdPOrder),
    constraint fk_PO_Product foreign key  (IdPOproduct) references Product(IdProduct),
    constraint fk_P_Order foreign key (IdPOrder) references orders(IdOrder)
);

create table StorageLocation(
	IdLproduct int,
    IdLstorage int,
    Location varchar(255) not null,
    primary key (IdLproduct, IdLstorage),
    constraint fk_storage_location_product foreign key  (IdLproduct) references Product(IdProduct),
    constraint fk_storage_location_storage foreign key (IdLstorage) references productStorage(IdProdStorage)
);

create table ProductSupplier(
	IdPsSupplier int,
    IdPsProduct int,
    Quantity int not null,
    primary key (IdPsSupplier, IdPsProduct),
    constraint fk_product_supplier_supplier foreign key  (IdPsSupplier) references supplier(IdSupplier),
    constraint fk_product_supplier_product foreign key (IdPsProduct) references product(IdProduct)
);
