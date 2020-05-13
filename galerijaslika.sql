# c:\xampp\mysql\bin\mysql -uedunova -pedunova < c:\jp22\hello\galerijaslika.sql

drop database if exists galerijaslika;
create database galerijaslika;
use galerijaslika;

create table galerija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(50)
);

create table slika(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(50),
    galerija int not null,
    autor int not null
);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);



alter table slika add foreign key (galerija) references galerija(sifra);

alter table slika add foreign key (autor) references autor(sifra);