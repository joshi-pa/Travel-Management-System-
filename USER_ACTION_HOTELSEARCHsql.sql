--1 searching all hotels

select * from hotel; 

--2 searching hotels on the basis of tourist_attraction_name 

 SELECT  c.city_name, h.* FROM tourist_attractions t
INNER JOIN city c ON t.city_id = c.city_id
INNER JOIN hotel h ON c.city_id = h.city_id
where t.tourist_attraction_name ='Marine Drive'; 


------------3 
SELECT * FROM ADMIN.HOTEL WHERE CITY_ID = (SELECT CITY_ID FROM ADMIN.USER_ENTITY WHERE USERNAME = 'SACHIN');




-----------------------4

SELECT H.HOTEL_ID, H.HOTEL_NAME,H.STAR_RATING, HC.HOTEL_CHAIN_NAME, H.ADDRESS, H.CHECK_IN_TIME, H.CHECK_OUT_TIME, UR.REVIEW_RATING
FROM HOTEL H LEFT JOIN USER_REVIEWS UR ON H.HOTEL_ID = UR.HOTEL_ID
JOIN HOTEL_CHAIN HC ON H.HOTEL_CHAIN_ID = hc.hotel_chain_id
ORDER BY UR.REVIEW_RATING ;



-- 5
SELECT * FROM HOTEL
ORDER BY star_rating;




