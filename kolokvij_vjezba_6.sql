# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\kolokvij_vjezba_6.sql

drop database if exists kolokvij_vjezba_6;
create database kolokvij_vjezba_6;
use kolokvij_vjezba_6;

create table ostavljena(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    haljina varchar(41) not null,
    prviputa datetime not null,
    majica varchar(33)
);

create table djevojka(
    sifra int not null primary key auto_increment,
    maraka decimal(12,10),
    asocijalno bit not null,
    drugiputa datetime not null,
    ostavljena int
);

create table brat(
    sifra int not null primary key auto_increment,
    lipa decimal(12,8),
    jmbag char(11),
    ogrlica int
);

create table svekrva_brat(
    sifra int not null primary key auto_increment,
    svekrva int not null,
    brat int not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(41),
    ogrlica int not null,
    lipa decimal(16,6)
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kuna decimal(14,5),
    bojaociju varchar(35) not null,
    novcica decimal(13,6) not null,
    gustoca decimal(14,9) not null,
    haljina varchar(33),
    svekrva int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    prstena int,
    indiferentno bit,
    asocijalno bit,
    modelnaocala varchar(47),
    zarucnica int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    dukserica varchar(33) not null,
    narukvica int not null,
    kuna decimal(17,10) not null,
    asocijalno bit not null,
    zena int
);

alter table djevojka add foreign key (ostavljena) references ostavljena(sifra);

alter table svekrva_brat add foreign key (svekrva) references svekrva(sifra);

alter table svekrva_brat add foreign key (brat) references brat(sifra);

alter table zarucnica add foreign key (svekrva) references svekrva(sifra);

alter table zena add foreign key (zarucnica) references zarucnica(sifra);

alter table snasa add foreign key (zena) references zena(sifra);

#select * from brat;

insert into brat(sifra ,lipa ,jmbag ,ogrlica )
values
(null, '200', '36845956650', 1),
(null, '2000', '94875214673', 2),
(null, '20', '67896434459', 3);

#select * from svekrva;

insert into svekrva(sifra ,modelnaocala ,ogrlica ,lipa )
values
(null, 'XXX', 1, '222'),
(null, 'Zip', 2, '2222'),
(null, 'RB', 1, '22');

#select * from svekrva_brat;

insert into svekrva_brat(sifra, svekrva ,brat )
values
(null, 1, 1),
(null, 2, 3),
(null, 3, 2);

#select * from zarucnica;

insert into zarucnica(sifra ,prviputa ,kuna ,bojaociju ,novcica ,gustoca ,haljina ,svekrva )
values
(null, '2011-11-02', '200', 'plava', '300', '10', 'plava', 1),
(null, '2020-02-02', '2000', 'crna', '3000', '100', 'crna', 2),
(null, '2019-10-02', '20', 'zuta', '30', '1', 'zuta', 3);

#select * from zena;

insert into zena(sifra ,ekstroventno ,prstena ,indiferentno ,asocijalno ,modelnaocala ,zarucnica )
values
(null, 1, 1, 1, 1, 'xxx', 1),
(null, 0, 2, 0, 1, 'Abibas', 2),
(null, 0, 3, 1, 0, 'nike', 3);

# 2 zad

update djevojka set asocijalno=false;

# 3 zad

delete from snasa where narukvica>12;

# 4 zad

select bojaociju from zarucnica
where kuna !='8'
or kuna !='13'
or kuna !='18'
or kuna !='29'
or kuna !='35';

# 5 zad

select a.drugiputa, b.asocijalno, c.prstena 
from djevojka a
right join snasa b on b.sifra=a.sifra
right join zena c on c.sifra=b.zena 
inner join zarucnica d on d.sifra=c.zarucnica 
inner join svekrva e on e.sifra=d.svekrva 
where d.kuna='91te'
and 
e.ogrlica=196
order by c.prstena desc;

# 6 zad

select a.ogrlica, a.lipa
from svekrva a
right join svekrva_brat b on a.sifra=b.svekrva;
