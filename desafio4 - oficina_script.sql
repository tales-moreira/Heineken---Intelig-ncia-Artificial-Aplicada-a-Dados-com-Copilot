create database Oficina;
use Oficina;

-- criar tabela clientes
create table Clientes(
IdCliente int primary key auto_increment,
Nome varchar(45),
CPF char(11) not null,
Endereco varchar (255),
Telefone char (11),
Email  varchar(45)
);

-- criar tabela mecânicos
create table Mecanicos(
IdMecanico int primary key auto_increment,
Nome varchar (45),
Endereço varchar (255),
Especialidade enum('Manutenção de veículos leves','Manutenção de veículos pesados','carros antigos','carros luxuosos','Funilaria e pintura', 'Mecatrônica automotiva') default 'Funilaria e pintura'
);

-- criar tabela veiculos
create table Veiculos(
IdVeiculos int primary key auto_increment,
idVCliente int,
idVMecanico int,
Modelo varchar (20),
Marca varchar (20),
Placa varchar(7),
constraint fk_veiculos_idclientes foreign key (idVCLiente) references Clientes(IdCliente),
constraint fk_veiculos_idmecanico foreign key (idVMecanico) references Mecanicos(IdMecanico)
);

-- criar tabela equipe
create table Equipe(
IdEMecanico int,
IdEMao_de_obra int,
Nome varchar (255),
constraint fk_equipe_idmecanicos foreign key (IdEMecanico) references Mecanicos(IdMecanico),
constraint fk_equipe_id_mao_de_obra foreign key (IdEMao_de_obra) references Mao_de_obra(IdMao_de_obra)
);

-- criar tabela mão de obra
create table Mao_de_obra(
IdMao_de_obra int primary key auto_increment,
Nome varchar (255),
Valor varchar(255),
IdPecas_mao_de_obra int,
constraint fk_mao_de_obra_pecas foreign key (IdPecas_mao_de_obra) references Pecas(IdPecas)
);

-- criar tabela serviço
create table Servico(
IdServico int primary key auto_increment,
IdSMao_de_obra int,
IdSPecas int,
IdSVeiculo int,
Status_Servico enum ('Aguardando equipe', 'Em execução', 'Finalizado') default 'Aguardando equipe',
Data_emissao date,
Data_entrega date,
Valor_servico varchar(255),
constraint fk_servico_mao_de_obra foreign key (IdSMao_de_obra) references Mao_de_obra(IdMao_de_obra),
constraint fk_servico_veiculo foreign key (IdSVeiculo) references Veiculos(IdVeiculos),
constraint fk_servico_pecas foreign key (IdSPecas) references Pecas(IdPecas)
);

-- criar tabela peças
create table Pecas(
IdPecas int primary key auto_increment,
Nome varchar(255),
valor_total_pecas varchar(255),
Quantidade varchar(255)
);
-- criar tabela estoque
create table Estoque(
IdEstoque int primary key auto_increment,
IdEPecas int,
Data_aquisicao date,
CustoAquisicao varchar(255),
constraint fk_estoque_pecas foreign key (IdEPecas) references Pecas(IdPecas)
);
