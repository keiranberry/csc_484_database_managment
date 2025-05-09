use dreamhome;

-- task 1
delimiter $$

create trigger checkMaxRent
before update on dreamhome.client
for each row
begin
    if new.maxrent < 100 then
        set new.maxrent = 100;
    end if;
end$$

delimiter ;

-- task 2
update client
set maxrent = 450
where clientno = 'CR56';

select * from client;

update client
set maxrent = 85
where clientno = 'CR56';

select * from client; 

-- task 3
delimiter $$

create trigger checkMaxRentBeforeInsert
before insert on dreamhome.client
for each row
begin
    if new.maxrent < 100 then
        signal sqlstate '45000' -- throw a custom exception
            set message_text = 'maxrent must be at least $100';
    end if;
end$$

delimiter ;

-- task 4
insert into dreamhome.client (clientno, fname, lname, telno, preftype, maxrent, email)
values ('CR01', 'keiran', 'berry', '012-345-6789', 'House', 450, 'keiranberry@gmail.com');

select * from client;

insert into dreamhome.client (clientno, fname, lname, telno, preftype, maxrent, email)
values ('CR02', 'john', 'smith', '123-456-7890', 'Flat', 85, 'john.smith@email.com');

-- task 5
create table dreamhome.deletedClients (
    id int auto_increment primary key,
    clientNo varchar(10),
    deletedAt timestamp default current_timestamp
);

delimiter $$

create trigger logDeletion
after delete on dreamhome.client
for each row
begin
    insert into dreamhome.deletedClients (clientno)
    values (old.clientno);
end$$

delimiter ;

delete from client
where clientno = 'CR01';

select * from deletedClients;