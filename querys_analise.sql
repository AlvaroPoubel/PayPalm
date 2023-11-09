
-- Quantos cartões de débito temos cadastrados

select metodo_pagamento,count(metodo_pagamento) from cartao
where metodo_pagamento = 'Cartão de Débito'
group by metodo_pagamento


-- Quantos cartões de crédito temos cadastrados

select metodo_pagamento,count(metodo_pagamento) from cartao
where metodo_pagamento = 'Cartão de Crédito'
group by metodo_pagamento


select * from conta_bancaria
-- Quantas contas pessoais temos cadastrados

select apelido, count(apelido) from conta_bancaria
where apelido = 'Conta Pessoal'
group by apelido


-- Quantas contas Corrente temos cadastradas
select apelido, count(apelido) from conta_bancaria
where apelido = 'Conta Corrente'
group by apelido

-- Quantas contas salário temos cadastradas
select apelido, count(apelido) from conta_bancaria
where apelido = 'Conta de Salário'
group by apelido


-- Quantos usuarios possuem 500 reais ou mais na conta
select nome_completo, saldo, moeda from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Real' and saldo >= 500


-- Quantos Usuarios com carteira em Real nós temos
select moeda,count(moeda) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Real'
group by moeda

-- Quantos Usuarios com carteira em Dólar nós temos
select moeda,count(moeda) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Dólar'
group by moeda

-- Quantos Usuarios com carteira em Euro nós temos
select moeda,count(moeda) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Euro'
group by moeda

-- Somando todos os usuarios com saldo em Real, qual valor total temos
select moeda, sum(saldo) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Real'
group by moeda

-- Somando todos os usuarios com saldo em Dólar, qual valor total temos
select moeda, sum(saldo) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Dólar'
group by moeda

-- Somando todos os usuarios com saldo em Euro, qual valor total temos
select moeda, sum(saldo) from cadastro
join usuario using(id_usuario)
join saldo using(id_usuario)
where moeda = 'Euro'
group by moeda
