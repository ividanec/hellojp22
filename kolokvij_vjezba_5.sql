# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_5.sql

drop database if exists kolokvij_vjezba_5;
create database kolokvij_vjezba_5;
use kolokvij_vjezba_5;

create table sestra(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(50) not null,
    bojaociju varchar(30),
    haljina varchar(44),
    treciputa datetime
);

create table brat(
    sifra int not null primary key auto_increment,
    kuna decimal(14,9),
    drugiputa datetime not null,
    hlace varchar(46),
    jmbag char(11),
    sestra int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(47) not null,
    bojakose varchar(50),
    bojaociju varchar(30),
    majica varchar(46) not null,
    eura decimal(13,8) not null,
    zarucnik int not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(49),
    bojakose varchar(42),
    eura decimal(18,6) not null,
    gustoca decimal(17,10) not null,
    suknja varchar(45),
    dukserica varchar(42),
    becar int
);

create table becar(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    haljina varchar(38) not null,
    prstena int,
    narukvica int not null,
    eura decimal(17,5),
    zarucnica int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    indiferentno int not null,
    eura decimal(14,5),
    lipa decimal(14,7) not null,
    kuna decimal(13,5),
    nausnica int
);

create table zarucnica_snasa(
    sifra int not null primary key auto_increment,
    zarucnica int not null,
    snasa int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    lipa decimal(16,5) not null,
    bojakose varchar(42) not null,
    bojaociju varchar(38)
);

alter table brat add foreign key (sestra) references sestra(sifra);

alter table cura add foreign key (zarucnik) references zarucnik(sifra);

alter table zarucnik add foreign key (becar) references becar(sifra);

alter table becar add foreign key (zarucnica) references zarucnica(sifra);

alter table zarucnica_snasa add foreign key (zarucnica) references zarucnica(sifra);

alter table zarucnica_snasa add foreign key (snasa) references snasa(sifra);



# select * from snasa;

insert into snasa(sifra,narukvica,lipa,bojakose,bojaociju )
values
(null, 1, '20', 'plava', 'plava'),
(null, 2, '200', 'crna', 'smeda'),
(null, 1, '2000', 'smeda', 'crna');

# select * from zarucnica;

insert into zarucnica(sifra, narukvica,indiferentno,eura,lipa ,kuna ,nausnica )
values
(null, 1, 0, '200', '20', '300', 1),
(null, 2, 1, '20', '200', '3000', 2),
(null, 3, 0, '2000', '200', '30', 3);

# select * from zarucnica_snasa;

insert into zarucnica_snasa(sifra,zarucnica,snasa )
values
(null, 1, 2),
(null, 2, 1),
(null, 3, 3);

# select * from becar;

insert into becar(sifra,treciputa,haljina ,prstena ,narukvica ,eura ,zarucnica )
values
(null, '2011-11-11', 'plava', 1, 1, '300', 1),
(null, '2013-03-11', 'zelena', 2, 2, '3000', 2),
(null, '2011-04-11', 'smeda', 1, 1, '30', 3);

# select * from zarucnik;

insert into zarucnik(sifra ,vesta ,bojakose ,eura ,gustoca ,suknja ,dukserica ,becar )
values
(null, 'plava', 'plava', '300', '20', 'plava', 'plava', 1),
(null, 'bijela', 'bijela', '3000', '200', 'bijela', 'bijela', 2),
(null, 'plava', 'crna', '30', '20', 'crna', 'crna', 3);



# 2. zad

update brat set drugiputa='2016-04-10';

# 3. zad

delete from cura where bojakose!='AB';

# 4. zad

select prstena 
from becar
where haljina like '%ana%';

# 5 zad

select a.hlace, b.majica, c.bojakose 
from brat a
right join cura b on b.sifra=a.sifra 
right join zarucnik c on c.sifra=b.zarucnik 
inner join becar d on d.sifra= c.becar 
inner join zarucnica e on e.sifra= d.zarucnica 
where d.haljina like 'a%'
and 
e.indiferentno!=0
order by c.bojakose desc;

# 6 zad

select a.indiferentno, a.eura 
from zarucnica a
inner join zarucnica_snasa b on b.zarucnica=a.sifra;