create database TicketBookingSystem;
use TicketBookingSystem;
create table venue(
venue_id int primary key,
venue_name varchar(30),
address varchar(50)
);
insert into venue values(101,'Auditorium','Dindigul'),
(102,'raja mahal','Trichy'),
(103,'rani palace','Coimbatore'),
(104,'open auditorium','Chennai'),
(105,'devi complex','Bangalore'),
(106,'priya theatre','Erode'),
(107,'kannan bazaar','Karur'),
(108,'kanmani college','Madurai'),
(109,'mathi theatre','Mumbai'),
(110,'dharshini bazaar','Gujarat');


Create table event (
    event_id int primary key,
    event_name varchar(50),
    event_date DATE,
    event_time TIME,
    venue_id int,
    total_seats int,
    available_seats int,
    ticket_price decimal,
    event_type varchar(20), 
    booking_id int,
    Foreign key (venue_id) references venue(venue_id)

);

insert into event values(1,'Beats concert','2024-04-02','05:00',101,1000,700,2000.0,'Concert',500),
(2,'summer concert','2024-04-03','05:30',101,2000,800,3000.0,'Concert',600),
(3,'harmony concert','2024-04-04','06:00',102,3000,900,4000.0,'Concert',700),
(4,'world_cup match','2024-04-05','06:30',103,4000,1000,5000.0,'Sports',800),
(5,'cricket world cup','2024-04-06','07:00',103,5000,1100,6000.0,'Sports',800),
(6,'kabaddi','2024-04-07','07:30',104,6000,1200,7000.0,'Sports',900),
(7,'Harry potter','2024-04-08','08:00',105,7000,1300,8000.0,'Movie',900),
(8,'Joe','2024-04-09','08:30',105,7500,1500,9000.0,'Movie',500),
(9,'Life_of_pi','2024-04-10','09:00',105,8000,1600,9500.0,'Movie',700),
(10,'Jurassic_Park','2024-04-11','09:30',106,9000,2000,10000.0,'Movie',600);


Create table customer (
    customer_id int primary key,
    customer_name varchar(50),
    email varchar(50),
    phone_number varchar(15), 
    booking_id int
   
);
insert into customer values(201,'kavi','kavi@gmail.com','9038606367',200),
(202,'diya','diya@gmail.com','9898606367',200),
(203,'nithya','nithya@gmail.com','8768608000',300),
(204,'deva','deva@gmail.com','9038456792',400),
(205,'sowmiya','sowmiya@gmail.com','8745632907',100),
(206,'vino','vino@gmail.com','7576975000',500),
(207,'divya','divya@gmail.com','9875623417',300),
(208,'siva','siva@gmail.com','9465787843',500),
(209,'pravin','pravin@gmail.com','9067854325',600),
(210,'bagavathi','bagavathi@gmail.com','9987656788',700);

Create table booking (
    booking_id int primary key,
    customer_id int,
    event_id int,
    num_tickets int,
    total_cost int, 
    booking_date DATE,
    Foreign key (customer_id) references customer(customer_id),
    Foreign key (event_id) references event(event_id)
);

insert into booking values(100,201,1,50,100000,'2024-05-12'),
(200,201,1,60,180000,'2024-05-13'),
(300,202,2,70,280000,'2024-05-14'),
(400,209,1,80,400000,'2024-05-15'),
(500,210,3,30,180000,'2024-05-16'),
(600,203,4,20,140000,'2024-05-17'),
(700,203,5,90,720000,'2024-05-18'),
(800,206,6,40,360000,'2024-05-19'),
(900,207,6,100,950000,'2024-05-20'),
(1000,208,8,10,100000,'2024-05-21');
alter table event add constraint eve foreign key(booking_id) references booking(booking_id);
alter table customer add constraint cus foreign key(booking_id) references booking(booking_id);



