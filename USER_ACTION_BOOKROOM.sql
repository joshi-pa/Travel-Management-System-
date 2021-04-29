-------- 1. SEARCH AVAILABLE ROOMS
SELECT h.* , r.room_id, rt.*  FROM ADMIN.hotel h
INNER JOIN ADMIN.room r ON r.hotel_id = h.hotel_id
INNER JOIN ADMIN.room_type rt ON r.room_type_id = rt.room_type_id
WHERE r.room_id NOT IN (SELECT room_booked_id FROM ADMIN.room_booked_entity);


----------------- BOOK A ROOM
BEGIN
ADMIN.BOOK_HOTEL('29-APR-2021', 2, '05-MAY-2021','10-MAY-2021',1005,300,789,1, 1,1,101);
END;


BEGIN
ADMIN.BOOK_HOTEL('29-APR-2021', 1, '11-MAY-2021','13-MAY-2021',1006,302,741,1, 1,2,110);
END;



-----3. VIEW BOOKING AND PAYMENT STATUS----------------
 SELECT B.BOOKING_ID, B.USER_ID, B.TOTAL_ROOMS_BOOKED, B.TOTAL_AMOUNT,B.PAYMENT_ID, BS.BOOKING_STATUS
FROM admin.BOOKING B
JOIN admin.PAYMENT P ON B.PAYMENT_ID = P.PAYMENT_ID
JOIN admin.PAYMENT_TYPE PT ON p.payment_type_id= pt.payment_type_id
JOIN admin.BOOKING_STATUS BS ON B.BOOKING_STATUS_ID= bs.booking_status_id;


