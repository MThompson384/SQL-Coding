drop database if exists Airport_KLX;
Create database Airport_KLX;
Use Airport_KLX;

Create table terminal (
	Terminalid char(1) not null,
	NumberOfGates int not null,
	Primary key(Terminalid));
 
    
   Create table airline(
	Airlineid varchar(3) not null,
	AirlineName varchar(15),
    Terminalid char(1) not null,
	Primary key(Airlineid),
	Foreign key(Terminalid) references terminal(Terminalid));
    
	Create table departure(
	Date date not null,
	Airlineid varchar(3) not null,
    NumberOfDepartingFlights int not null,
	Primary key(Date,Airlineid),
	Foreign key(Airlineid) references airline(Airlineid));


insert into terminal values ('A','20');
insert into terminal values ('B','15');
insert into terminal values ('C','15');

insert into airline values ('UA','United','A');
insert into airline values ('NW','Northwest','A');
insert into airline values ('AA','American','A');
insert into airline values ('DL','Delta','B');
insert into airline values ('JB','Jet Blue','B');
insert into airline values ('SWA','Southwest','C');

insert into departure values
('2021-12-11', 'UA', '34'),
('2021-12-11', 'NW', '17'),
('2021-12-11', 'AA', '11'),
('2021-12-11', 'DL', '20'),
('2021-12-11', 'JB', '6'),
('2021-12-12', 'UA', '29'),
('2021-12-12', 'DL', '20'),
('2021-12-12', 'SWA', '17');

-- 1. Provide a list of airlines and the terminals where they operate. Do not repeat values.--
select distinct airlinename, terminalid
from airline;

-- 2. List the total nuber of departures rfor terminal A by airline, in ascending alphabetical order.--
select airlinename, sum(numberofdepartingflights)
from airline a, departure d
where a.airlineid = d.airlineid and a.terminalid ='A'
group by a.airlinename;

-- 3. Indicate the number of departures for United Airlines on December 12th.--
select numberofdepartingflights
from departure
where airlineid = 'UA' and date = '2021-12-12';

-- 4. Show all the contents for the departures table. --
select *
from departure;

-- Extra Example: Show the terminal where the airline with the largest average number of departures operates.--
select avg(numberofdepartingflights) as avg_value, terminal D
from departure d, airline a
where d.airlineid = a.airlineid
group by d.airlineid
order by avg_value desc
limit 1;

-- With this option it is limiting if their is a tye for the top average--

-- Nested queries, example --
select a.airlineid
from airline a, terminal t
where a.terminalid = t.terminalid
and t.numberofgates =20;

-- Or--

select airlineid
from airline 
where terminalid = (select terminalid 
from terminal where numberofgates =20);

-- Nested queries, 5. Show the number of gates of the terminal that has the most departing flights on record? --
select numberofgates from terminal where terminalid =
(select terminalid from airline where airlineid=
(select airlineid from departure
where numberofdepartingflights =
(select max(numberofdepartingflights) from departure)));

-- Nested queries, 6. Show the airlines that have a number of departing flights greater than the average for all airlines? --
select airlinename from airline where airlineid in
(select airlineid from departure where numberofdepartingflights >
(select avg(numberofdepartingflights) from departure));