# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_6.sql

drop database if exists kolokvij_vjezba_6;
create database kolokvij_vjezba_6;
use kolokvij_vjezba_6;

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table prijatelj_ostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36) not null
);

create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
);

create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null
);

create table decko(
    sifra int not null primary key auto_increment,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null
);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);

alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table brat add foreign key (prijatelj) references prijatelj(sifra);

alter table zena add foreign key (brat) references brat(sifra);

alter table decko add foreign key (zena) references zena(sifra);

#select * from ostavljena;

insert into ostavljena(sifra ,prviputa ,kratkamajica ,drugiputa ,maraka )
values
(null, '2011-12-11', 'plava', '2020-01-23', '300'),
(null, '2013-03-11', 'siva', '2020-03-23', '200'),
(null, '2019-01-11', 'crna', '2019-02-23', '3300');

#select * from prijatelj;

insert into prijatelj(sifra ,haljina ,prstena ,introvertno ,stilfrizura )
values
(null, 'plava', 1, 0, 'irokeza'),
(null, 'siva', 2, 1, 'kratka'),
(null, 'crna', 12, 0, 'duga kosa');

#select * from prijatelj_ostavljena;

insert into prijatelj_ostavljena(sifra ,prijatelj ,ostavljena )
values
(null, 1, 1),
(null, 3, 2),
(null, 2, 3);

#select * from brat;

insert into brat(sifra ,nausnica ,treciputa ,narukvica ,hlace ,prijatelj )
values
(null, 1, '2015-06-07', 2, 'plave', 1),
(null, 2, '2014-01-07', 12, 'siva', 2),
(null, 3, '2020-06-23', 1, 'crna', 3);

#select * from zena;

insert into zena(sifra ,novcica ,narukvica ,dukserica ,haljina ,hlace ,brat )
values
(null, '300', 1, 'plava', 'plava', 'plave', 1),
(null, '200', 2, 'siva', 'siva', 'siva', 2),
(null, '1200', 3, 'crna', 'crna', 'crna', 3);

# provjera
#select * from decko;
insert into decko(sifra ,prviputa ,modelnaocala ,nausnica ,zena )
values
(null, '2020-01-03', 'XXX', 1,1);
# 2 zad

update svekrva set suknja='Osijek';

# 3 zad

delete from decko where modelnaocala < 'AB';

# 4 zad

select narukvica from brat
where treciputa =0;

# 5 zad

select a.drugiputa, f.zena, e.narukvica 
from ostavljena a
inner join prijatelj_ostavljena b on a.sifra=b.ostavljena 
inner join prijatelj c on c.sifra=b.prijatelj 
inner join brat d on c.sifra=d.prijatelj 
inner join zena e on d.sifra=e.brat 
inner join decko f on e.sifra=f.zena 
where d.treciputa !=0
and 
c.prstena=219
order by e.narukvica desc;

# 6 zad

select a.prstena, a.introvertno
from prijatelj a
left join prijatelj_ostavljena b on b.sifra=a.sifra;





