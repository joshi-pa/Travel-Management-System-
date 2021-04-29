-----2 ADD REVIEW

begin
ADMIN.REVIEWS_RATING.ADD_NEW_REVIEW(3,'GOOD HOTEL AND AWESOME SERVICES BY THE STAFF',1);
end;


begin
ADMIN.REVIEWS_RATING.ADD_NEW_REVIEW(5,'Pleasant stay at hotel and had a wonderful time at the resort.',1);
end;


----------- 3 DELETE REVIEW

BEGIN
ADMIN.reviews_rating.delete_existing_review(4);
END;


BEGIN
ADMIN.reviews_rating.delete_existing_review(4);
END;