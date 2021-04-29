-- admin actions


-- number of rooms booked by users based on roomskbooked table (History) 

SELECT
    rb.booking_id,
    ue.first_name || ' ' ||
    ue.last_name as name,
    h.hotel_name,h.address,
    c.city_name,
    COUNT(rb.booking_id) AS no_of_roomsbooked
FROM
         room_booked_entity rb
    JOIN booking      b ON rb.booking_id = b.booking_id
    JOIN user_entity  ue ON b.user_id = ue.user_id
    JOIN hotel        h ON b.hotel_id = h.hotel_id
    JOIN CITY c ON h.city_id = c.city_id 
GROUP BY
    rb.booking_id,
    ue.first_name,
    ue.last_name,
    h.address,
    h.hotel_name,
    c.city_name
ORDER BY
    rb.booking_id;

begin
admin.Add_HOTEL('Marriot',5,400,501,7898989898,'11 AM', '12 PM', 'NEW YORK CITY');
End;

begin
admin.ADD_ROOM(101,306);
End;

