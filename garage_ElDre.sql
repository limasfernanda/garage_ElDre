# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construa um Projeto Lógico de Banco de Dados do Zero

# Oficina mecânica/Garage

# Mapeamento do esquema ER para Relacional
# Definição do script SQL para criação do esquema de banco de dados
# Persistência de dados para testes
# Recuperação de informações com queries SQL

-- Criação do banco de dados para o cenário de E-Commerce - Perfumaria LaLucky
CREATE DATABASE garage;
USE garage;

-- drop database ecommerce;

-- Criação da tabela Cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
	Fname VARCHAR(20) NOT NULL,
	Lname VARCHAR(20),
	CPF CHAR(11) NOT NULL,
	Address VARCHAR(255),
    Contato CHAR(11) NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
    );
ALTER TABLE clients AUTO_INCREMENT=1;

-- veiculo
CREATE TABLE vehicle(
	idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idVClient INT,
    VehicleType ENUM('Automovel', 'Motorcycle', 'Truck') NOT NULL,
	MakeModel VARCHAR(40),
    Vyear YEAR,
	License CHAR(7) NOT NULL,
    CONSTRAINT fk_vehicle_client FOREIGN KEY(idVClient) REFERENCES clients(idClient)
		ON UPDATE CASCADE
		ON DELETE SET NULL
    );
ALTER TABLE vehicle AUTO_INCREMENT=1;

-- Departamento (Mecânico, Autoelétrico, Funilaria, Financeiro)
CREATE TABLE departament(
	Dname varchar(20) not null,
    Dnumber int not null,
    Mgr_mechanical char(11) not null,
	Dcontato char(11) not null,
	constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique (Dname)
    );
ALTER TABLE departament AUTO_INCREMENT=1;
    
-- Trabalhadores da oficina mecânica
CREATE TABLE mechanics(
	idmechanics INT AUTO_INCREMENT PRIMARY KEY,
	MFname VARCHAR(20) NOT NULL,
	MLname VARCHAR(20),
    MCPF CHAR(11) NOT NULL,
    Service VARCHAR(50) NOT NULL DEFAULT 'Disponível',
    Dnum INT,
	CONSTRAINT unique_cpf_mechanics UNIQUE (MCPF),
	CONSTRAINT fk_dept_mechanics FOREIGN KEY(Dnum) REFERENCES departament(Dnumber)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);
ALTER TABLE mechanics AUTO_INCREMENT=1;


-- Ordem de serviço, requisitos do cliente para conserto
CREATE TABLE requisite(
	idRequisite INT AUTO_INCREMENT,
    idRClient INT NOT NULL,
    idRVehicle INT NOT NULL,
    idRDnumber INT NOT NULL DEFAULT 1,
    Num_requisite INT NOT NULL,
    PRIMARY KEY (idRequisite, idRClient,idRVehicle, idRDnumber),
    CONSTRAINT fk_requisite_clients FOREIGN KEY (idRClient) REFERENCES clients(idClient),
	CONSTRAINT fk_requisite_vehicle FOREIGN KEY (idRVehicle) REFERENCES vehicle(idVehicle),
    CONSTRAINT fk_requisite_departament FOREIGN KEY (idRDnumber) REFERENCES departament(Dnumber)    
);

ALTER TABLE requisite AUTO_INCREMENT=1;

-- Fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    corporateName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT=1;

-- Suprimentos
CREATE TABLE device(
	idDevice INT AUTO_INCREMENT PRIMARY KEY,
    PName VARCHAR(255) NOT NULL,
    Category ENUM('Mecânica', 'Autoelétrica', 'Funilaria')
    );
ALTER TABLE device AUTO_INCREMENT=1;

-- Suprimentos/Fornecedor
CREATE TABLE deviceSupplier(
	idDsSupplier INT,
    idDsDevice INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idDsSupplier, idDsDevice),
    CONSTRAINT fk_supply_supplier FOREIGN KEY(idDsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_supply_device FOREIGN KEY(idDsDevice) REFERENCES device(idDevice)    
);

-- Setor suprimentos com os mecânicos dos departamentos
CREATE TABLE setor(
	idSDevice INT,
    idSMechanics INT,
    PRIMARY KEY (idSDevice, idSMechanics),
    CONSTRAINT fk_product_setor_device FOREIGN KEY (idSDevice) REFERENCES device(idDevice),
    CONSTRAINT fk_product_setor_mechanics FOREIGN KEY (idSMechanics) REFERENCES mechanics(idMechanics)    
);

show tables;







