--dbms_output.put_line('------------- BOOK A ROOM -----------'); USER_ACTION_BOOKROOM
 
 ---- dbms_output.put_line('1. SEARCH AVAILABLE ROOMS  ');--SHIVANI
SELECT h.* , r.room_id, rt.*  FROM ADMIN.hotel h
INNER JOIN ADMIN.room r ON r.hotel_id = h.hotel_id
INNER JOIN ADMIN.room_type rt ON r.room_type_id = rt.room_type_id
WHERE r.room_id NOT IN (SELECT room_booked_id FROM ADMIN.room_booked_entity);


