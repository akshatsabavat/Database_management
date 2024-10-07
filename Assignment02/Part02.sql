-- Assignment 02

-- PART 02
-- Add new customers
select customers.customer_name, customers.email from customers left join reviews on customers.customer_id = reviews.customer_id where reviews.review_id is NULL;
select bookings.booking_id, customers.customer_name, hotels.hotel_name, bookings.total_cost from customers join bookings on customers.customer_id = bookings.customer_id join hotels on bookings.hotel_id = hotels.hotel_id where bookings.check_in between '2024-03-01' and '2024-06-30' order by customers.customer_id;
-- select customers.customer_name, hotels.hotel_name, DATEDIFF(bookings.check_out, bookings.check_in) as nights_stayed_at_hotel from customers join bookings on customers.customer_id = bookings.booking_id join hotels on bookings.booking_id = hotels.hotel_id order by nights_stayed_at_hotel DESC LIMIT 3;
select customer_name, COUNT(*) as total_bookings from customers join bookings on bookings.customer_id = customers.customer_id GROUP BY customers.customer_id HAVING total_bookings > 1;