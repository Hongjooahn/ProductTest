create table product(
id int(40) primary key AUTO_INCREMENT,
title varchar(40) not null,
ex varchar(400),
price int(20)
)

insert into product values(default,'hello','this pro is veryvery good',100);