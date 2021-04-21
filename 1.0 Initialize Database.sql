alter session set "_ORACLE_SCRIPT"=true;  
SET SERVEROUTPUT ON;
DECLARE
nCount NUMBER;
BEGIN
SELECT count(*) into nCount FROM user_tables where table_name = 'USER_ENTITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE USER_ENTITY ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE USER_ENTITY (
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
)';    

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'COUNTRY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE COUNTRY ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE COUNTRY (
COUNTRY_ID NUMBER primary key, 
COUNTRY_NAME VARCHAR(20) NOT NULL
)';    

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'STATES';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('TABLE STATES ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE STATES (
STATE_ID NUMBER primary key, 
STATE_NAME VARCHAR(20) NOT NULL,
COUNTRY NUMBER REFERENCES COUNTRY(COUNTRY_id)
)';    

END IF;


EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line(dbms_utility.format_error_backtrace);
            dbms_output.put_line(SQLERRM);
            ROLLBACK;
            RAISE;
COMMIT;
END;

