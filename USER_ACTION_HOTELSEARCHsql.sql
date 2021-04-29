--1 searching all hotels

select H.HOTEL_ID, H.HOTEL_NAME, H.STAR_RATING, H.HOTEL_CHAIN_ID, C.CITY_NAME, H.ADDRESS, H.CHECK_IN_TIME, H.CHECK_OUT_TIME, H.CONTACT_NO
from ADMIN.hotel H LEFT JOIN ADMIN.CITY C ON H.CITY_ID = C.CITY_ID
order by h.hotel_id; 

--2 searching hotels on the basis of tourist_attraction_name 

SELECT t.tourist_attraction_name , c.city_name, h.* FROM ADMIN.tourist_attractions t
INNER JOIN ADMIN.city c ON t.city_id = c.city_id
INNER JOIN ADMIN.hotel h ON c.city_id = h.city_id
WHERE t.tourist_attraction_name = 'Marine Drive';



------------3 
SELECT * FROM ADMIN.HOTEL WHERE CITY_ID = (SELECT CITY_ID FROM ADMIN.USER_ENTITY WHERE USERNAME = 'SACHIN');




-----------------------4

SELECT H.HOTEL_ID, H.HOTEL_NAME,H.STAR_RATING, HC.HOTEL_CHAIN_NAME, H.ADDRESS, H.CHECK_IN_TIME, H.CHECK_OUT_TIME, UR.REVIEW_RATING
FROM admin.HOTEL H LEFT JOIN admin.USER_REVIEWS UR ON H.HOTEL_ID = UR.HOTEL_ID
JOIN admin.HOTEL_CHAIN HC ON H.HOTEL_CHAIN_ID = hc.hotel_chain_id
ORDER BY UR.REVIEW_RATING ;



-- 5
SELECT h.hotel_id, h.hotel_name, h.star_rating, h.hotel_chain_id, h.contact_no, h.city_id, h.check_out_time, h.check_in_time, h.address FROM HOTEL h
ORDER BY star_rating;