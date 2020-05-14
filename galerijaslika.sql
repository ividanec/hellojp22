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
    srednje_ime varchar(50),
    prezime varchar(50)
);



alter table slika add foreign key (galerija) references galerija(sifra);

alter table slika add foreign key (autor) references autor(sifra);

#select * from autor;

insert into autor(sifra, ime, prezime)
values
(null, 'Edvard', 'Munch'),
(null, 'Vincent van', 'Gogh'),
(null, 'Leonardo da', 'Vinci');

#select * from galerija;

insert into galerija(sifra, naziv, opis)
values
(null, 'Friz života', 'teme života, ljubavi, straha, smrti i melankolije'),
(null, 'Portret', null),
(null, 'Suncokreti', null);

# select * from slika;

insert into slika(sifra, naziv, opis, galerija, autor)
values
(null, 'Krik', 'izvornog naziva "Očaj"', 1, 1),
(null, 'Mona Lisa', 'portret Lise del Giocondo', 2, 3),
(null, 'Suncokreti', null, 3, 2);

delete from slika where sifra=1;
delete from slika where sifra=2;
delete from slika where sifra=3;

update autor set
ime='Vincent',
srednje_ime='van',
prezime='Gogh'
where sifra=2;

update autor set
ime='Leonardo',
srednje_ime='da',
prezime='Vinci'
where sifra=3;

insert into slika(sifra, naziv, opis, galerija, autor)
values
(null, 'Krik', 'izvornog naziva "Očaj"', 1, 1),
(null, 'Mona Lisa', 'portret Lise del Giocondo', 2, 3),
(null, 'Suncokreti', null, 3, 2);