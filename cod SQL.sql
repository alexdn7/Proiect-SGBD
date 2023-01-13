-- 4.
create table Masina (
      cod_vin varchar(17) primary key,
      denumire varchar(30) not null,
      generatie varchar(10) default 1,
      an_fabricatie date not null,
      capacitate_cil float not null,
      combustibil varchar(10) not null);


create table Tari (    
    cod_tara varchar(4) primary key, 
    denumire varchar(20) not null);

create table Producator (
    cod_producator int primary key,
    denumire varchar(20) not null);

create table Locatie (
     id_locatie int primary key,
     oras varchar(20) not null,
     strada varchar(20) not null,
     cod_tara varchar(3) not null,
     constraint fk_locatie_tara foreign key(cod_tara)
        references Tari(cod_tara));     

create Table Magazin (
    id_magazin int primary key,
    denumire varchar(20) not null,
    id_locatie int not null,
    constraint fk_magazin_dga FOREIGN KEY(id_locatie)
        references Locatie(id_locatie)); 

create table Angajati (
     id_angajat int primary key,
     nume_complet varchar(30) not null,
     numar_telefon varchar(10),
     email varchar(30) not null,
     salariu int not null,
     data_angajare date default sysdate,
     id_magazin int not null,
     constraint fk_angajat_dga FOREIGN KEY(id_magazin)
        references Magazin(id_magazin));  

create Table Piesa (
    cod_piesa varchar(20) primary key,  
    denumire varchar(30) not null);


create table Apartine (
    cod_piesa varchar(20),
    constraint fk_apartine_piesa_dga foreign key (cod_piesa)
        references Piesa(cod_piesa),
    cod_vin varchar(17),
    constraint fk_apartine_masina_dga foreign key (cod_vin)
        references Masina(cod_vin),
    constraint pk_piesa_masina_dga primary key (cod_piesa, cod_vin));

create table Produce (
    cod_piesa varchar(20),
    constraint fk_produce_piesa_dga foreign key (cod_piesa)
        references Piesa(cod_piesa),
    cod_producator int,
    constraint fk_produce_producator_dga foreign key (cod_producator)
        references Producator(cod_producator),
    constraint pk_piesa_producator_dga primary key (cod_piesa, cod_producator));

create table Vinde (
    cod_piesa varchar(20),
    constraint fk_vinde_piesa_dga foreign key (cod_piesa)
        references Piesa(cod_piesa),
    id_magazin  int,
    constraint fk_vinde_magazin_dga foreign key (id_magazin)
        references Magazin(id_magazin),
    constraint pk_piesa_magazin_dga primary key (cod_piesa, id_magazin));  

-- 5. 
insert into Masina values('WAUDK78T29A014036', 'Audi A5', 'B8', to_date('01-01-2009', 'DD-MM-YYYY'), 2.0, 'motorina');
insert into Masina values('WAUDH74F08N050846', 'Audi A6', 'C6', to_date('05-05-2008', 'DD-MM-YYYY'), 3.2, 'benzina');
insert into Masina (cod_vin, denumire, an_fabricatie, capacitate_cil, combustibil) values('3VWPP7AJXDM604357', 'Volkswagen Jetta Sportwagen', to_date('06-05-2013', 'DD-MM-YYYY'), 2.5, 'benzina');
insert into Masina values('1C4AJWAG5CL272935', 'Jeep Wrangler', '1', to_date('03-04-2012', 'DD-MM-YYYY'), 3.0, 'motorina');
insert into Masina values('WBAUP7C59BVP21658', 'BMW Seria 1', '2', to_date('06-05-2011', 'DD-MM-YYYY'), 3.0, 'benzina');
insert into Masina values('VW1J11J5200020006', 'Golf 4', '4', to_date('21-05-2002', 'DD-MM-YYYY'), 1.4, 'benzina');
insert into Masina values('WAUDKH19293945325', 'Audi A4', 'B6', to_date('11-03-2003', 'DD-MM-YYYY'), 1.9, 'motorina');
insert into Masina values('VWPST03021G5B5519', 'Volskagen Passat', 'B5.5', to_date('20-05-2003', 'DD-MM-YYYY'), 1.9, 'motorina');


insert into Tari values('RO', 'Romania');   
insert into Tari values('BG', 'Bulgaria'); 
insert into Tari values('IT', 'Italia');
insert into Tari values('DE', 'Germania');
insert into Tari values('AF', 'Afganistan');


insert into Locatie values(1, 'Curtea de Arges', '1 Mai', 'RO');
insert into Locatie values(2, 'Bucuresti', 'Elena', 'RO');                                                
insert into Locatie values(3, 'Rm. Valcea', 'Nicolae Balcescu', 'RO');
insert into Locatie values(4, 'Rose', 'Dunav', 'BG');
insert into Locatie values(5, 'Napoli', 'Napolii Street', 'IT');

insert into Producator values(1, 'Bosch');
insert into Producator values(2, 'Valeo');
insert into Producator values(3, 'MANN-FILTER');
insert into Producator values(4, 'Lemforder');
insert into Producator values(5, 'Ridex');
insert into Producator values(6, 'Hangkok');
insert into Producator values(7, 'Continental');
insert into Producator values(8, 'Corteco');
insert into Producator values(9, 'NG');
insert into Producator values(10, 'VAG');

insert into Magazin values(1, 'Auto Total Arges', 1); 
insert into Magazin values(2, 'Auto Total Valcea', 3);
insert into Magazin values(3, 'Auto Total Colentina', 2);
insert into Magazin values(4, 'Auto Total Bulgaria', 4);
insert into Magazin values(5, 'Auto Total Italy', 5);

CREATE SEQUENCE genereaza_ang
MINVALUE 0
START WITH 1
INCREMENT BY 1
nocycle nocache;

insert into Angajati values (genereaza_ang.nextval, 'Simion Petrica', null, 'spetrica81@gmail.com', 20000, to_date('25-03-2021', 'DD-MM-YYYY'), 2);
insert into Angajati values (genereaza_ang.nextval, 'Andrei Cristian', null, 'dumitrache@gmail.com', 3000, to_date('30-05-2005', 'DD-MM-YYYY'), 1);
insert into Angajati values (genereaza_ang.nextval, 'Alfred Pop', '0712789810', 'hbejan@hotmail.com', 5000, to_date('20-03-2004', 'DD-MM-YYYY'), 2);
insert into Angajati values (genereaza_ang.nextval, 'Nicolae-Chivu', null, 'nchive@yahoo.ro', 2000, to_date('20-01-2006', 'DD-MM-YYYY'), 5);
insert into Angajati(id_angajat, nume_complet, numar_telefon, email, salariu, id_magazin)
    values (genereaza_ang.nextval, 'Elisabeta D?rjan', null, 'edirjan@yahoo.com', 2500, 2);
insert into Angajati values (genereaza_ang.nextval, 'Ciolac Petrut', null, 'cpetrut@hotmail.com', 6000, to_date('20-03-2007', 'DD-MM-YYYY'), 4); 


insert into Piesa values('DF4848', 'Disc frana');
insert into Piesa values('585157', 'Filtru aer');
insert into Piesa values('1J0513025BG', 'Amortizor');
insert into Piesa values('027105271P', 'Volanta');
insert into Piesa values('4F0121251R', 'Radiator');
insert into Piesa values('1K0199855AJ', 'Suport motor');
insert into Piesa values('5C6821106', 'Aripa');
insert into Piesa values('1J0145803F', 'Intercooler');
insert into Piesa values('0589AJF128', 'Disc ambreiaj');
insert into Piesa values('091TUHJF51', 'Ax cu came');
insert into Piesa values('A03A4B6D3', 'Garnitura chiloasa');


insert into Apartine values('DF4848', 'WAUDK78T29A014036');
insert into Apartine values('027105271P', 'WAUDH74F08N050846');
insert into Apartine values('4F0121251R', 'WAUDH74F08N050846');
insert into Apartine values('5C6821106', '3VWPP7AJXDM604357');
insert into Apartine values('1K0199855AJ', '3VWPP7AJXDM604357');
insert into Apartine values('027105271P', 'VW1J11J5200020006');
insert into Apartine values('1J0513025BG', 'VW1J11J5200020006');
insert into Apartine values('1J0145803F', 'VWPST03021G5B5519');
insert into Apartine values('A03A4B6D3', 'WAUDKH19293945325');
insert into Apartine values('0589AJF128', 'VWPST03021G5B5519');


insert into Produce values('DF4848', 1);
insert into Produce values('027105271P', 3);
insert into Produce values('4F0121251R', 2);
insert into Produce values('5C6821106', 2);
insert into Produce values('1K0199855AJ', 5);
insert into Produce values('027105271P', 6);
insert into Produce values('1J0513025BG', 5);
insert into Produce values('091TUHJF51', 6);
insert into Produce values('1J0145803F', 6);
insert into Produce values('A03A4B6D3', 5);


insert into Vinde values('DF4848', 1);
insert into Vinde values('027105271P', 2);
insert into Vinde values('4F0121251R', 2);
insert into Vinde values('5C6821106', 2);
insert into Vinde values('1K0199855AJ', 4);
insert into Vinde values('027105271P', 3);
insert into Vinde values('1J0513025BG', 5);
insert into Vinde values('1J0145803F', 1);
insert into Vinde values('A03A4B6D3', 3);
insert into Vinde values('0589AJF128', 2);

-- 6. 
CREATE OR REPLACE PROCEDURE afisare_piese
IS
    TYPE vector IS VARRAY(100) OF Magazin.id_magazin%TYPE;
    TYPE vector_auxiliar IS VARRAY(100) OF piesa.denumire%TYPE;
    TYPE ibtable IS TABLE OF vector_auxiliar INDEX BY PLS_INTEGER;
    
    arr_mag vector;
    arr_piese ibtable;
    
BEGIN
    SELECT id_magazin
    BULK COLLECT INTO arr_mag
    FROM magazin;
    
    FOR i in 1..arr_mag.count LOOP
   
        SELECT denumire
        BULK COLLECT INTO arr_piese(i)
        FROM piesa
        JOIN vinde USING (cod_piesa)
        WHERE id_magazin = arr_mag(i);
   
           
   END LOOP; 
   FOR i in 1..arr_mag.count LOOP
        DBMS_OUTPUT.PUT_LINE('Cod magazin: ' || arr_mag(i));
        
        FOR j in 1..arr_piese(i).count loop
            DBMS_OUTPUT.PUT_LINE(arr_piese(i)(j));
        END LOOP;
         DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    
END afisare_piese;
/

execute afisare_piese;

-- 7. 
CREATE OR REPLACE PROCEDURE afisare_angajati_dga IS
    CURSOR magazine IS
        SELECT id_magazin, denumire
        FROM magazin;
        
    CURSOR angajati (magazin magazin.id_magazin%TYPE) IS
        SELECT nume_complet, email, numar_telefon
        FROM angajati
        WHERE id_magazin = magazin;
        
    idMagazin magazin.id_magazin%TYPE;
    numeMagazin magazin.denumire%TYPE;
    counter NUMBER;
BEGIN
    OPEN magazine;
    
    LOOP
        FETCH magazine into idMagazin, numeMagazin;
        EXIT WHEN magazine%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Magazinul cu ID-ul ' || idMagazin || ' si numele ' || numeMagazin || ' are angajatii:');
        counter := 0;
        
        FOR i in angajati(idMagazin) LOOP
            DBMS_OUTPUT.PUT_LINE(i.nume_complet || ' ' || i.numar_telefon || ' ' || i.email);
            counter := counter + 1;
        END LOOP;
    
    IF counter = 0
        THEN
            DBMS_OUTPUT.PUT_LINE('Nu exista angajati in acest magazin!');
    END IF;
    
    DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    CLOSE magazine;
     
END afisare_angajati_dga;
/


-- Execut procedura

EXECUTE afisare_angajati_dga;


-- 8. 

CREATE OR REPLACE FUNCTION numar_angajati_dga (tara Tari.cod_tara%TYPE)
RETURN NUMBER IS
    id_ang Angajati.id_angajat%type;
BEGIN

    SELECT id_angajat
    INTO id_ang
    FROM angajati a
    JOIN magazin m on (m.id_magazin = a.id_magazin)
    JOIN locatie l on (l.id_locatie = m.id_locatie)
    WHERE upper(l.cod_tara) = upper(tara)
        AND numar_telefon is null;

    RETURN id_ang;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20001, 'Nu exista niciun angajat care sa corespunda cautarii!');
            
    WHEN TOO_MANY_ROWS
        THEN
            RAISE_APPLICATION_ERROR(-20002, 'Sunt prea multi angajati care corespund!');

END numar_angajati_dga;
/


-- 9.
CREATE OR REPLACE PROCEDURE afisare_producator(tara Tari.cod_tara%TYPE, lungime NUMBER)
IS
    den_prod Producator.denumire%TYPE;
BEGIN
    SELECT unique producator.denumire
    INTO den_prod
    FROM producator
    JOIN produce USING (cod_producator)
    JOIN vinde USING (cod_piesa)
    JOIN magazin USING (id_magazin)
    JOIN locatie USING (id_locatie)
    WHERE cod_tara = 'RO'
        AND LENGTH(producator.denumire) = lungime;
        
    DBMS_OUTPUT.PUT_LINE('Producatorul care corespunde are denumirea: ' || den_prod);
EXCEPTION
    WHEN TOO_MANY_ROWS
        THEN
            RAISE_APPLICATION_ERROR(-20010, 'Prea multi producatori corespund cerintelor!');
            
    WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20011, 'Nu a fost gasit niciun producator care sa corespunda cerintelor!');
END afisare_producator;
/


-- 10. 
CREATE OR REPLACE TRIGGER trigger_piese
    BEFORE INSERT ON piesa
DECLARE
BEGIN
        IF (TO_CHAR(SYSDATE, 'D') BETWEEN 2 AND 7) OR
            (TO_CHAR(SYSDATE, 'HH24')   BETWEEN 9 AND 17) 
        THEN
            RAISE_APPLICATION_ERROR(-20005, 'Nu se pot face inserari in aceasta perioada!');
    END IF;
END;
/



-- 11. 
CREATE OR REPLACE TRIGGER previne_salariu_gresit
BEFORE UPDATE ON angajati
FOR EACH ROW
BEGIN
   IF :NEW.salariu < 1900 THEN
      RAISE_APPLICATION_ERROR(-20015, 'Nu este permisa adaugarea unui salariu sub cel minim pe economie');
   END IF;
END;
/

-- 12. 

CREATE OR REPLACE TRIGGER previne_modificari_nepotrivite
AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
   IF (TO_CHAR(SYSDATE, 'D') NOT BETWEEN 2 AND 7) 
        THEN
            RAISE_APPLICATION_ERROR(-20016, 'Modificarea schemei nu este permisa în weekend!');
   END IF;
END;

-- 13.
CREATE OR REPLACE PACKAGE pachet_rezolvari
AS
    PROCEDURE afisare_piese;
    PROCEDURE afisare_angajati_dga;
    FUNCTION numar_angajati_dga (tara Tari.cod_tara%TYPE)  RETURN NUMBER;
    PROCEDURE afisare_producator(tara Tari.cod_tara%TYPE, lungime NUMBER);
END pachet_rezolvari;
/

CREATE OR REPLACE PACKAGE BODY pachet_rezolvari 
IS
PROCEDURE afisare_piese IS

    TYPE vector IS VARRAY(100) OF Magazin.id_magazin%TYPE;
    TYPE vector_auxiliar IS VARRAY(100) OF piesa.denumire%TYPE;
    TYPE ibtable IS TABLE OF vector_auxiliar INDEX BY PLS_INTEGER;
    
    arr_mag vector;
    arr_piese ibtable;
    
BEGIN

    SELECT id_magazin
    BULK COLLECT INTO arr_mag
    FROM magazin;
    
    FOR i in 1..arr_mag.count LOOP
   
        SELECT denumire
        BULK COLLECT INTO arr_piese(i)
        FROM piesa
        JOIN vinde USING (cod_piesa)
        WHERE id_magazin = arr_mag(i);
   
   END LOOP; 
   FOR i in 1..arr_mag.count LOOP
        DBMS_OUTPUT.PUT_LINE('Cod magazin: ' || arr_mag(i));
        
        FOR j in 1..arr_piese(i).count loop
            DBMS_OUTPUT.PUT_LINE(arr_piese(i)(j));
        END LOOP;
         DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    
END afisare_piese;

PROCEDURE afisare_angajati_dga IS
    CURSOR magazine IS
        SELECT id_magazin, denumire
        FROM magazin;
        
    CURSOR angajati (magazin magazin.id_magazin%TYPE) IS
        SELECT nume_complet, email, numar_telefon
        FROM angajati
        WHERE id_magazin = magazin;
        
    idMagazin magazin.id_magazin%TYPE;
    numeMagazin magazin.denumire%TYPE;
    counter NUMBER;
BEGIN
    OPEN magazine;
    
    LOOP
        FETCH magazine into idMagazin, numeMagazin;
        EXIT WHEN magazine%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Magazinul cu ID-ul ' || idMagazin || ' si numele ' || numeMagazin || ' are angajatii:');
        counter := 0;
        
        FOR i in angajati(idMagazin) LOOP
            DBMS_OUTPUT.PUT_LINE(i.nume_complet || ' ' || i.numar_telefon || ' ' || i.email);
            counter := counter + 1;
        END LOOP;
    
    IF counter = 0
        THEN
            DBMS_OUTPUT.PUT_LINE('Nu exista angajati in acest magazin!');
    END IF;
    
    DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    CLOSE magazine;
     
END afisare_angajati_dga;

FUNCTION numar_angajati_dga (tara Tari.cod_tara%TYPE)
RETURN NUMBER IS
    id_ang Angajati.id_angajat%type;
BEGIN

    SELECT id_angajat
    INTO id_ang
    FROM angajati a
    JOIN magazin m on (m.id_magazin = a.id_magazin)
    JOIN locatie l on (l.id_locatie = m.id_locatie)
    WHERE upper(l.cod_tara) = upper(tara)
        AND numar_telefon is null;

    RETURN id_ang;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20001, 'Nu exista niciun angajat care sa corespunda cautarii!');
            
    WHEN TOO_MANY_ROWS
        THEN
            RAISE_APPLICATION_ERROR(-20002, 'Sunt prea multi angajati care corespund!');

END numar_angajati_dga;

PROCEDURE afisare_producator(tara Tari.cod_tara%TYPE, lungime NUMBER)
IS
    den_prod Producator.denumire%TYPE;
BEGIN
    SELECT unique producator.denumire
    INTO den_prod
    FROM producator
    JOIN produce USING (cod_producator)
    JOIN vinde USING (cod_piesa)
    JOIN magazin USING (id_magazin)
    JOIN locatie USING (id_locatie)
    WHERE cod_tara = 'RO'
        AND LENGTH(producator.denumire) = lungime;
        
    DBMS_OUTPUT.PUT_LINE('Producatorul care corespunde are denumirea: ' || den_prod);
EXCEPTION
    WHEN TOO_MANY_ROWS
        THEN
            RAISE_APPLICATION_ERROR(-20010, 'Prea multi producatori corespund cerintelor!');
            
    WHEN NO_DATA_FOUND
        THEN
            RAISE_APPLICATION_ERROR(-20011, 'Nu a fost gasit niciun producator care sa corespunda cerintelor!');
END afisare_producator;
END pachet_rezolvari;
/

