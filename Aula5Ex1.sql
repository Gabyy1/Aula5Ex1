Use Aula2Ex1
Go



--Consultar, num_cadastro do cliente,  nome do cliente, titulo do filme, data_fabricação do dvd, 
--valor da locação, dos dvds que tem a maior data de fabricação dentre todos os cadastrados. 

Select num_cadastro, nome, titulo, data_fabricacao As maior_data_fabricacao, valor
From Cliente Inner Join Locacao
On Cliente.num_cadastro = Locacao.Clientenum_cadastro
Inner Join DVD 
On DVD.num = Locacao.DVDnum
Inner Join Filme
On Filme.id = DVD.Filmeid
	Where data_fabricacao In (
	Select Max(data_fabricacao)
	From DVD
	)

--Consultar Consultar, num_cadastro do cliente,  nome do cliente, data de locação (Formato DD/MM/AAAA) 
--e a quantidade de DVD ?s alugados por cliente (Chamar essa coluna de qtd), por data de locação

Select num_cadastro, nome, Convert(Char(10), data_locacao, 103) As data_locacao, Count (nome) As qtd
From Cliente Inner Join Locacao
On Cliente.num_cadastro = Locacao.Clientenum_cadastro
Group By Cliente.num_cadastro, Cliente.nome, Locacao.data_locacao
Order By num_cadastro 

--Consultar Consultar, num_cadastro do cliente,  nome do cliente, data de locação (Formato DD/MM/AAAA) 
--e a valor total de todos os dvd ?s alugados (Chamar essa coluna de valor_total), por data de locação

Select num_cadastro, nome, Convert(Char(10), data_locacao, 103) As data_locacao, Sum(valor) As valor_total
From Cliente Inner Join Locacao 
On Cliente.num_cadastro = Locacao.Clientenum_cadastro
Group By Cliente.num_cadastro, Cliente.nome, Locacao.data_locacao, Locacao.valor

--Consultar Consultar, num_cadastro do cliente,  nome do cliente,  Endereço concatenado de logradouro e numero como Endereco, 
--data de locação (Formato DD/MM/AAAA) dos clientes que alugaram mais de 2 filmes simultaneamente

Select num_cadastro, nome, logradouro + ',' + Convert(Varchar(5), num) As endereco_completo, Convert(Char(10), data_locacao, 103) As data_locacao
From Cliente Left Outer Join Locacao 
On Cliente.num_cadastro = Locacao.Clientenum_cadastro
Group By Cliente.num_cadastro, Cliente.nome, Cliente.logradouro, Cliente.num, Locacao.data_locacao
Having Count(dvdnum) > 2


Select*From Locacao
Select*From Cliente
Select*From Filme