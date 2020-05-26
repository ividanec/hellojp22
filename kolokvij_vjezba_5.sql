# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_5.sql

drop database if exists kolokvij_vjezba_5;
create database kolokvij_vjezba_5;
use kolokvij_vjezba_5;

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int
);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47) not null
);

create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

alter table svekar_cura add foreign key (cura) references cura(sifra);

alter table svekar_cura add foreign key (svekar) references svekar(sifra);

alter table punac add foreign key (svekar) references svekar(sifra);

alter table punica add foreign key (punac) references punac(sifra);

alter table ostavljena add foreign key (punica) references punica(sifra);

#select * from cura;

insert into cura(sifra ,carape ,maraka ,asocijalno ,vesta )
values
(null, 'plave', '300', 1, 'plava'),
(null, 'siva', '200', 0, 'siva'),
(null, 'crna', '1200', 1, 'crna');

#select * from svekar;

insert into svekar(sifra ,bojakose ,majica ,carape ,haljina ,narukvica ,eura )
values
(null, 'plava', 'plava', 'plave', 'plava', 1, '300'),
(null, 'siva', 'siva', 'sive', 'siva', 2, '200'),
(null, 'crna', 'crna', 'crne', 'crna', 3, '1300');

#select * from svekar_cura;

insert into svekar_cura(sifra , svekar ,cura )
values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

#select * from punac;

insert into punac(sifra ,dukserica ,prviputa ,majica ,svekar )
values
(null, 'plava', '2011-02-11', 'plava', 1),
(null, 'siva', '2013-11-11', 'siva', 2),
(null, 'crna', '2020-01-11', 'crna', 3);

#select * from punica;

insert into punica(sifra ,hlace ,nausnica ,ogrlica ,vesta ,modelnaocala ,treciputa ,punac )
values
(null, 'plave', 1, 2, 'plava', 'XXX', '2020-10-28', 1),
(null, 'siva', 2, 1, 'siva', 'Zip', '2013-03-28', 2),
(null, 'crna', 3, 10, 'crna', 'RB', '2020-01-09', 3);

#select * from ostavljena;

insert into ostavljena(sifra ,majica ,ogrlica ,carape ,stilfrizura ,punica )
values
(null, 'plava', 1, 'plave', 'kratka', 1);

# 2 zad

update mladic set haljina='Osijek';

# 3 zad

delete from ostavljena where ogrlica=17;

# 4 zad

select majica from punac
where prviputa =0;

# 5 zad

select a.asocijalno, f.stilfrizura, e.nausnica 
from cura a
inner join svekar_cura b on a.sifra=b.cura 
inner join svekar c on c.sifra=b.svekar 
inner join punac d on c.sifra=d.svekar 
inner join punica e on d.sifra=e.punac 
inner join ostavljena f on e.sifra=f.punica 
where d.prviputa !=0
and 
c.majica like '%ba%'
order by e.nausnica desc;

# 6 zad

select a.majica, a.carape
from svekar a
left join svekar_cura b on a.sifra=b.sifra;