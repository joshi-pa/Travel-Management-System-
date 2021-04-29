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
         admin.room_booked_entity rb
    JOIN admin.booking      b ON rb.booking_id = b.booking_id
    JOIN admin.user_entity  ue ON b.user_id = ue.user_id
    JOIN admin.hotel        h ON b.hotel_id = h.hotel_id
    JOIN admin.CITY c ON h.city_id = c.city_id 
GROUP BY
    rb.booking_id,
    ue.first_name,
    ue.last_name,
    h.address,
    h.hotel_name,
    c.city_name
ORDER BY
    rb.booking_id;

-- detailed booking history with room numbers 
    
SELECT
    rb.booking_id,
    ue.first_name || ' ' ||
    ue.last_name as name,
    h.hotel_name,h.address,
    c.city_name,
    rb.room_id As room_number
FROM
         admin.room_booked_entity rb
    JOIN admin.booking      b ON rb.booking_id = b.booking_id
    JOIN admin.user_entity  ue ON b.user_id = ue.user_id
    JOIN admin.hotel        h ON b.hotel_id = h.hotel_id
    JOIN admin.CITY c ON h.city_id = c.city_id
ORDER BY
    rb.booking_id;    

-- adding hotels

begin
admin.Add_HOTEL('Marriot',5,400,501,7898989898,'11 AM', '12 PM', 'NEW YORK CITY');
End;


begin
admin.Add_HOTEL('Holiday Inn',5,400,500,7898989898,'11 AM', '12 PM', 'NEW YORK CITY');
End;

-- adding rooms
-- adding 2 single rooms 
begin
admin.ADD_ROOM(100,306);
End;

begin
admin.ADD_ROOM(100,306);
End;
--- adding a luxury suite in hotel
begin
admin.ADD_ROOM(103,306);
End;
