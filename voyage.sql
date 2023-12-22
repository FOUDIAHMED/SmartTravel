--@block 
CREATE DATABASE smartTravel;
CREATE TABLE company(
    idCompanyID INTEGER PRIMARY KEY,
    companyName VARCHAR(255) NOT NULL,
    companyimage varchar(255) not null
);
Create TABLE bus(
    idBusID INTEGER PRIMARY KEY,
    matricule VARCHAR(255) NOT NULL ,
    numBus int not null,
    companyID int not null,
    capacity int not null,
    FOREIGN KEY(companyID) REFERENCES company(idCompanyID)
    
);
CREATE TABLE ville(
    idVilleID INTEGER PRIMARY KEY,
    villeName VARCHAR(255) NOT NULL);

    CREATE TABLE route(
        idRouteID INTEGER PRIMARY KEY,
        vil_depart int not null,
        vil_arrivee int not null,
        distance float not null,
        duree  time not null,
        FOREIGN KEY(vil_depart) REFERENCES ville(idVilleID),
        FOREIGN KEY(vil_arrivee) REFERENCES ville(idVilleID)
        constraint ck_ville check (vil_arrivee <>vil_arrivee)
    );
    CREATE TABLE horaire(
        idBus int,
        idroute int,
        dateDepart date,
        heureDepart time,
        heureArrive time,
        siege_disp int,
        prix float,
        FOREIGN KEY(idBus) REFERENCES bus(idBusID),
        FOREIGN KEY(idroute) REFERENCES route(idRouteID)
    );
