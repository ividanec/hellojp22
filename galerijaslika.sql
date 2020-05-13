# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\galerijaslika.sql

drop database if exists galerijaslika;
create database galerijaslika;
use galerijaslika;

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    slika int not null
);

create table slika(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(50)

);
create table galerija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(50),
    slika int not null
);

alter table autor add foreign key (slika) references slika(sifra);

alter table galerija add foreign key (slika) references slika(sifra);