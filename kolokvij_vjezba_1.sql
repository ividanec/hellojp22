# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_1.sql

drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;

create table sestra(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    hlace varchar(42) not null,
    vesta varchar(41),
    prviputa datetime not null,
    modelnaocala varchar(33),
    becar int
);

create table becar(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    carape varchar(36),
    bojaociju varchar(46),
    haljina varchar(32)
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    bojaociju varchar(49),
    suknja varchar(31) not null,
    bojakose varchar(45) not null,
    prviputa datetime,
    carape varchar(41) not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    prstena int not null,
    maraka decimal(15,9) not null,
    suknja varchar(30),
    narukvica int not null,
    ostavljena int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    bojakose varchar(36),
    jmbag char(11) not null,
    prstena int not null,
    dukserica varchar(38),
    mladic int
);

create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    vesta varchar(31),
    asocijalno bit not null,
    prviputa datetime,
    eura decimal(15,6) not null,
    cura int
);

create table ostavljena_snasa(
    sifra int not null primary key auto_increment,
    ostavljena int not null,
    snasa int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    eura decimal(14,5),
    narukvica int,
    drugiputa datetime not null,
    carape varchar(41)
);

alter table sestra add foreign key (becar) references becar(sifra);

alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table ostavljena_snasa add foreign key (snasa) references snasa(sifra);

alter table mladic add foreign key (ostavljena) references ostavljena(sifra);

alter table cura add foreign key (mladic) references mladic(sifra);

alter table punac add foreign key (cura) references cura(sifra);


# select * from ostavljena;

insert into ostavljena(sifra, jmbag, bojaociju, suknja, bojakose, prviputa, carape)
values
(null, '48364450886', 'plava', 'Mini suknja', 'smeda', null, '3 para cipkastih'),
(null, '57113827690', 'smede', 'Crvena suknja', 'smeda', '2012-03-04', 'hoda bosa'),
(null, '21660315475', 'crna', 'Suknja sva u visnjama', 'crna', '2019-05-23', 'vise njih');

# select * from snasa;

insert into snasa(sifra, eura, narukvica, drugiputa, carape)
values
(null, '200302', '3', '2019-02-11', null),
(null, null, '1', '2009-11-11', null),
(null, '1000', null, '2012-12-12', null);


# select * from ostavljena_snasa;

insert into ostavljena_snasa(sifra, ostavljena, snasa)
values
(null, 1, 2),
(null, 2, 1),
(null, 3, 3);

# select * from mladic;

insert into mladic(sifra, prstena, maraka, suknja, narukvica, ostavljena)
values
(null, '2', '3000', null, '1', 1),
(null, '3', '200', null, '2', 2),
(null, '1', '60432', null, '3', 3);

# select * from cura;

insert into cura(sifra, bojakose, jmbag, prstena, dukserica, mladic)
values
(null, 'plava', '98345023456', '1', null, 1),
(null, 'smeda', '87878909091', '0', null, 2),
(null, 'crna', '78783462734', '2', null, 3);

insert into sestra(sifra,jmbag,hlace,vesta, prviputa,modelnaocala,becar)
values
(null, null,'crvene','plava kao noc','2013-02-12',null,null);

# select * from punac;
insert into punac(sifra,ekstroventno,vesta,asocijalno,prviputa,eura,cura )
values
(null, true,null,false,'2011-11-11','11',null);
# 2 zadatak
# select * from sestra;

update sestra set hlace='Osijek';

# 3 zadatak

# select * from punac;

delete from punac where vesta!='AB';

# 4 zadatak

select suknja from mladic
where maraka!='7'
or maraka!='11'
or maraka!='18'
or maraka!='25'
or maraka!='40';

# 5 zadatak


select a.vesta, b.prviputa, c.jmbag
from sestra a
right join punac b on b.sifra=a.sifra 
right join cura c on c.sifra=b.cura
inner join mladic d on d.sifra=c.mladic 
inner join ostavljena e on e.sifra=d.ostavljena 
where  d.maraka!='95te'
and 
e.bojakose like '%ba%'
order by c.jmbag desc;

# 6 zadatak

select a.bojaociju, a.suknja 
from ostavljena a
right join ostavljena_snasa b on b.ostavljena=a.sifra;