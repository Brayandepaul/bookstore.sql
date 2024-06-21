create database if not exists BookStore;
 use BookStore;
drop table if exists Bill;
drop table if exists ShoppingCart;
drop table if exists ShoppingCartSession;
drop table if exists Book;
drop table if exists Author;
drop table if exists Payment;
drop table if exists Customer;
 
create table Customer (
customer_id int auto_increment,
user_name varchar(30),
pass_word varchar(150),
full_name varchar(50),
gender char(1),
birthdate date,
email_address varchar(150),
delv_address varchar(150),
delv_zipcode varchar(5),
phone_numbers varchar(60),
primary key ( customer_id )
);
 
create table Payment(
payment_id int auto_increment,
payment_card enum( 'DebitCard', 'CreditCard', 'BankAccount' ),
person_name varchar(100),
number_on_card varchar(20),
expire_date date,
phone_num varchar(60),
billing_add varchar(230),
number_acount varchar(20),
user_account enum( 'Checking', 'Saving' ),
bank_name varchar(100),
customer_id int,
primary key ( payment_id ),
foreign key ( customer_id ) references Customer( customer_id )
);
 
 create table Author (
author_id int auto_increment,
full_name varchar(100) not null,
primary key ( author_id )
);
 
create table Book (
book_id int auto_increment,
ISBN varchar(20),
title_book varchar(230),
author_id int,
yearPublisher varchar(50),
Price decimal(10,2),
bookSection varchar(20),
Inventory int,
primary key (book_id ),
foreign key ( author_id ) references Author ( author_id )
);
 
 
create table ShoppingCartSession (
shoppingCartSession_id int auto_increment,
customer_id int,
primary key ( shoppingCartSession_id ),
foreign key ( customer_id ) references Customer ( customer_id )
);
 
create table ShoppingCart (
cart_item_id int auto_increment,
shoppingcartsession_id int,
quantity int,
book_id int,
primary key (cart_item_id ),
foreign key ( shoppingcartsession_id )
   references shoppingCartSession ( shoppingCartSession_id ),
foreign key ( book_id ) references Book (book_id )
);
 
create table Bill (
bill_id int auto_increment,
total_cost decimal( 10, 2 ),
customer_id int,
shoppingCartSession_id int,
payment_id int,
primary key ( bill_id ),
foreign key ( shoppingCartSession_id )
   references ShoppingCartSession ( shoppingCartSession_id ),
foreign key ( customer_id ) references Customer ( customer_id ),
foreign key ( payment_id ) references Payment ( payment_id )
);
INSERT INTO Customer(
customer_id,user_name ,pass_word,full_name,gender,birthdate,email_address,delv_address,delv_zipcode,phone_numbers
)
values
(
1,'xxyAuthory','0808','Tom Hunks','M','1990-01-12','thunks@yahoo.com','1100 Grand Road, New York, NY 10001','10001','212-400-0001 (Home) 212-100-2222 (Cell)'
);
INSERT INTO Customer(
customer_id,user_name ,pass_word,full_name,gender,birthdate,email_address,delv_address,delv_zipcode,phone_numbers
)
values
(
2,'xZZZ','11223','Tom Cruise','M','1991-10-01','tcruise@yahoo.com','441 East Fordham Road, Bronx, NY 10458','10458','718-817-3333 (Cell)'
);
 
 INSERT INTO Customer(
customer_id,user_name ,pass_word,full_name,gender,birthdate,email_address,delv_address,delv_zipcode,phone_numbers
)
values
(
3,'abcde','xyz123','Tina Fei','F','1956-12-01','tfei11@yahoo.com','442 Fordham Road, Bronx, NY 10458','10458','817-718-0001 (Work), 212-100-2234 (Cell)'
);
 
INSERT INTO Customer(
customer_id,user_name ,pass_word,full_name,gender,birthdate,email_address,delv_address,delv_zipcode,phone_numbers
)
values
(
4,'iama','34ii','Rice Brown','F','1970-12-01','rbrown1999@hotmail.com','383 56th Street, New York, NY 10002','10002','212-0001-7788 (Cell)'
);
 
INSERT INTO Customer(
customer_id,
user_name ,
pass_word,
full_name,
gender,
birthdate,
email_address,
delv_address,
delv_zipcode,
phone_numbers
)
values
(
5,'lisaw','8877','Lisa Warren','F','1972-12-01','lisawarren@gmail.com','1 Fordham Road, Bronx, NY 10458','10458','212-300-1199 (Cell), 212-300-7777 (Home)'
);
 
 select * from Customer;
insert into Payment(
customer_id,payment_card,person_name,number_on_card,expire_date,phone_num,billing_add
)
values
(
1,'CreditCard','Tom Hunks','9999 9999 8888 8888','2017-08-01','214-400-0001','1100 Grand Road, New York, NY, 10001'
);
 
insert into Payment(
customer_id,payment_card,person_name,number_acount,user_account,bank_name
)
values
(
1,'BankAccount','Tom Hunks','1112223','Checking','Chase'
);
 
 
insert into Payment(
customer_id,payment_card,person_name,number_on_card,expire_date,phone_num,billing_add
)
values
(
2,'CreditCard','Tom Cruise','2222 4444 5555 6666','2014-12-01','718-817-3333','441 East Fordham Road, Bronx, NY, 10458'
);
 
 
insert into Payment(
customer_id,payment_card,person_name,number_on_card,expire_date,phone_num,billing_add
)
values
(
3,'DebitCard','Tina Fei','1234 1234 5678 5678','2018-10-01','817-718-0001','442 Fordham Road, Bronx, NY, 10458'
);
 
insert into Payment(
customer_id,payment_card,person_name,number_acount,user_account,bank_name
)
values
(
3,'BankAccount','Tom Fei','12667','Checking','Capital One'
);
 
insert into Payment(
customer_id,payment_card,person_name,number_on_card,expire_date,phone_num,billing_add
)
values
(
4,'CreditCard','Rice Brown','1122 3344 5566 7788','2016-01-01','212-0001-7788','38 56th Street, New York, NY, 10002'
);
  
insert into Payment(
customer_id,payment_card,person_name,number_on_card,expire_date,phone_num,billing_add
)
values
(
5,'CreditCard','Lisa Warren','1111 2222 3333 4444','2017-01-01','212-300-1199','1 Fordham Road, Bronx, NY, 10458'
);
 
insert into Payment(
customer_id,payment_card,person_name,number_acount,user_account,bank_name
)
values
(
5,'BankAccount','Lisa Warren','9922882','Checking','Chase'
);
 
select * from Payment;
 
insert into Author (
full_name )
values
( 'Ramez A. Elmasri and Shamkant Navathe' );
 
insert into Author (
full_name )
values
( 'Ian H. Witten, Eibe Frank, and Mark Hall' );
 
insert into Author (
full_name )
values
( 'Matt Florence' );
 
insert into Author (
full_name )
values
( ' Raghu Ramakrishnan and Johannes Gehrke' );
 
select * from Author;
 
insert into Book (
ISBN,title_book,author_id,yearPublisher,Price,bookSection,Inventory
)
values
( '0-8053-1755-4','Fundamentals of Database Systems, 3rd edition',1,'2000, Addison Wesley',100,'Sciences',20
);
 
insert into Book (
ISBN,title_book,author_id,yearPublisher,Price,bookSection,Inventory
)
values
('978-0-12-374856-0','Data Mining,Practical Machine Learning Tools and Techniques, 3rd',2,'2011, Elsevier',120,'Sciences',25
);
 
insert into Book (
ISBN,title_book,author_id,yearPublisher,Price,bookSection,Inventory
)
values
( '0-1153-2555-5','Writing Skills',3,'2010, Addison Wesley',30,'Arts',10
);
 
insert into Book (
ISBN,title_book,author_id,yearPublisher,Price,bookSection,Inventory
)
values
( '978-0-07-246563-1','Database Management Systems, 3rd edition',4,'2003, McGraw-Hill',110,'Sciences',15
);
 
select * from book;
 
insert into ShoppingCartSession ( customer_id ) values ( 1 );
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 1,1,2
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 1,2,4
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 1,1,3
);
insert into ShoppingCartSession ( customer_id ) values ( 2 );
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 2,1,2
);
 
insert into ShoppingCart (
shoppingcartsession_id,
quantity,
book_id
)
values
( 2,1,4
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 2,1,3
);
 
insert into ShoppingCartSession ( customer_id ) values ( 3 );

insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 3,1,2
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 3,1,4
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 3,1,3
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 3,1,1
);
 
insert into ShoppingCartSession ( customer_id ) values ( 4 );
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 4,1,2
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 4,1,4
);
 
insert into ShoppingCart (
shoppingcartsession_id,
quantity,
book_id
)
values
( 4,1,3
);
 
insert into ShoppingCart (
shoppingcartsession_id,quantity,book_id
)
values
( 4,2,1
);


  
select * from ShoppingCartSession;
 
select * from ShoppingCart;
 
select scs.customer_id,
sum( b.price * sc.quantity ) totalPurchase     
from ShoppingCart sc
join Book b
on sc.book_id = b.book_id
join ShoppingCartSession scs
on sc.shoppingCartSession_id = scs.shoppingCartSession_id
group by scs.customer_id
order by scs.customer_id;
 
insert into Bill
( Total_cost,customer_id,shoppingCartSession_id,payment_id
)
values
( 370.00,1,1,2
);
 
insert into Bill
( Total_cost,customer_id,shoppingCartSession_id,payment_id
)
values
( 260.00,2,2,3
);
 
insert into Bill
( Total_cost,customer_id,shoppingCartSession_id,payment_id
)
values
( 360.00,3,3,4
);
 
insert into Bill
( Total_cost,customer_id,shoppingCartSession_id,payment_id
)
values
( 460.00,4,4,6
);
Select full_name
FROM Customer
LEFT JOIN ShoppingCartSession ON Customer.customer_id =ShoppingCartSession.customer_id
WHERE ShoppingCartSession.ShoppingCartSession_id IS NULL;
 
  Select c.full_name
   From Customer c
   Left join shoppingCartSession scs   
   On c.customer_id = scs.customer_id
   Where Scs.customer_id is null;
 
SELECT DISTINCT full_name
FROM Customer
JOIN ShoppingCartSession on Customer.customer_id = ShoppingCartSession.customer_id
JOIN ShoppingCart ON ShoppingCartSession. ShoppingCartSession_id = ShoppingCart. ShoppingCartSession_id
JOIN Book ON ShoppingCart.book_id = Book.book_id
WHERE Book.title_book = 'Writing Skills';
 
select distinct
  c.full_name
   from book b
  JOIN shoppingCart sc
  on b.book_id = sc.book_id
  JOIN shoppingCartSession scs
  on sc.ShoppingCartSession_id = scs.ShoppingCartSession_id
  JOIN Customer c
  on scs.Customer_id = c.Customer_id
  where b.title_book = 'Writing Skills';
     
SELECT full_name
FROM Customer
JOIN shoppingCart ON Customer.customer_id = ShoppingCart.customer_id
GROUP BY Customer.customer_id, full_name
HAVING COUNT(DISTINCT ShoppingCart.book_id) > 2;
 
select c.full_name,
count(*) NumberOfBooks
from shoppingCart sc
join ShoppingCartSession scs
on sc.ShoppingCartSession_id = scs.ShoppingCartSession_id
join Customer c
on scs.Customer_id = c.Customer_id
group by scs.customer_id having
count( distinct sc.book_id ) > 2;
 
SELECT title_book, SUM(quantity) AS copies_sold
FROM Book
JOIN ShoppingCart ON Book.book_id = ShoppingCart.book_id
GROUP BY title_book
ORDER BY copies_sold DESC
LIMIT 1;
 
select sc.Book_id, b.title_book,
sum( sc.quantity ) TotalSold
from shoppingCart sc
join Book b
on sc.book_id = b.book_id
group by sc.Book_id, b.title_book
order by sum( sc.quantity ) desc
limit 1;

SELECT title_book, SUM(quantity) AS copies_sold
FROM Book
JOIN ShoppingCart ON Book.book_id = ShoppingCart.book_id
JOIN ShoppingCartSession on ShoppingCart.ShoppingCartSession_id = ShoppingCartSession. ShoppingCartSession_id
JOIN Customer ON ShoppingCartSession.customer_id = Customer.customer_id
WHERE Customer.gender = 'F'
GROUP BY title_book
ORDER BY copies_sold DESC
LIMIT 1;
 
select sc.Book_id, b.title_book,
      sum( sc.quantity ) TotalSold
   from shoppingCart sc
	join Book b
	on sc.book_id = b.book_id
	join shoppingCartSession scs
	on sc.shoppingCartSession_id = scs.shoppingCartSession_id
	join Customer c
	on scs.customer_id = c.customer_id
	AND c.gender = 'F'
   group by sc.Book_id,
   b.title_book
   order by sum( sc.quantity ) desc
   limit 1;
 
 
SELECT COUNT(DISTINCT customer_id) AS customer_using_credit_card
FROM Payment
WHERE payment_card = 'CreditCard';
 
select count(*) PayingByCreditCard
   from bill b
   join payment p
	on b.payment_id = p.payment_id
	and p.payment_card = 'CreditCard';
                               
SELECT SUBSTRING_INDEX(delv_address, ' ', -1) AS zip_code,
	COUNT(*) AS customer_count
	FROM Customer
    GROUP BY zip_code
    ORDER BY customer_count DESC
	LIMIT 1;
 
select c.delv_zipcode,
count(*) CustomersPerZIP
from Customer c
group by c.delv_zipcode
order by count(*) desc
limit 1;

SELECT full_name, MAX(total_cost) AS highest_purchase
FROM Customer
JOIN Bill ON Customer.customer_id = Bill.customer_id
GROUP BY full_name
ORDER BY highest_purchase DESC
LIMIT 1;
 
select b.Total_cost,c.full_name
from Bill b
join customer c
on b.customer_id = c.customer_id
order by b.total_cost desc
   limit 1
 