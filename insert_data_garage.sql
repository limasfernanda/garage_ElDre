# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construa um Projeto Lógico de Banco de Dados do Zero

# Oficina mecânica/Garage


USE garage;

desc clients;
-- idClient Fname Lname CPF Address Contato
INSERT INTO clients (Fname, Lname, CPF, Address, Contato) VALUES
	('Moime','Lynch', 12333445555, 'Rua Paracatu, Parque Imperial, João Pessoa - PB','11919871208'),
	('Rupa','Gaines', 34789123456, 'Rua Cristiano Olsen, Jardim Sumaré, João Pessoa - PB','11919490610'),
	('Goyla','Dacon', 5645678913,'Avenida Desembargador Moreira, Aldeota, João Pessoa - PB','85919851103'),
	('Amon','Garosor', 7812346789, 'Avenida Rio Branco, Centro, João Pessoa - PB','21919621231'),
	('Taiel','Cuwa', 9098745631,'Avenida Tocantins Vila, Jardim Rio Claro, João Pessoa - PB','62919990723'),
	('Rega','Fry', 01654789123, 'Avenida Afonso Pena, Boa Viagem, João Pessoa - PB','31919850902');

desc vehicle;
-- idVehicle idVClient VehicleType MakeModel Vyear License
INSERT INTO vehicle (idVClient, VehicleType, MakeModel ,Vyear ,License) VALUES
	(4,'Automovel','BMW X6',2022,'VIV71D4'),
    (2,'Truck','Volvo FH 540',2018,'CEL0301'),
    (1,'Automovel','Fiat Argo',2018,'SOP30B3'),
    (5,'Automovel','Volkswagen Fusca',2012,'AMO4U56'),
    (1,'Motorcycle','Honda CG 160',2015,'ISS0A11'),
    (3,'Truck','Mercedes-Benz Atron 1319',2014,'HU33BR7'),
    (6,'Automovel','Chevrolet Onix',2015,'MAI50U1'),
    (2,'Motorcycle','BMW R 1200','2016','GRU37T0');

desc departament;
-- Dname Dnumber Mgr_mechanical Dcontato
INSERT INTO departament (Dname,Dnumber, Mgr_mechanical, Dcontato) VALUES 
	('Mecânica', 1, 74272054058, '12919860522'),
	('Autoelétrica', 2 , 11347674047, '23919940101'),
	('Funilaria', 3 ,03823689088,'34919800619'),
	('Secretaria', 4 ,75146831009, '45919940101');

desc Mechanics;

-- idmechanics MFname MLname MCPF Service Dnum
INSERT INTO Mechanics (MFname, MLname ,MCPF ,Service, Dnum) VALUES
	('Lour', 'Dalas', 03823689088, 'Acabamento',3),
	('Duerna', 'Hovo', 64345645034, 'Montagem',3),
	('Mexo', 'Peous', 68505835069, 'Pintura',3),
	('Sixa', 'Peous', 41381241018, 'Finalização',3),
    
	('Habor', 'Cefe', 74272054058, 'Revisão Mecânica',1),
	('Lasul', 'Fusgo', 44569105009, 'Arrefecimento',1),
	('Galha', 'Caior', 15364593053, 'Trocas de peças',1),
    
	('Luerin', 'Guda', 11347674047, 'Revisão Elétrica',2),
	('Sovel', 'Sidir', 93326002017, 'Reparo Elétrico',2),
    
	('Diari', 'Syoka', 75146831009, 'Financeiro',4),
	('Tuano', 'Rivo', 80679307087,'Vendas e Trocas',4);


desc requisite;
-- idRequisite idRVehicle idRDnumber Num_requisite
INSERT INTO requisite(idRClient, idRVehicle, idRDnumber, Num_requisite) VALUES 
	(1,3,3,2),
    (2,2,1,1),
	(1,5,4,1),
    (2,8,2,2),
    (3,6,1,1),
    (4,1,3,1),
    (5,4,3,2),
    (6,7,3,1),
	(6,7,1,1);

desc device;
-- idDevice PName Category ('Mecânica', 'Autoelétrica', 'Funilaria')
INSERT INTO device( PName, Category) VALUES
    ('Fluídos','Mecânica'),
	('Pneu','Mecânica'),
	('Válvula','Mecânica'),
    ('Eixo','Mecânica'),
    
    ('Lâmpada','Autoelétrica'),
	('Fusível','Autoelétrica'),
    ('Soquete','Autoelétrica'),
    
	('Parachoque','Funilaria'),
    ('Peça Acabamento','Funilaria'),
    ('Tinta','Funilaria');

desc supplier;
-- idSupplier, corporateName, CNPJ, contact
INSERT INTO supplier (corporateName, CNPJ, contact) VALUES 
	('André Automóveis', 123456789123456,'55912123434'),
    ('Edinho S&A',987654321123456,'55956567878');

desc deviceSupplier;
-- idDsSupplier idDsDevice quantity
INSERT INTO deviceSupplier (idDsSupplier, idDsDevice, quantity) VALUES
	(1,1,60),
    (1,2,50),
    (1,3,20),
    (1,4,20),
    (2,5,50),
    (2,6,40),
    (2,7,50),
    (1,8,30),
    (1,9,50),
    (1,10,30);
    
    
desc setor;
-- idSDevice idSMechanics
INSERT INTO setor(idSDevice ,idSMechanics) VALUES 
	(1,6),
    (2,5),
    (3,7),
    (4,7),
    (5,9),
    (6,8),
    (7,8),
    (8,2),
    (9,1),
    (10,3);
  