
use ProjectSQL
go

SP_Columns Employee
go

/*Total de funcion�rios-registros*/
select * from Employee
go

/*Quantidade de funcion�rios homens e mulheres por faixa et�ria*/
select 
	Faixa_Etaria,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens"
	From(
		Select
			case
				when Age between 18 and 25 then '18-25'
				when Age between 26 and 33 then '26-33'
				when Age between 34 and 41 then '34-41'
				else '42+'
			end as "Faixa_Etaria",
			Gender,
			Age
		from Employee
	) as subquery
	group by Faixa_Etaria
	order by 1
go

/*Distribui��o da escolaridade entre g�neros*/
Select Education, 
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens"
	from Employee group by Education
go

/*Distribui��o da escolaridade por faixa et�ria*/
select 
	Faixa_Etaria,
	count(*) as "Total",
	count(case Education when 'Bachelors' then 1 else null end) as "Bacharel",
	count(case Education when 'Masters' then 1 else null end) as "Mestre",
	count(case Education when 'PHD' then 1 else null end) as "PHD"
	From(
		select
			case
				when Age between 18 and 25 then '18-25'
				when Age between 26 and 33 then '26-33'
				when Age between 34 and 41 then '34-41'
				else '42+'
			end as "Faixa_Etaria",
			Education,
			Age
		from Employee
	) as subquery
	group by Faixa_Etaria
	order by 1
go

/*G�nero por tempo de experi�ncia*/
select 
	Tempo_Experiencia,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens"
	From(
		select
			case
				when ExperienceInCurrentDomain between 0 and 2 then '0-2'
				when ExperienceInCurrentDomain between 3 and 5 then '3-5'
				else '6+'
			end as "Tempo_Experiencia",
			Gender,
			ExperienceInCurrentDomain
		from Employee
	) as subquery
	group by Tempo_Experiencia
	order by 1
go

/*G�nero por cidade*/
select 
	City,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens"
	from Employee 
	group by City
go

/*Escolaridade por cidade*/
select 
	City,
	count(*) as "Total",
	count(case Education when 'Bachelors' then 1 else null end) as "Bacharel",
	count(case Education when 'Masters' then 1 else null end) as "Mestre",
	count(case Education when 'PHD' then 1 else null end) as "PhD"
	from Employee 
	group by City
go

/*Faixa et�ria por cidade*/
select 
	Faixa_Etaria,
	count(*) as "Total",
	count(case City when 'New Delhi' then 1 else null end) as "New Delhi",
	count(case City when 'Bangalore' then 1 else null end) as "Bangalore",
	count(case City when 'Pune' then 1 else null end) as "Pune"
	From(
		Select
			case
				when Age between 18 and 25 then '18-25'
				when Age between 26 and 33 then '26-33'
				when Age between 34 and 41 then '34-41'
				else '42+'
			end as "Faixa_Etaria",
			City,
			Age
		from Employee
	) as subquery
	group by Faixa_Etaria
	order by 1
go

/*Ano de entrada por g�nero*/
select 
	JoiningYear,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens",
	count(case Education when 'Bachelors' then 1 else null end) as "Bachelors",
	count(case Education when 'Masters' then 1 else null end) as "Masters",
	count(case Education when 'PHD' then 1 else null end) as "PHD"
	from Employee 
	where city = 'New Delhi'
	group by JoiningYear
	order by JoiningYear
go

/*Entrada na empresa por cidade*/
select
	JoiningYear,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens",
	cast(datepart(year,GETDATE()) as smallint) - JoiningYear as "Tempo de Servi�o"
	from Employee 
	where city = 'New Delhi'
	group by JoiningYear
	order by JoiningYear
go

select 
	JoiningYear,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens",
	cast(datepart(year,GETDATE()) as smallint) - JoiningYear as "Tempo de Servi�o"
	from Employee 
	where city = 'Bangalore'
	group by JoiningYear
	order by JoiningYear
go

select 
	JoiningYear,
	count(*) as "Total",
	count(case Gender when 'Female' then 1 else null end) as "Mulheres",
	count(case Gender when 'Male' then 1 else null end) as "Homens",
	cast(datepart(year,GETDATE()) as smallint) - JoiningYear as "Tempo de Servi�o"
	from Employee 
	where city = 'Pune'
	group by JoiningYear
	order by JoiningYear
go

/*Experi�ncia por n�vel de pagamento*/
select 
	ExperienceInCurrentDomain, 
	count(case PaymentTier when '1' then 1 else null end) as "Tier1",
	count(case PaymentTier when '2' then 1 else null end) as "Tier2", 
	count(case PaymentTier when '3' then 1 else null end) as "Tier3" 
	from Employee 
	group by ExperienceInCurrentDomain
	order by 1
go

/*G�nero por n�vel de pagamento*/
select 
	Gender, 
	count(case PaymentTier when '1' then 1 else null end) as "Tier1",
	count(case PaymentTier when '2' then 1 else null end) as "Tier2", 
	count(case PaymentTier when '3' then 1 else null end) as "Tier3" 
	from Employee 
	group by Gender
	order by 1
go

/*Cidade por n�vel de pagamento*/
select 
	City, 
	sum(case PaymentTier when '1' then 1 else 0 end) as "Tier1",
	sum(case PaymentTier when '2' then 1 else 0 end) as "Tier2", 
	sum(case PaymentTier when '3' then 1 else 0 end) as "Tier3" 
	from Employee 
	group by City
	order by 1
go

/*Faixa et�ria por n�vel de pagamento*/
select 
	Faixa_Etaria,
	count(case PaymentTier when '1' then 1 else null end) as "Tier1",
	count(case PaymentTier when '2' then 1 else null end) as "Tier2", 
	count(case PaymentTier when '3' then 1 else null end) as "Tier3"
	From(
		Select
			case
				when Age between 18 and 25 then '18-25'
				when Age between 26 and 33 then '26-33'
				when Age between 34 and 41 then '34-41'
				else '42+'
			end as "Faixa_Etaria",
			PaymentTier,
			Age
		from Employee
	) as subquery
	group by Faixa_Etaria
	order by 1
go

/*Tempo de experiencia na fun��o por n�vel da pagamento*/
select 
	Tempo_Experiencia,
	count(case PaymentTier when '1' then 1 else null end) as "Tier1",
	count(case PaymentTier when '2' then 1 else null end) as "Tier2", 
	count(case PaymentTier when '3' then 1 else null end) as "Tier3" 
	From(
		select
			case
				when ExperienceInCurrentDomain between 0 and 2 then '0-2'
				when ExperienceInCurrentDomain between 3 and 5 then '3-5'
				else '6+'
			end as "Tempo_Experiencia",
			PaymentTier,
			ExperienceInCurrentDomain
		from Employee
	) as subquery
	group by Tempo_Experiencia
	order by 1
go

select 
	EverBenched,
	count(case Gender when 'Female' then 1 else null end) as Female,
	count(case Gender when 'Male' then 1 else null end) as Male
	from Employee 
	group by EverBenched
	order by 1
go

select 
	EverBenched,
	count(case Education when 'Bachelors' then 1 else null end) as "Bacharel",
	count(case Education when 'Masters' then 1 else null end) as "Mestre",
	count(case Education when 'PHD' then 1 else null end) as "PhD"
	from Employee 
	group by EverBenched
	order by 1
go


select 
	Gender,
	avg(Age) as "Idade M�dia",
	max(Age) as "Idade M�xima",
	min(Age) as "Idade M�nima",
	avg(ExperienceInCurrentDomain) as "Experi�ncia M�dia",
	max(ExperienceInCurrentDomain) as "Experi�ncia M�xima",
	min(ExperienceInCurrentDomain) as "Experi�ncia M�nima"
	from Employee
	group by Gender
	order by 1
go

/*Moda da Idade entre os homens*/
select 
	Top 1 Age as "Idade", 
	count(*) as "Moda"
	from Employee
	where Gender = 'Male'
	group by Age
	order by Moda desc
go

/*Moda da Idade entre as mulheres*/
select 
	Top 1 Age as "Idade", 
	count(*) as "Moda"
	from Employee
	where Gender = 'Female'
	group by Age
	order by Moda desc
go

select 
	Top 1 ExperienceInCurrentDomain as "Tempo de Experi�ncia", 
	count(*) as "Moda"
	from Employee
	where Gender = 'Male'
	group by ExperienceInCurrentDomain
	order by Moda desc
go

select 
	Top 1 ExperienceInCurrentDomain as "Tempo de Experi�ncia", 
	count(*) as "Moda"
	from Employee
	where Gender = 'Female'
	group by ExperienceInCurrentDomain
	order by Moda desc
go

/*Leave or not*/
Select
	Education,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "Pensa em sair"
	from Employee
	group by Education
go


Select
	Gender,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "Pensa em sair"
	from Employee
	group by Gender
go


Select
	City,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "Pensa em sair"
	from Employee
	group by City
go


Select
	ExperienceInCurrentDomain,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair"
	from Employee
	group by ExperienceInCurrentDomain
go

select 
	Tempo_Experiencia,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair"
	From(
		select
			case
				when ExperienceInCurrentDomain between 0 and 2 then '0-2'
				when ExperienceInCurrentDomain between 3 and 5 then '3-5'
				else '6+'
			end as "Tempo_Experiencia",
			LeaveOrNot,
			ExperienceInCurrentDomain
		from Employee
	) as subquery
	group by Tempo_Experiencia
	order by 1
go


Select
	PaymentTier,
	format(
		sum(
			case LeaveorNot when '0' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "N�o pensa em sair",
	format(
		sum(
			case LeaveorNot when '1' then 1 else 0 end
			)*100/count(*),'N2'
		) + '%' as "Pensa em sair"
	from Employee
	group by PaymentTier
	order by PaymentTier
go
