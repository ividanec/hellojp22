# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\funkcije_primjer1.sql

drop database if exists funkcije_primjer1;
create database funkcije_primjer1;
use funkcije_primjer1;

create table neprijateljica(
    id int(11) not null primary key auto_increment,
    indiferentno tinyint(1) not null,
    modelnaocala varchar(39) not null,
    maraka decimal(12,10) not null,
    kratkamajica varchar(32) not null,
    ogrlica int(11)
);

create table muskarac(
    id int(11) not null primary key auto_increment,
    maraka decimal(17,7) not null,
    hlace varchar(45) not null,
    prstena int(11) not null,
    nausnica int(11),
    neprijateljica int(11) not null
);

create table sestra(
    id int(11) not null primary key auto_increment,
    introvertno tinyint(1) not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int(11) not null
);

create table punac(
    id int(11) not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int(11)
);

create table zarucnica(
    id int(11) not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int(11) not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int(11) not null
);

alter table muskarac add foreign key (neprijateljica) references neprijateljica(id);
