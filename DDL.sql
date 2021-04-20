DROP TABLE USER_ENTITY;

CREATE TABLE USER_ENTITY (
user_id NUMBER  PRIMARY KEY,
first_name VARCHAR(12) NOT NULL,
last_name VARCHAR(12) NOT NULL,
email_id VARCHAR(31) NOT NULL,
password1 VARCHAR(20) NOT NULL,
phone_number NUMBER,
tourist_attraction_id NUMBER ,
city_id NUMBER NOT NULL,
date_joined DATE NOT NULL,
date_of_birth DATE NOT NULL
);

CREATE TABLE HOTEL_CHAIN (
hotel_chain_id INT NOT NULL primary key,
hotel_chain_name VARCHAR(50) NOT NULL
);

CREATE SEQUENCE COUNTRY_NUM
MINVALUE 1
MAXVALUE 9999
START WITH 1
INCREMENT BY 1;



CREATE TABLE COUNTRY (
COUNTRY_ID NUMBER primary key, 
COUNTRY_NAME VARCHAR(20) NOT NULL
);

--SELECT * FROM user_entity;

CREATE TABLE STATES (
STATE_ID NUMBER primary key, 
STATE_NAME VARCHAR(20) NOT NULL,
COUNTRY NUMBER REFERENCES COUNTRY(COUNTRY_id)
);


drop table states;
--
--ALTER TABLE STATE rename to states;
--select * from states;
