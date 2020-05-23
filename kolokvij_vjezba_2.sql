# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_2.sql

drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2;
use kolokvij_vjezba_2;

create table brat(
    sifra int not null primary key auto_increment,
    gustoca decimal(13,7),
    bojaociju varchar(47),
    modelnaocala varchar(47) not null,
    suknja varchar(44),
    maraka decimal(12,10) not null,
    hlace varchar(48) not null
);

create table punac(
    sifra int not null primary key auto_increment,
    suknja varchar(40),
    vesta varchar(49) not null,
    prviputa datetime,
    brat int
);

create table punica(
    sifra int not null primary key auto_increment,
    bojaociju varchar(36),
    bojakose varchar(42) not null,
    majica varchar(30),
    prviputa datetime,
    hlace varchar(31),
    asocijalno bit not null
);

create table zarucnik_punica(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    punica int not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    carape varchar(38),
    kratkamajica varchar(39),
    ekstroventno bit not null,
    narukvica int,
    kuna decimal(14,8)
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    dukserica varchar(39),
    eura decimal(14,7),
    treciputa datetime,
    hlace varchar(44),
    zarucnik int
);

create table neprijateljica(
    sifra int not null primary key auto_increment,
    introvertno bit,
    vesta varchar(50) not null,
    gustoca decimal(16,8),
    carape varchar(38) not null,
    lipa decimal(18,5) not null,
    prijateljica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    prstena int not null,
    jmbag char(11),
    lipa decimal(17,7) not null,
    eura decimal(17,9) not null,
    neprijateljica int not null
);

alter table punac add foreign key (brat) references brat(sifra);

alter table zarucnik_punica add foreign key (punica) references punica(sifra);

alter table zarucnik_punica add foreign key (zarucnik) references zarucnik(sifra);

alter table prijateljica add foreign key (zarucnik) references zarucnik(sifra);

alter table neprijateljica add foreign key (prijateljica) references prijateljica(sifra);

alter table svekar add foreign key (neprijateljica) references neprijateljica(sifra);

# 1. zadatak
# select * from zarucnik;

insert into zarucnik(sifra, indiferentno, carape ,kratkamajica, ekstroventno, narukvica, kuna)
values
(null, 0, 'plave', 'zelena', 1, null, '20'),
(null, 0, 'smede', 'crne', 0, null, '400'),
(null, 1, 'zute', 'sive', 1, null, '60');

# select * from prijateljica;

insert into prijateljica(sifra, dukserica, eura, treciputa, hlace, zarucnik )
values
(null, 'zelena', '200', '2012-12-12', 'xxx', 1),
(null, 'crna', '100', '2012-02-23', 'crne', 2),
(null, 'zuta', '2000', '2012-01-12', 'smede', 3);

# select * from neprijateljica;

insert into neprijateljica(sifra, introvertno, vesta, gustoca, carape, lipa, prijateljica )
values
(null, 1, 'crna', '20', 'cipka', '1000', 1),
(null, 0, 'smeda', '10', 'crne', '1000', 2),
(null, 1, 'plava', '5', 'bijele', '1000', 3);


# 2. zadatak
#select * from punac;

update punac set vesta='Osijek';

# 3. zadatak
#select * from svekar;

delete from svekar where jmbag='00000000007';

# 4. zadatak 
select treciputa from prijateljica
where eura!='6'
or eura!='14'
or eura!='19'
or eura!='30'
or eura!='40';

# 5. zadatak

select a.prviputa, b.eura,  c.vesta
from punac a, svekar b,  neprijateljica c
right join prijateljica d on d.sifra=c.prijateljica
inner join zarucnik e on d.zarucnik=e.sifra
where d.eura='84te'
and 
e.carape like '%ba%'
order by vesta desc;

# 6. zadatak

select b.carape, b.kratkamajica 
from zarucnik_punica a
right join zarucnik b on b.sifra=a.zarucnik;

