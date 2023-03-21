#######Stored Procedure #### 

AddBooking-----

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(booking_date date,tableno int ,customer_id int )
BEGIN

declare l_msg varchar(50);

insert into bookings(date,tablenumber,customerid) values (booking_date,tableno,customer_id);

SELECT 'New Booking Added' AS Confirmation;



END

---------------------------------------

#########Update Booking

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(booking_id int,booking_date date)
BEGIN


update bookings set
bookingid=booking_id,
date=booking_date
where bookingid=booking_id;

SELECT 'Booking Updated'+ tableno from bookings  where bookingid=booking_id   ;

END

------------------------------------------------

##############Cancel Order

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(orderid_in int)
begin

delete from orders where orderid =orderid_in;

END


--------------------------------------------------------------------

#####################ManageBooking --------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(booking_date date, tableno int)
BEGIN
DECLARE rollback_flag BOOL DEFAULT 0;
    DECLARE record_count INT;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET rollback_flag = 1;
    SELECT COUNT(*) INTO record_count FROM bookings WHERE date = booking_date and tablenumber=tableno;
    START TRANSACTION;

    if record_count>0 then 
    
    ROLLBACK;
    
    select 'Table Aready Booked' as Status_Message;
    ELSE
    INSERT INTO BOOKINGS (date, tablenumber) VALUES (booking_date, tableno);
        IF rollback_flag THEN
            ROLLBACK;
            SELECT 'Insert failed, transaction rolled back.' as Status_Message;
        ELSE
            COMMIT;
            SELECT 'Insert successful, transaction committed.' as Status_Message;
        END IF;
    END IF;
    
END

---------------------------------------------------------------------------------------------------