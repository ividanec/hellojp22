# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_3.sql

drop database if exists kolokvij_vjezba_3;
create database kolokvij_vjezba_3;
use kolokvij_vjezba_3;

create table decko(
    sifra int not null primary key auto_increment,
    suknja varchar(45) not null,
    carape varchar(30) not null,
    dukserica varchar(32) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    suknja varchar(35),
    gustoca decimal(16,8),
    ogrlica int not null,
    narukvica int,
    hlace varchar(40),
    decko int
);

create table djevojka(
    sifra int not null primary key auto_increment,
    introvertno bit not null,
    maraka decimal(18,9),
    haljina varchar(47),
    hlace varchar(33) not null,
    prviputa datetime
);

create table becar_djevojka(
    sifra int not null primary key auto_increment,
    becar int not null,
    djevojka int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    vesta varchar(42) not null,
    novcica decimal(14,9),
    ekstroventno bit,
    modelnaocala varchar(35) not null,
    bojaociju varchar(44),
    maraka decimal(16,8)
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prstena int,
    carape varchar(36),
    nausnica int,
    prviputa datetime,
    stilfrizura varchar(39),
    becar int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    narukvica int,
    introvertno bit,
    ekstroventno bit not null,
    vesta varchar(50) not null,
    nausnica int not null,
    neprijatelj int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    asocijalno bit,
    bojaociju varchar(43) not null,
    prviputa datetime not null,
    hlace varchar(45),
    modelnaocala varchar(37) not null,
    brat int
);

alter table cura add foreign key (decko) references decko(sifra);

alter table becar_djevojka add foreign key (djevojka) references djevojka(sifra);

alter table becar_djevojka add foreign key (becar) references becar(sifra);

alter table neprijatelj add foreign key (becar) references becar(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

alter table prijatelj add foreign key (brat) references brat(sifra);

# select * from djevojka;

insert into djevojka(sifra, introvertno, maraka, haljina, hlace,prviputa )
values
(null, 1, '20', 'lila', 'plave', '2012-11-11'),
(null, 0, '200', 'plava', 'crna', '2012-02-23'),
(null, 1, '30', 'zelena', 'zuta', '2012-01-11');

#select * from becar;

insert into becar(sifra, vesta,novcica,ekstroventno, modelnaocala,bojaociju, maraka )
values
(null, 'plava', '30', 1, 'velike', 'plava', '300'),
(null, 'zuta', '150', 0, 'male', 'smeda', '30'),
(null, 'crvena', '250', 1, 'pokidane', 'crna', '20');

#select * from neprijatelj;

insert into neprijatelj(sifra, prstena, carape, nausnica, prviputa, stilfrizura, becar )
values
(null, 1, 'plave', 2, '2000-02-02', 'duga kosa', 1),
(null, 2, 'zute', 1, '2000-03-02', 'kratka kosa', 2),
(null, 3, 'crne', 3, '2000-01-02', 'celav', 3);

#select * from brat;

insert into brat(sifra, narukvica, introvertno, ekstroventno, vesta, nausnica,neprijatelj )
values
(null, 1, 1, 0, 'plava', 1, 1),
(null, 2, 0, 1, 'crna', 2, 3),
(null, 3, 1, 0, 'smeda', 3, 2);

#select * from becar_djevojka;

insert into becar_djevojka(sifra, becar,djevojka )
values
(null, 1, 2),
(null, 2, 1),
(null, 3,3);

#2 zad

update cura set gustoca='14,76';

# 3 zad

delete from prijatelj where asocijalno=false;

# 4 zad

select nausnica from neprijatelj
where carape like '%ana%';

# 5 zad

select a.ogrlica, b.prviputa, c.introvertno 
from cura a
right join prijatelj b on b.sifra=a.sifra 
right join brat c on c.sifra=b.brat 
inner join neprijatelj d on d.sifra=c.neprijatelj 
inner join becar e on e.sifra=d.becar 
where d.carape like 'a%'
and
e.novcica!='28'
order by introvertno desc;


# 6 zad

select a.novcica, a.ekstroventno 
from becar a
inner join becar_djevojka b on a.sifra=b.becar;

