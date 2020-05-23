# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_4.sql

drop database if exists kolokvij_vjezba_4;
create database kolokvij_vjezba_4;
use kolokvij_vjezba_4;

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(44) not null,
    stilfrizura varchar(33) not null,
    treciputa datetime,
    carape varchar(39),
    gustoca decimal(16,10) not null
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    suknja varchar(46),
    ogrlica int not null,
    eura decimal(12,7) not null,
    introvertno bit not null,
    svekrva int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    majica varchar(42) not null,
    eura decimal(16,9) not null,
    hlace varchar(45) not null,
    nausnica int,
    bojaociju varchar(35) not null
);

create table zarucnica_mladic(
    sifra int not null primary key auto_increment,
    zarucnica int not null,
    mladic int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    ekstroventno bit,
    jmbag char(11),
    novcica decimal(18,6) not null,
    treciputa datetime not null
);

create table sestra(
    sifra int not null primary key auto_increment,
    indiferentno bit not null,
    prviputa datetime not null,
    suknja varchar(38),
    haljina varchar(31) not null,
    majica varchar(41) not null,
    zarucnica int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    indiferentno bit not null,
    introvertno bit not null,
    nausnica int,
    vesta varchar(35),
    novcica decimal(17,9),
    sestra int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    haljina varchar(40),
    ekstroventno bit,
    lipa decimal(18,5),
    ogrlica int not null,
    neprijatelj int
);

alter table prijateljica add foreign key (svekrva) references svekrva(sifra);

alter table zarucnica_mladic add foreign key (mladic) references mladic(sifra);

alter table zarucnica_mladic add foreign key (zarucnica) references zarucnica(sifra);

alter table sestra add foreign key (zarucnica) references zarucnica(sifra);

alter table neprijatelj add foreign key (sestra) references sestra(sifra);

alter table prijatelj add foreign key (neprijatelj) references neprijatelj(sifra);

# select * from mladic;

insert into mladic(sifra, majica, eura, hlace, nausnica, bojaociju )
values
(null, 'plava', '200', 'crvene', 1, 'plava'),
(null, 'crna', '20', 'plave',2,'crna'),
(null, 'zuta', '200', 'smede',3, 'smeda' );

# select * from zarucnica;

insert into zarucnica(sifra, ekstroventno, jmbag, novcica, treciputa )
values
(null, 1, '09256446701', '200', '2013-11-11'),
(null, 0, '73096639909', '2000', '2015-06-11'),
(null, 1, '53505468009', '200', '2013-11-23');

# select * from zarucnica_mladic;

insert into zarucnica_mladic(sifra, zarucnica, mladic )
values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

# select * from sestra;

insert into sestra(sifra, indiferentno, prviputa, suknja, haljina, majica, zarucnica )
values
(null, 1, '2011-04-09', 'plava', 'crvena', 'zelena', 1),
(null, 0, '2019-08-09', 'crvena', 'siva', 'plava', 2),
(null, 1, '2011-12-09', 'zuta', 'zelena', 'crvena', 3);

# select * from neprijatelj;

insert into neprijatelj(sifra, prviputa, indiferentno,introvertno, nausnica, vesta, novcica, sestra )
values
(null, '2000-01-21', 1, 1, 1, 'plava', '200', 1),
(null, '2000-11-21', 1, 1, 2, 'crna', '2000', 2),
(null, '2000-01-01', 1, 0, 3, 'smeda', '20', 3);

# 2 zad

update prijateljica set ogrlica=17;

# 3 zad

delete from prijatelj where haljina> 'AB';

# 4 zad

select suknja from sestra 
where prviputa = 0 ;

# 5 zad

select a.eura, b.lipa, c.indiferentno 
from prijateljica a
right join prijatelj b on b.sifra=a.sifra 
right join neprijatelj c on c.sifra=b.neprijatelj 
inner join sestra d on d.sifra=c.sestra 
inner join zarucnica e on e.sifra= d.zarucnica
where d.prviputa !=0
and
e.jmbag !=0 ;

# 6.zad

select a.jmbag, a.novcica
from zarucnica a
inner join zarucnica_mladic b on a.sifra=b.zarucnica;






