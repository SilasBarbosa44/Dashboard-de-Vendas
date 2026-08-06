select
	month(v.data_venda) as mes,
    year(v.data_venda) as ano,
    sum(i.quantidade * i.preco_unitario) as faturamento
from vendas v  join itens_vendas i on(v.id_venda = i.id_venda)
group by month(v.data_venda),
year(v.data_venda)
order by ano, mes;



with ranking_produtos as(select
	pr.categoria,
    pr.nome as produto,
    sum(i.quantidade) as qtd_vendida,
    sum(i.quantidade * i.preco_unitario) as faturamento
from produtos pr join itens_vendas i on(pr.id_produto = i.id_produto)
group by pr.nome, pr.categoria)
select
*, dense_rank() over(order by faturamento desc) as ranking
from ranking_produtos
order by ranking;



with ranking_vendedores as(select
	ve.nome as vendedor,
    sum(i.quantidade * i.preco_unitario) as faturamento,
    sum(i.quantidade) as qtd_vendida
from vendedores ve join vendas v on(ve.id_vendedor = v.id_vendedor)
join itens_vendas i on(i.id_venda = v.id_venda)
group by ve.nome)
select
*, dense_rank() over(order by faturamento desc) as ranking
from ranking_vendedores
order by ranking;





select
	c.nome as cliente,
    e.estado,
    sum(i.quantidade * i.preco_unitario) as faturamento
from clientes c inner join vendas v on(v.id_cliente = c.id_cliente)
inner join itens_vendas i on(i.id_venda = v.id_venda)
inner join cidade ci on(ci.id_cidade = c.id_cidade)
inner join estado e on(e.id_estado = ci.id_estado)
group by c.nome, c.id_cliente, e.estado
order by e.estado desc;







select
	c.nome as cliente,
    max(v.data_venda) as ultima_compra,
    datediff(curdate(), max(v.data_venda)) as diferencas_dias
from clientes c inner join vendas v on(c.id_cliente = v.id_cliente)
group by c.nome, c.id_cliente
having max(v.data_venda) < date_sub(curdate(), interval 90 day);





select
	ve.nome as vendedor,
    count(distinct v.id_venda) as qnt_vendas,
    sum(i.quantidade * i.preco_unitario) as faturamento,
    round(sum(i.quantidade * i.preco_unitario) / count(distinct v.id_venda), 2) as ticket_medio
from vendedores ve inner join vendas v on(ve.id_vendedor = v.id_vendedor)
inner join itens_vendas i on(i.id_venda = v.id_venda)
group by ve.nome;



select
	month(v.data_venda) as mes,
    year(v.data_venda) as ano,
    count(i.quantidade) as total_qtd
from vendas v inner join itens_vendas i on(v.id_venda = i.id_venda)
group by month(v.data_venda),
year(v.data_venda)
order by ano, mes;





with ranking_produtos as(select
	pr.nome as produto,
    pr.categoria,
    sum(i.quantidade) as qtd_vendida
from produtos pr inner join itens_vendas i on(pr.id_produto = i.id_produto)
group by pr.nome, pr.categoria
)
select
*
from ranking_produtos
order by qtd_vendida desc
limit 1;





select
	pr.nome as produto,
    pr.marca,
    sum(i.quantidade) as qtd_vendida,
    sum(i.quantidade * i.preco_unitario) as faturamento
from produtos pr inner join itens_vendas i on(pr.id_produto = i.id_produto)
group by pr.nome, pr.marca
order by faturamento desc
limit 10;





select
	c.nome as cliente,
    sum(i.quantidade * i.preco_unitario) as faturamento,
case
	when sum(i.quantidade * i.preco_unitario) >= 10000 then 'Cliente Premium'
    when sum(i.quantidade * i.preco_unitario) >= 5000 then 'Cliente Frequente'
    when sum(i.quantidade * i.preco_unitario) >= 1000 then 'Cliente Regular'
else 'Valor baixo'
end as classificacao_cliente
from clientes c join vendas v on(c.id_cliente = v.id_cliente)
join itens_vendas i on(i.id_venda = v.id_venda)
group by c.nome, c.id_cliente;







select
	ve.nome as vendedor,
    sum(i.quantidade) as qtd_vendida,
    sum(i.quantidade * i.preco_unitario) as faturamento,
case 
	when sum(i.quantidade * i.preco_unitario) >= 50000 then 'Excelente'
    when sum(i.quantidade * i.preco_unitario) >= 20000 then 'Bom'
    when sum(i.quantidade * i.preco_unitario) > 5000 then 'Regular'
else 'Baixo desempenho'
end classificacao_desempenho
from vendedores ve inner join vendas v on(ve.id_vendedor = v.id_vendedor)
inner join itens_vendas i on(i.id_venda = v.id_venda)
group by ve.nome;





with analise_clientes as(select
	c.nome as cliente,
    e.estado,
    sum(i.quantidade) as qtd_vendidas,
    max(v.data_venda) as ultima_compra,
    sum(i.quantidade * i.preco_unitario) as valor_total,
    ve.nome as vendedor,
    pr.categoria
    from clientes c inner join vendas v on(c.id_cliente = v.id_cliente)
    inner join itens_vendas i on(i.id_venda = v.id_venda)
    inner join cidade ci on(ci.id_cidade = c.id_cidade)
    inner join vendedores ve on(ve.id_vendedor = v.id_vendedor)
    inner join produtos pr on(pr.id_produto = i.id_produto)
    inner join estado e on(e.id_estado = ci.id_estado)
    group by c.nome, c.id_cliente, e.estado, ve.nome, pr.categoria),
classificacao_cliente as(
select
	cliente,
    vendedor,
    valor_total,
    qtd_vendidas,
    categoria,
	case
		when valor_total >= 15000 then 'Cliente vip'
        when valor_total >= 5000 then 'Cliente frequente'
        when valor_total >= 1000 then 'Cliente regular'
	else 'Valor baixo'
    end as classificacao
from analise_clientes),
ranking_clientes as(
select
	cliente,
    vendedor,
    qtd_vendidas,
    categoria,
    valor_total,
    classificacao,
    dense_rank() over(order by valor_total desc) as ranking
from classificacao_cliente)
select
* from
ranking_clientes
order by ranking; 