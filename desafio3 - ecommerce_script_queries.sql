use ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
select b.FName as 'Nome', count(idorderclient) as 'Qntd de pedidos' from orders a
inner join clients b on b.idClient = a.idorderclient
group by b.FName;


-- Algum vendedor também é fornecedor?
select a.socialname from seller a inner join supplier b on a.CNPJ = b.CNPJ;


-- Relação de produtos fornecedores e estoques;
select a.Pname,c.socialname ,b.quantity from product a 
inner join productsupplier b on a.idproduct = b.idpsproduct
inner join supplier c on b.idpssupplier = c.idsupplier;


-- Relação de nomes dos fornecedores e nomes dos produtos
select a.Pname,c.socialname  from product a 
inner join productsupplier b on a.idproduct = b.idpsproduct
inner join supplier c on b.idpssupplier = c.idsupplier;
