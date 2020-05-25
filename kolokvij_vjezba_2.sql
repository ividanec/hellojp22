# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_2.sql

drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2;
use kolokvij_vjezba_2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);

alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

#select * from zarucnica;

insert into zarucnica(sifra , narukvica ,bojakose ,novcica ,lipa ,indiferentno )
values
(null, 1, 'plava', '200', '30', 1),
(null, 2, 'siva', '300', '99', 0),
(null, 3, 'crna', '2000', '100', 1);

#select * from decko;

insert into decko(sifra ,indiferentno ,vesta ,asocijalno )
values
(null, 1, 'plava', 0),
(null, 0, 'siva', 1),
(null, 1, 'crna', 1);


select * from decko_zarucnica;#

insert into decko_zarucnica(sifra ,decko ,zarucnica )
values
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

#select * from cura;

insert into cura(sifra ,haljina ,drugiputa ,suknja ,narukvica ,introvertno ,majica ,decko )
values
(null, 'plava', '2019-11-11', 'plava', 1, 1, 'plava', 1),
(null, 'siva', '2011-11-11', 'siva', 1,  0, 'siva', 2),
(null, 'crna', '2020-11-11', 'crna', 1, 1, 'crna', 3);


#select * from neprijatelj;

insert into neprijatelj(sifra ,majica ,haljina ,lipa ,modelnaocala ,kuna ,jmbag ,cura )
values
(null, 'plava', 'plava', '200', 'XXX', '300', '85971166749', 1),
(null, 'siva', 'siva', '300', 'XXX', '99', '73389545216', 2),
(null, 'crna', 'crna', '2090', 'XXX', '100', '73199066082', 3);

#provjera
#select * from brat;

insert into brat(sifra ,suknja ,ogrlica ,asocijalno ,neprijatelj )
values
(null, 'plava', 1, 1, 1);
# 2 zad

update prijatelj set treciputa='2020-04-30';

# 3 zad

delete from brat where ogrlica!=14;

# 4 zad

select suknja from cura 
where drugiputa =0;

# 5 zad

select a.novcica, f.neprijatelj, e.haljina 
from zarucnica a
inner join decko_zarucnica b on a.sifra=b.zarucnica 
inner join decko c on c.sifra=b.decko 
inner join cura d on c.sifra=d.decko 
inner join neprijatelj e on d.sifra=e.cura 
inner join brat f on e.sifra=f.neprijatelj 
where d.drugiputa != 0
and 
c.vesta like '%ba%'
order by e.haljina desc;

# 6 zad

select a.vesta, a.asocijalno 
from decko a
left join decko_zarucnica b on a.sifra=b.sifra;