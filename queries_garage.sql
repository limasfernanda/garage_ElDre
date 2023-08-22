# Potência Tech powered by iFood | Ciência de Dados
# Fernanda Lima
# Construa um Projeto Lógico de Banco de Dados do Zero

# Fazendo perguntas e recuperando dados a partir das queries
use garage;

-- Qual o veículo de cada cliente?
-- ORDER BY
select concat(Fname,' ',Lname) as Clients, VehicleType, MakeModel
 from clients c,  vehicle v where c.idClient = idVClient 
 order by Fname, VehicleType;

-- Qual requisito de cada cliente no departamento?
-- ORDER BY
select idRequisite as OrderService, concat(Fname,' ',Lname) as Clients, Dname as Departamento
 from clients c, requisite r, departament, vehicle where c.idClient = r.idRClient and idRDnumber=Dnumber and idVehicle=idRVehicle
 order by idRequisite;
 
-- Os trabalhadores de cada departamento
-- ORDER BY
select distinct concat(MFname,' ',MLname) as Garage_Workers, MCPF, Dnum,Dname as Departament, Service 
 from mechanics, departament where Dnumber=Dnum
 order by Dnum;

-- Apenas os trabalhadores de Funilaria
select distinct concat(MFname,' ',MLname) as Garage_Workers, MCPF, Dnum,Dname as Departament, Service 
 from mechanics, departament where Dnumber=Dnum and Dname='Funilaria';

-- Os gerentes de cada departamento?
-- ORDER BY
select distinct concat(MFname,' ',MLname) as Garage_Managers, MCPF as Manager_CPF, Dnum, Dname as Departament, Service 
 from mechanics, departament where Dnumber=Dnum and MCPF=Mgr_mechanical
 order by Dnum;

-- Qual é o departamento mais requisitado?
-- USANDO GROUP BY E COUNT

select Dname as Garage_Departament, count(*) as Requisites_Clients
 from departament, requisite where idRDnumber=Dnumber 
 group by Dname;
 
 
 select* from device;
 -- Produtos oferecidos por cada fornecedor
 -- USANDO INNER JOIN
 select CorporateName, Category, Pname as Supply from supplier
	inner join devicesupplier d on idSupplier=idDsSupplier
    inner join device on idDsDevice=idDevice;


-- Quantidade total de produtos oferecidos por fornecedores
 -- USANDO INNER JOIN E GROUP BY
	select Category, sum(quantity) as Total_Supply from supplier
	inner join devicesupplier d on idSupplier=idDsSupplier
    inner join device on idDsDevice=idDevice
    group by category;
    
-- Suprimentos de maiores quantidades oferecidos por fornecedores >=50 unidades
-- USANDO HAVING , INNER JOIN E GROUP BY
	select Category, Pname as Suplly, Quantity  from device
	inner join devicesupplier d on idDsDevice=idDevice
    inner join supplier on idSupplier=idDsSupplier
    group by category, Pname, quantity
    having quantity>='50';
    
    
-- Quais trabalhadores recebem o encarregamento do fornecedor, e em qual serviço?
-- UTILIZANDO INNER JOIN, GROUP BY, ORDER BY
select Dnum as Num_Departament, concat(MFname,' ',MLname) as Garage_Workers, Pname as Supply, Service from setor
				inner join mechanics ON idSMechanics = idmechanics
                inner join device on idSDevice= idDevice
			    Order by Dnum; 
                
-- Quais trabalhadores não recebem os suprimentos dos fornecedores para utilizar no serviço?
-- USANDO EXCEPT
select distinct Dnum as Num_Departament, concat(MFname,' ',MLname) as Garage_Workers, Service
 from mechanics where idMechanics NOT IN (select idSMechanics from setor);

