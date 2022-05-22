#8) Display customer name and gender whose names start or end with character 'A'
select CUS_NAME, CUS_GENDER from CUSTOMER
WHERE (cus_name like 'A%' or cus_name like '%A') ;
#******************************

#3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select * from `order` where ORD_AMOUNT > 3000;
select count(CUS_GENDER) from customer group by cus_gender; 



#******************************

#4) Display all the orders along with product name ordered by a customer having Customer_Id=2
select cus_name, pro_name, ord_id, ord_date, ord_amount from customer as c, product p, supplier_pricing as sp, 
`order` as o 
where c.cus_id = '2'
and c.cus_id = o.cus_id
and p.pro_id = sp.pro_id
and o.pricing_id = sp.pricing_id;
#***************************************

#5) Display the Supplier details who can supply more than one product.

select * from product;
select sup.SUPP_ID, SUPP_NAME, SUPP_NAME from supplier as sup 
inner join 
(
select * from supplier_pricing group by supp_id 
having count(supp_id) > 1 )
as sp 
on sup.supp_id = sp.SUPP_ID; 
#*********************************

#6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product


#***************************
#7) Display the Id and Name of the Product ordered after “2021-10-05”.
select prod.pro_id, prod.pro_name from product as prod
inner join 
(
select pro_id, sp.PRICING_ID from supplier_pricing as sp
inner join 
(
select PRICING_ID  from `order` where ord_date > "2021-10-05") as ord 
on sp.pricing_id = ord.PRICING_ID 
) as sp_ord 
on prod.pro_id = sp_ord.PRO_ID
;
#****************************************
#9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent 
#Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.

call displaySupplierDetails();
 
 