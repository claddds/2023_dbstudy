create table card(
   customerId varchar(4000),
   amount varchar(4000)
);
create table ticket(
   customerId varchar(4000),
   countnum varchar(4000) check(countnum <5) 
);

SELECT * FROM card;
SELECT * FROM ticket;
