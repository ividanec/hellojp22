# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_4.sql

drop database if exists kolokvij_vjezba_4;
create database kolokvij_vjezba_4;
use kolokvij_vjezba_4;

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
);

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(45),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null  
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

alter table punac add foreign key (ostavljen) references ostavljen(sifra);

alter table zena_mladic add foreign key (mladic) references mladic(sifra);

alter table zena_mladic add foreign key (zena) references zena(sifra);

alter table snasa add foreign key (zena) references zena(sifra);

alter table becar add foreign key (snasa) references snasa(sifra);

alter table prijatelj add foreign key (becar) references becar(sifra);

#select * from mladic;

insert into mladic(sifra ,kuna ,lipa ,nausnica ,stilfrizura ,vesta )
values
(null, '300', '30', 1, 'irokeza', 'plava'),
(null, '3003', '303', 2, 'kratka', 'siva'),
(null, '3001', '301', 3, 'duga kosa', 'crna');

#select * from zena;

insert into zena(sifra ,suknja ,lipa ,prstena )
values
(null, 'plava', '321', 1),
(null, 'siva', '111', 2),
(null, 'crna', '221', 1);

#select * from zena_mladic;

insert into zena_mladic(sifra ,zena ,mladic )
values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

#select * from snasa;

insert into snasa(sifra ,introvertno ,treciputa ,haljina ,zena )
values
(null, 1, '2011-02-13', 'plava', 1),
(null, 0, '2020-01-13', 'siva', 2),
(null, 1, '2011-05-23', 'crna', 3);


#select * from becar;

insert into becar(sifra ,novcica ,kratkamajica ,bojaociju ,snasa )
values
(null, '300', 'plava', 'plava', 1),
(null, '200', 'siva', 'siva', 2),
(null, '100', 'crna', 'crna', 3);

# provjera za 5. zad
#select * from prijatelj;
insert into prijatelj(sifra ,eura ,prstena ,gustoca ,jmbag ,suknja ,becar )
values
(null, '300', 1, '10', '23890721321', 'roza', 1);
# 2 zad

update punac set majica='Osijek';

# 3 zad

delete from prijatelj where prstena>17;

# 4 zad

select haljina from snasa
where treciputa =0;

# 5 zad

select a.nausnica, f.jmbag, e.kratkamajica 
from mladic a
inner join zena_mladic b on a.sifra=b.mladic 
inner join zena c on c.sifra=b.zena 
inner join snasa d on c.sifra=d.zena 
inner join becar e on d.sifra=e.snasa 
inner join prijatelj f on e.sifra=f.becar 
where d.treciputa !=0
and 
c.lipa!=29
order by e.kratkamajica desc;

# 6 zad

select a.lipa, a.prstena
from zena a
left join zena_mladic b on a.sifra=b.sifra;



