SET SERVEROUTPUT ON;
DECLARE
nCount NUMBER;

BEGIN
SELECT count(*) into nCount FROM user_tables where table_name = 'COUNTRY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE COUNTRY ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table COUNTRY CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE COUNTRY (
    COUNTRY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) primary key, 
    COUNTRY_NAME VARCHAR(20) NOT NULL)';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE COUNTRY (
    COUNTRY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) primary key, 
    COUNTRY_NAME VARCHAR(20) NOT NULL)';    

END IF;




SELECT count(*) into nCount FROM user_tables where table_name = 'ROOM_TYPE';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE ROOM_TYPE ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table ROOM_TYPE CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM_TYPE(
    ROOM_TYPE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 100000) primary key,
    ROOM_DESCRIPTION VARCHAR(20),
    COST_PER_DAY DECIMAL(10,2) NOT NULL,
    SMOKE_FRIENDLY NUMBER(1) CHECK (SMOKE_FRIENDLY IN (0,1)),
    PET_FRIENDLY NUMBER(1) CHECK (PET_FRIENDLY IN (0,1)))';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM_TYPE(
    ROOM_TYPE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 100000) primary key,
    ROOM_DESCRIPTION VARCHAR(20),
    COST_PER_DAY DECIMAL(10,2) NOT NULL,
    SMOKE_FRIENDLY NUMBER(1) CHECK (SMOKE_FRIENDLY IN (0,1)),
    PET_FRIENDLY NUMBER(1) CHECK (PET_FRIENDLY IN (0,1)))';    

END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'STATES';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE STATES ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table STATES CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE STATES (
    STATE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) primary key, 
    STATE_NAME VARCHAR(20) NOT NULL,
    COUNTRY_ID REFERENCES COUNTRY(COUNTRY_id) ON DELETE CASCADE)';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE STATES (
    STATE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) primary key, 
    STATE_NAME VARCHAR(20) NOT NULL,
    COUNTRY_ID REFERENCES COUNTRY(COUNTRY_id) ON DELETE CASCADE)';    

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'CITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE CITY ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table CITY CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE CITY (
    CITY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 500 INCREMENT BY 1 MAXVALUE 100000) primary key, 
    CITY_NAME VARCHAR2(40) NOT NULL, 
    STATE_ID REFERENCES STATES(STATE_ID) ON DELETE CASCADE
    )';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE CITY 
   (
    CITY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 500 INCREMENT BY 1 MAXVALUE 100000) primary key, 
    CITY_NAME VARCHAR2(40) NOT NULL, 
    STATE_ID REFERENCES STATES(STATE_ID) ON DELETE CASCADE
    )';    

END IF;


SELECT count(*) into nCount FROM user_tables where table_name = 'TOURIST_ATTRACTIONS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE TOURIST_ATTRACTIONS ALREADY EXISTS THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table  TOURIST_ATTRACTIONS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE  TOURIST_ATTRACTIONS (
    TOURIST_ATTRACTION_ID      NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TOURIST_ATTRACTION_NAME   VARCHAR(100) NOT NULL,
    CITY_ID INT REFERENCES  CITY( CITY_ID) ON DELETE CASCADE,
    PRIMARY KEY(TOURIST_ATTRACTION_ID))';      
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE  TOURIST_ATTRACTIONS (
    TOURIST_ATTRACTION_ID      NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TOURIST_ATTRACTION_NAME   VARCHAR(100) NOT NULL,
    CITY_ID INT REFERENCES  CITY( CITY_ID) ON DELETE CASCADE,
    PRIMARY KEY(TOURIST_ATTRACTION_ID))';      
END IF;




SELECT count(*) into nCount FROM user_tables where table_name = 'BOOKING_STATUS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BOOKING_STATUS ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table BOOKING_STATUS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE BOOKING_STATUS (
    BOOKING_STATUS_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000),
    BOOKING_STATUS    VARCHAR(20) NOT NULL,
    PRIMARY KEY(BOOKING_STATUS_ID))';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE BOOKING_STATUS (
    BOOKING_STATUS_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000),
    BOOKING_STATUS    VARCHAR(20) NOT NULL,
    PRIMARY KEY(BOOKING_STATUS_ID))';    

END IF;


SELECT count(*) into nCount FROM user_tables where table_name = 'PAYMENT_TYPE';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE PAYMENT_TYPE ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table PAYMENT_TYPE CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT_TYPE (
    PAYMENT_TYPE_ID     NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000)PRIMARY KEY ,
    PAYMENT_TYPE_DESC   VARCHAR(20) NOT NULL)';    
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT_TYPE (
    PAYMENT_TYPE_ID     NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000)PRIMARY KEY ,
    PAYMENT_TYPE_DESC   VARCHAR(20) NOT NULL)';
END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'PAYMENT';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE PAYMENT ALREADY EXISTS THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table PAYMENT CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT (
    PAYMENT_ID        NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY ,
    PAYMENT_TYPE_ID  REFERENCES PAYMENT_TYPE(payment_type_id) ON DELETE CASCADE)';    
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT (
    PAYMENT_ID        NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY ,
    PAYMENT_TYPE_ID  REFERENCES PAYMENT_TYPE(payment_type_id) ON DELETE CASCADE)';    
END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'HOTEL_CHAIN';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE HOTEL_CHAIN ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table HOTEL_CHAIN CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE HOTEL_CHAIN (
    HOTEL_CHAIN_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 400 INCREMENT BY 1 MAXVALUE 100000) primary key,
    HOTEL_CHAIN_NAME VARCHAR(80) NOT NULL )';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE HOTEL_CHAIN (
    HOTEL_CHAIN_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 400 INCREMENT BY 1 MAXVALUE 100000) primary key,
    HOTEL_CHAIN_NAME VARCHAR(80) NOT NULL )';    
END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'HOTEL';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE HOTEL ALREADY EXISTS THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table HOTEL CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE HOTEL (
    HOTEL_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 300 INCREMENT BY 1 MAXVALUE 100000) primary key,
    HOTEL_NAME VARCHAR(80) NOT NULL,
    STAR_RATING NUMBER(1) CHECK(STAR_RATING IN (1,2,3,4,5)),
    HOTEL_CHAIN_ID REFERENCES HOTEL_CHAIN(HOTEL_CHAIN_ID) ON DELETE CASCADE,
    CITY_ID REFERENCES CITY(CITY_ID) ON DELETE CASCADE,
    CONTACT_NO NUMBER(12),
    CHECK_IN_TIME VARCHAR(10),
    CHECK_OUT_TIME VARCHAR(10),
    ADDRESS VARCHAR(100) NOT NULL
    )';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE HOTEL (
    HOTEL_ID NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 300 INCREMENT BY 1 MAXVALUE 100000) primary key,
    HOTEL_NAME VARCHAR(80) NOT NULL,
    STAR_RATING VARCHAR(1) CHECK(STAR_RATING IN (1,2,3,4,5)),
    HOTEL_CHAIN_ID REFERENCES HOTEL_CHAIN(HOTEL_CHAIN_ID) ON DELETE CASCADE,
    CITY_ID REFERENCES CITY(CITY_ID) ON DELETE CASCADE,
    CONTACT_NO NUMBER(12),
    CHECK_IN_TIME VARCHAR(10),
    CHECK_OUT_TIME VARCHAR(10),
    ADDRESS VARCHAR(100) NOT NULL)';    
END IF;


SELECT count(*) into nCount FROM user_tables where table_name = 'ROOM';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE ROOM ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table ROOM CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM (
    room_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    room_type_id REFERENCES ROOM_TYPE(room_type_id) on delete cascade,
    hotel_id REFERENCES HOTEL(hotel_id) on delete cascade)';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM (
    room_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    room_type_id REFERENCES ROOM_TYPE(room_type_id) on delete cascade,
    hotel_id REFERENCES HOTEL(hotel_id) on delete cascade)';
END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'USER_ENTITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE USER_ENTITY ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table USER_ENTITY CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE USER_ENTITY (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY,
    USERNAME VARCHAR(16) UNIQUE NOT NULL,
    first_name VARCHAR(12) NOT NULL,
    last_name VARCHAR(12) NOT NULL,
    email_id VARCHAR(31) unique NOT NULL,
    PASS_WORD VARCHAR(20) NOT NULL,
    phone_number NUMBER,
    tourist_attraction_id NUMBER ,
    city_id NUMBER NOT NULL,
    date_joined DATE NOT NULL,
    date_of_birth DATE NOT NULL)';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE USER_ENTITY (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY,
    USERNAME VARCHAR(16) UNIQUE NOT NULL,
    first_name VARCHAR(12) NOT NULL,
    last_name VARCHAR(12) NOT NULL,
    email_id VARCHAR(31) unique NOT NULL,
    PASS_WORD VARCHAR(20) NOT NULL,
    phone_number NUMBER,
    tourist_attraction_id NUMBER ,
    city_id NUMBER NOT NULL,
    date_joined DATE NOT NULL,
    date_of_birth DATE NOT NULL)';    

END IF;


SELECT count(*) into nCount FROM user_tables where table_name = 'BOOKING';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE BOOKING ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table BOOKING CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE BOOKING (
  booking_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1 MAXVALUE 200000000) primary key,
  booking_date DATE NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  payment_id REFERENCES PAYMENT(payment_id) on delete cascade,
  total_amount DECIMAL(10,2) NOT NULL,
  total_rooms_booked number NOT NULL,
  hotel_id REFERENCES HOTEL(hotel_id) on delete cascade,
  user_id REFERENCES USER_ENTITY(user_id) on delete cascade,
  booking_status_id REFERENCES BOOKING_STATUS(booking_status_id) on delete cascade)';
ELSE
EXECUTE IMMEDIATE 'CREATE TABLE BOOKING (
  booking_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1 MAXVALUE 200000000) primary key,
  booking_date DATE NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  payment_id REFERENCES PAYMENT(payment_id) on delete cascade,
  total_amount DECIMAL(10,2) NOT NULL,
  total_rooms_booked number NOT NULL,
  hotel_id REFERENCES HOTEL(hotel_id) on delete cascade,
  user_id REFERENCES USER_ENTITY(user_id) on delete cascade,
  booking_status_id REFERENCES BOOKING_STATUS(booking_status_id) on delete cascade)';    

END IF;


SELECT count(*) into nCount FROM user_tables where table_name = 'ROOM_BOOKED_ENTITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE ROOM_BOOKED_ENTITY ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table ROOM_BOOKED_ENTITY CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM_BOOKED_ENTITY (
    room_booked_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    booking_id REFERENCES BOOKING(booking_id) on delete cascade,
    room_id INT NOT NULL
    )';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE ROOM_BOOKED_ENTITY (
    room_booked_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    booking_id REFERENCES BOOKING(booking_id) on delete cascade,
    room_id INT NOT NULL
    )';    

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'REVIEWS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE REVIEWS ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table REVIEWS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE REVIEWS (
    review_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    review_rating NUMBER CHECK (REVIEW_RATING IN (1,2, 3, 4, 5)),
    booking_id REFERENCES BOOKING(booking_id) on delete cascade,
    review_desc varchar (200)
    )';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE REVIEWS (
    review_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 200000000) primary key,
    review_rating NUMBER CHECK (REVIEW_RATING IN (1,2, 3, 4, 5)),
    booking_id REFERENCES BOOKING(booking_id) on delete cascade,
    review_desc varchar (200)
    )';    

END IF;

SELECT count(*) into nCount FROM DBA_ROLES where ROLE ='DB_CLIENT';
IF(nCount > 0)
THEN
    dbms_output.put_line('ROLE DB_CLIENT ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE'CREATE ROLE DB_CLIENT';    
    EXECUTE IMMEDIATE'GRANT CREATE SESSION, CONNECT TO DB_CLIENT';   
    EXECUTE IMMEDIATE'GRANT SELECT ON COUNTRY TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON STATES TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON CITY TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON BOOKING TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON HOTEL TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON HOTEL_CHAIN TO DB_CLIENT';
    EXECUTE IMMEDIATE'GRANT SELECT ON ROOM_BOOKED_ENTITY TO DB_CLIENT';    
    EXECUTE IMMEDIATE'GRANT SELECT ON TOURIST_ATTRACTIONS TO DB_CLIENT';
--    EXECUTE IMMEDIATE'GRANT SELECT ON ROOM_BOOKED_ENTITY TO DB_CLIENT';
--  Add more tablessss   
     
    
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM COUNTRY FOR admin.country';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM CITY FOR admin.city';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM STATES FOR admin.STATES';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM BOOKING FOR admin.BOOKING';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM HOTEL FOR admin.HOTEL';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM HOTEL_CHAIN FOR admin.HOTEL_CHAIN';
    EXECUTE IMMEDIATE'CREATE OR REPLACE PUBLIC SYNONYM ROOM_BOOKED_ENTITY FOR admin.ROOM_BOOKED_ENTITY';
    COMMIT;
END IF;



SELECT count(*) into nCount FROM ALL_USERS where USERNAME ='NEW_CLIENT';
IF(nCount > 0)
THEN
    dbms_output.put_line('NEW_CLIENT USER ALREADY EXISTS');
ELSE
--  EXECUTE IMMEDIATE'alter session set "_ORACLE_SCRIPT"=true';  
  EXECUTE IMMEDIATE'create user NEW_CLIENT identified by WELcome123456';
  EXECUTE IMMEDIATE'GRANT CREATE SESSION,CONNECT TO NEW_CLIENT';
  
END IF;



EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(dbms_utility.format_error_backtrace);
            dbms_output.put_line(SQLERRM);
            ROLLBACK;
            RAISE;
COMMIT;
END;
/

------------------------------------------------------------------------------------PROCEDURES----------------------------------------------------------------------------------------------

--HELP TO NEW_CUSTOMERS
CREATE OR REPLACE PROCEDURE HELP
AS
BEGIN
        dbms_output.put_line('START USING THIS APPLICATION BY SIGNING UP !');
        dbms_output.put_line('EXECUTE THE BELOW PROCEDURE WITH THE SPECIFIED PARAMETERS IN AN ANONYMOUS PL/SQL BLOCK AS FOLLOWS');
        dbms_output.put_line('SIGnUP(first_name varchar,last_name varchar,email_id varchar, pass_word varchar,phone_number number,tourist_attraction_id number,city_id number, date_of_birth date)');
        dbms_output.put_line('AFTER LOGGING IN EXECUTE ALL_ACTIONS TO SEE THE MENU OF HOTEL BOOKING');

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;
END HELP;
/
GRANT EXECUTE ON HELP TO NEW_CLIENT;

--ALL ACTIONS OF REGISTERED CUSTOMERS
CREATE OR REPLACE PROCEDURE USER_ACTIONS
AS
BEGIN
        dbms_output.put_line('HELLO '||SYS_CONTEXT( 'USERENV', 'SESSION_USER' )||' ! WELCOME TO OUR TRAVEL MANAGEMENT SYSTEM - HOTEL BOOKING!');
        
        dbms_output.put_line('AVAILABLE ACTIONS:');
        dbms_output.put_line('------------- PERSONAL INFORMATION -------------');
        dbms_output.put_line('1. VIEW YOUR INFORMATION SELECT * FROM ADMIN.USER_ENTITY WHERE USERNAME = <USERNAME>');--PJ
        dbms_output.put_line('');
        
        dbms_output.put_line('------------- HOTEL SEARCH RELATED ACTIONS -----------');
    
        dbms_output.put_line('1. REFER TO ALL THE HOTELS USING SELECT * FROM HOTEL');-- PRASANNA
        dbms_output.put_line('2. REFER TO HOTELS NEARBY YOUR PREFERRED TOURIST DESTINATION');--PRASANNA
        dbms_output.put_line('3. REFER TO ALL THE HOTELS IN YOUR SELECTED DESTINATION CITY');--PJ
        dbms_output.put_line('4. REFER TO ALL THE HOTELS BASED ON USER RATING'); --DIPTI
        dbms_output.put_line('5. REFER TO ALL THE HOTELS BASED ON HOTEL STAR RATING ');-- SHIVANI
        dbms_output.put_line('');
        
        dbms_output.put_line('------------- BOOK A ROOM -----------');
        
        dbms_output.put_line('1. SEARCH AVAILABLE ROOMS  ');--SV
        dbms_output.put_line('2. BOOK ROOM '); --PRASANNA
        dbms_output.put_line('3. VIEW BOOKING AND PAYMENT STATUS '); -- DD
        dbms_output.put_line('');
        
        
        
        dbms_output.put_line('-------------PROVIDE RATING TO HOTEL -------------');
        dbms_output.put_line('1. VIEW BOOKING HISTORY ');--PP
        dbms_output.put_line('2. PROVIDE RATING TO PREVIOUS BOOKING');--PJ
        dbms_output.put_line('3. delete RATING ');--PJ
        dbms_output.put_line('');
        
        
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;
END USER_ACTIONS;
/


CREATE OR REPLACE PROCEDURE ADMIN_ACTIONS
AS
BEGIN
        dbms_output.put_line('HELLO '||SYS_CONTEXT( 'USERENV', 'SESSION_USER' )||' ! WELCOME TO OUR TRAVEL MANAGEMENT SYSTEM - ADMIN PAGE!');
        
        dbms_output.put_line('ADD HOTELS AND ROOMS:');
        dbms_output.put_line('------------- ADD HOTEL AND ROOMS -------------'); --DIPTI
        
        
        dbms_output.put_line('------------- VIEW REPORTS -----------');
        -- lIST REPORTS OF ADMIN - PRASANNA
        dbms_output.put_line('');
        
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;
END ADMIN_ACTIONS;

/




CREATE OR REPLACE PROCEDURE signup(user_name varchar,first_name varchar,last_name varchar,email_id varchar, pass_word varchar,phone_number number,tourist_attraction_id number,city_id number, date_of_birth date)
IS 
uid NUMBER;
sqlstmt varchar(1000 char);
nCount NUMBER;
BEGIN
SELECT count(*) into nCount FROM all_users where username = UPPER(user_name);
IF(nCount > 0)
THEN
  dbms_output.put_line('User already exists. If you are the user, then connect with your credentials and execute ALL_ACTIONS to see all availale actions.');
ELSE 
  INSERT INTO USER_ENTITY(USERNAME, FIRST_NAME, LAST_NAME ,EMAIL_ID, PASS_WORD, PHONE_NUMBER, TOURIST_ATTRACTION_ID, CITY_ID,DATE_JOINED ,DATE_OF_BIRTH) VALUES(UPPER(user_name),UPPER(first_name),UPPER(last_name), UPPER(email_id), pass_word , phone_number, tourist_attraction_id, city_id,CURRENT_DATE, date_of_birth);
  EXECUTE IMMEDIATE'CREATE USER '||user_name||' IDENTIFIED BY '||pass_word;
  EXECUTE IMMEDIATE'GRANT DB_CLIENT TO '||user_name;
  COMMIT;
  SELECT USER_ID INTO uid FROM user_entity WHERE USERNAME=UPPER(user_name);
  dbms_output.put_line(uid);
  EXECUTE IMMEDIATE 'GRANT EXECUTE ON ALL_ACTIONS TO '||user_name;
  dbms_output.put_line('all user actions granted');
  



COMMIT;
END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;
END SIGNUP;

/

GRANT EXECUTE ON HELP TO NEW_CLIENT;
GRANT EXECUTE ON SIGNUP TO NEW_CLIENT;

------------------------------------------------------------------------------------PACKAGES-----------------------------------------------------------------------------------------------

SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE REVIEWS_RATING
AS
PROCEDURE ADD_NEW_REVIEW(REVIEW_RATING NUMBER, REVIEW_DESC varchar,U_ID NUMBER);
PROCEDURE DELETE_EXISTING_REVIEW(R_ID NUMBER);
END REVIEWS_RATING;
/
CREATE OR REPLACE PACKAGE BODY REVIEWS_RATING
AS
PROCEDURE ADD_NEW_REVIEW(REVIEW_RATING NUMBER, REVIEW_DESC varchar, U_ID NUMBER)
AS
CID number;
BEGIN
dbms_output.put_line(USER);

select BOOKING_ID into CID from BOOKING where USER_ID=U_ID;
dbms_output.put_line(CID);
INSERT INTO REVIEWS(REVIEW_RATING,BOOKING_ID,REVIEW_DESC) VALUES(REVIEW_RATING,CID,REVIEW_DESC);
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        rollback;
        raise;
END ADD_NEW_REVIEW;

PROCEDURE DELETE_EXISTING_REVIEW(R_ID NUMBER)
AS
UID number;
BEGIN
--dbms_output.put_line(USER);
--select REVIEW_ID into UID from USER_REVIEWS where USER_ID=USER;
--dbms_output.put_line(UID);
DELETE FROM REVIEWS WHERE REVIEW_ID=R_ID;
COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line('Please provide the correct values according to the signature given in ALL_ACTIONS..Ensure that the address ID blongs to you');
        rollback;
        raise;
END DELETE_EXISTING_REVIEW;

END REVIEWS_RATING;
/



GRANT EXECUTE ON REVIEWS_RATING TO DB_CLIENT;
GRANT EXECUTE ON REVIEWS_RATING TO IRFAN;