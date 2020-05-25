# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_1.sql

drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int
);

alter table cura add foreign key (punac) references punac(sifra);

alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

#select * from svekar;

insert into svekar(sifra,bojaociju ,prstena ,dukserica ,lipa ,eura ,majica )
values
(null, 'plava', 1, 'crna', '200', '2000', 'crvena'),
(null, 'smeda', 2, 'plava', '300', '200', 'zelena'),
(null, 'crna', 3, 'zuta', '30', '1000', 'siva');

#select * from sestra;

insert into sestra(sifra ,introvertno ,haljina ,maraka ,hlace ,narukvica )
values
(null, 1, 'plava', '300', 'siva', 1),
(null, 0, 'siva', '3000', 'crvene', 2),
(null, 1, 'zuta', '1000', 'plave', 3);

#select * from sestra_svekar;

insert into sestra_svekar(sifra ,sestra ,svekar )
values
(null, 1, 2),
(null, 2, 3),
(null, 3, 1);


#select * from zena;

insert into zena(sifra ,treciputa ,hlace ,kratkamajica ,jmbag ,bojaociju ,haljina ,sestra )
values
(null, '2011-02-11', 'plave', 'crna', '72989153846', 'smeda', 'zelena', 1),
(null, '2020-11-01', 'sive', 'plava', '02989153846', 'crna', 'ljubicasta', 2),
(null, '2011-01-23', 'zelene', 'crvena', '12989153846', 'plava', 'roza', 3);


#select * from muskarac;

insert into muskarac(sifra ,bojaociju ,hlace ,modelnaocala ,maraka ,zena )
values
(null, 'plava', 'crne', 'XXX', '300', 1),
(null, 'smeda', 'sive', 'Abibas', '3000', 2),
(null, 'crna', 'plave', 'Zip', '100', 3);


#select * from mladic;

insert into mladic(sifra ,suknja ,kuna ,drugiputa ,asocijalno ,ekstroventno ,dukserica ,muskarac )
values
(null, 'siva', '303', '2019-11-11', 1, 1, 'siva', 4);
# 2 zad

update cura set gustoca='15,77';

# 3 zad

delete from mladic where kuna>'15,78';

# 4 zad

select kratkamajica from zena
where hlace like '%ana%';

# 5 zad

select a.dukserica, f.asocijalno, e.hlace 
from svekar a
inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on c.sifra=b.sestra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac 
where d.hlace like 'a%'
and 
c.haljina like '%ba%'
order by e.hlace desc;


# 6 zad

select a.haljina, a.maraka 
from sestra a
left join sestra_svekar b on a.sifra=b.sifra;