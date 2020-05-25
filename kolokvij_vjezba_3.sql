# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_3.sql

drop database if exists kolokvij_vjezba_3;
create database kolokvij_vjezba_3;
use kolokvij_vjezba_3;

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

alter table svekar add foreign key (cura) references cura(sifra);

alter table prijatelj_brat add foreign key (brat) references brat(sifra);

alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table punica add foreign key (snasa) references snasa(sifra);

#select * from prijatelj;

insert into prijatelj(sifra ,kuna ,haljina ,lipa ,dukserica ,indiferentno )
values
(null, '999', 'plava', '99', 'plava', 1),
(null, '100', 'siva', '10', 'siva', 0),
(null, '9993', 'crna', '993', 'crna', 1);

#select * from brat;

insert into brat(sifra ,jmbag ,ogrlica ,ekstroventno )
values
(null, '73199066082', 1, 0),
(null, '09199066082', 2, 1),
(null, '23199066082', 3, 0);

#select * from prijatelj_brat;

insert into prijatelj_brat(sifra ,prijatelj ,brat )
values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

#select * from ostavljena;

insert into ostavljena(sifra,kuna,lipa ,majica ,modelnaocala ,prijatelj )
values
(null, '99', '999', 'plava', 'XXX', 1),
(null, '10', '1000', 'siva', 'Zip', 2),
(null, '993', '9993', 'crna', 'Rolex', 3);

#select * from snasa;

insert into snasa(sifra ,introvertno ,kuna ,eura,treciputa ,ostavljena )
values
(null, 1, '99', '999', '2011-11-11', 1),
(null, 0, '111', '911', '2011-03-11', 2),
(null, 1, '929', '929', '2013-01-11', 3);


#provjera
select * from punica;

insert into punica(sifra ,asocijalno ,kratkamajica ,kuna ,vesta ,snasa )
values
(null, 1, 'plava', '99', 'plava', 1);
# 2 zad

update svekar set suknja='Osijek';

# 3 zad

delete from punica where kratkamajica ='AB';

# 4 zad

select majica from ostavljena 
where lipa !='9'
or lipa !='10'
or lipa !='20'
or lipa !='30'
or lipa !='35';

# 5 zad

select a.ekstroventno, f.vesta, e.kuna
from brat a
inner join prijatelj_brat b on a.sifra=b.brat 
inner join prijatelj c on c.sifra=b.prijatelj 
inner join ostavljena d on c.sifra=d.prijatelj 
inner join snasa e on d.sifra=e.ostavljena 
inner join punica f on e.sifra=f.snasa 
where d.lipa !='91'
and 
c.haljina like '%ba%'
order by e.kuna desc;

# 6 zad

select a.haljina, a.lipa
from prijatelj a
left join prijatelj_brat b on a.sifra=b.sifra;
