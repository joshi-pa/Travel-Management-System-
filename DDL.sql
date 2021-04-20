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
CREATE TABLE USER_ENTITY(
  user_id number PRIMARY KEY ,
  first_name VARCHAR(12) NOT NULL,
  last_name VARCHAR(12) NOT NULL,
  email_id VARCHAR(31) NOT NULL,
  password VARCHAR(20) NOT NULL,
  phone_number number NOT NULL,
  tourist_attraction_id number NULL,
   date_joined DATE NOT NULL,
   date_of_birth DATE NULL,
   city_id REFERENCES CITY(city_id)
   );


CREATE TABLE CITY (
  city_id INT  PRIMARY KEY,
  city_name VARCHAR(20) NOT NULL,
   state_id INT REFERENCES STATES(state_id)
   );
 
 CREATE TABLE HOTEL (
  hotel_id INT PRIMARY KEY,
  hotel_name VARCHAR(20) NOT NULL,
  hotel_contact_no number(10) NOT NULL,
   hotel_address VARCHAR(100) NOT NULL,
   star_rating number(10) NOT NULL,
  check_in_time TIMESTAMP NOT NULL,
  check_out_time TIMESTAMP NOT NULL,
  city_id number REFERENCES CITY(city_id),
  hotel_chain_id number REFERENCES HOTEL_CHAIN(hotel_chain_id)
  );

--     
     
CREATE TABLE BOOKING_STATUS (
  booking_status_id INT PRIMARY KEY,
  booking_staus VARCHAR(20) NOT NULL
); 



CREATE TABLE PAYMENT_TYPE(
  payment_type_id INT PRIMARY KEY,
  payment_type_desc VARCHAR(20) NOT NULL
 );
 

CREATE TABLE PAYMENT(
  payment_id INT PRIMARY KEY,
  payment_type_id INT REFERENCES PAYMENT_TYPE(payment_type_id)
);



CREATE TABLE ROOM_TYPE (
  room_type_id INT PRIMARY KEY,
  room_type_desc VARCHAR(20) NOT NULL,
  room_occupancy INT NOT NULL,
  cost_per_day INT NOT NULL,
  smoke_friendly INT NULL,
  pet_friendly INT NULL
  );
  
  
  CREATE TABLE ROOMS (
  room_id INT PRIMARY KEY,
  room_number INT NULL,
  rroom_type_id INT REFERENCES ROOM_TYPE(room_type_id),
  hotel_id INT REFERENCES HOTEL(hotel_id)
 );
 
 CREATE TABLE ROOMS_BOOKED(
  room_booked_id INT PRIMARY KEY,
 booking_id INT REFERENCES BOOKINGS(booking_id)
 );


CREATE TABLE TOURIST_ATTRACTIONS (
  tourist_attraction_id INT PRIMARY KEY,
  tourist_attraction_name varchar(100) NOT NULL,
  city_id INT REFERENCES CITY(city_id)
  );


  