
drop database movieBooking;
create database movieBooking;
use movieBooking;

create table location(
locationId int auto_increment primary key,
location varchar(255) not null unique
);

create table theater(
theaterId int auto_increment primary key,
locationId int not null,
theaterName varchar(255) not null,
address varchar(255) not null,
foreign key (locationId) references location(locationId)
);

create table screen(
screenId int auto_increment primary key,
theaterId int not null,
screenName varchar(255) not null,
totalNumberOfSeats varchar(255) not null,
foreign key (theaterId) references theater(theaterId)
);


create table timing(
timingId int auto_increment primary key,
screenId int not null,
showStartTime  varchar(255) not null,
foreign key (screenId) references screen(screenId)
);

create table movie(
movieId int auto_increment primary key,
movieName  varchar(255) not null unique,
moviePostar  varchar(255) not null,
movieTrailer  varchar(255) not null ,
description  varchar(255) not null ,
status varchar(255) default 'showing'
);


create table nowShowing(
nowShowingId int auto_increment primary key,
movieId int not null,
screenId int not null,
fromTime varchar(255) not null,
toTime varchar(255) not null,
ticketPrice varchar(255) not null,
foreign key (movieId) references movie(movieId),
foreign key (screenId) references screen(screenId)
);

create table category(
categoryId int auto_increment primary key,
categoryName  varchar(255) not null unique
);

create table item(
itemId int auto_increment primary key,
categoryId int not null,
itemName varchar(255) not null,
price varchar(255) not null,
description varchar(255) not null,
picture varchar(255) not null,
foreign key (categoryId) references category(categoryId)
);


create table promoCode(
promoCodeId int auto_increment primary key,
promoCode varchar(255) not null,
discount varchar(255) not null,
validityFrom varchar(255) not null,
validityTo varchar(255) not null,
status varchar(255)  default 'activated'
);

create table user(
userId int auto_increment primary key,
name varchar(255) not null,
email varchar(255) not null unique,
phone varchar(255) not null,
gender varchar(255) not null,
age varchar(255) not null,
password varchar(255) not null,
address varchar(255) not null,
postCode varchar(255) not null,
wallet varchar(255) default '0'
);


create table movieBooking(
movieBookingId int auto_increment primary key,
userId int not null,
timingId int not null,
date  DATETIME  default CURRENT_TIMESTAMP,
numberOfSeats varchar(255) not null,
status  varchar(255) not null default 'not booked',
promoCodeId int,
bookingDate varchar(255),
movieId int not null,
foreign key (userId) references user(userId),
foreign key (timingId) references timing(timingId),
foreign key (promoCodeId) references promoCode(promoCodeId),
foreign key (movieId) references movie(movieId)
);



create table bookedSeat(
bookedSeatId int auto_increment primary key,
movieBookingId int not null,
seatNumber varchar(255) not null,
seatNumber2 varchar(255) not null,
status varchar(255) default 'locked',
foreign key (movieBookingId) references movieBooking(movieBookingId)
);



create table foodBooking(
foodBookingId int auto_increment primary key,
movieBookingId int not null,
itemId int not null,
quantity varchar(255) not null,
price varchar(255) not null,
foreign key (movieBookingId) references movieBooking(movieBookingId),
foreign key (itemId) references item(itemId)
);

