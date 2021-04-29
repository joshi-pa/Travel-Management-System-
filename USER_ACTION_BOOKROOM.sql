--dbms_output.put_line('------------- BOOK A ROOM -----------'); USER_ACTION_BOOKROOM
 
 ---- dbms_output.put_line('1. SEARCH AVAILABLE ROOMS  ');--SHIVANI
SELECT h.* , r.room_id, rt.*  FROM ADMIN.hotel h
INNER JOIN ADMIN.room r ON r.hotel_id = h.hotel_id
INNER JOIN ADMIN.room_type rt ON r.room_type_id = rt.room_type_id
WHERE r.room_id NOT IN (SELECT room_booked_id FROM ADMIN.room_booked_entity);

-----3. VIEW BOOKING AND PAYMENT STATUS----------------
 SELECT B.BOOKING_ID, B.USER_ID, B.TOTAL_ROOMS_BOOKED, B.TOTAL_AMOUNT,B.PAYMENT_ID, BS.BOOKING_STATUS
FROM BOOKING B
JOIN PAYMENT P ON B.PAYMENT_ID = P.PAYMENT_ID
JOIN PAYMENT_TYPE PT ON p.payment_type_id= pt.payment_type_id
JOIN BOOKING_STATUS BS ON B.BOOKING_STATUS_ID= bs.booking_status_id;


