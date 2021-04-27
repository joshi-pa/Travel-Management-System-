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
    PAYMENT_ID        NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY ,
    PAYMENT_TYPE_ID  REFERENCES PAYMENT_TYPE(payment_type_id) ON DELETE CASCADE)';    
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT (
    PAYMENT_ID        NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY ,
    PAYMENT_TYPE_ID  REFERENCES PAYMENT_TYPE(payment_type_id) ON DELETE CASCADE)';    
END IF;



SELECT count(*) into nCount FROM user_tables where table_name = 'USER_ENTITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE USER_ENTITY ALREADY EXISTS. THUS DROPPING CURRENT AND CREATING NEW!');
    execute immediate 'drop table USER_ENTITY CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'CREATE TABLE USER_ENTITY (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY,
    first_name VARCHAR(12) NOT NULL,
    last_name VARCHAR(12) NOT NULL,
    email_id VARCHAR(31) unique NOT NULL,
    PASS_WORD VARCHAR(20) NOT NULL,
    phone_number NUMBER,
    tourist_attraction_id NUMBER ,
    city_id NUMBER NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_of_birth DATE NOT NULL)';
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE USER_ENTITY (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 2000000) PRIMARY KEY,
    first_name VARCHAR(12) NOT NULL,
    last_name VARCHAR(12) NOT NULL,
    email_id VARCHAR(31) unique NOT NULL,
    PASS_WORD VARCHAR(20) NOT NULL,
    phone_number NUMBER,
    tourist_attraction_id NUMBER ,
    city_id NUMBER NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_of_birth DATE NOT NULL)';    

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
