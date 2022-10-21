DROP DATABASE IF EXISTS hotel_sys;

create database hotel_sys;
use hotel_sys;

insert into hotel VALUES (
	'1', 'Parkway East', 'Bedford', 'PA', '8149772014', '8149772015', '11:30', '1:30', '3.4', 'EDT'
);

insert into suite values (
	'1', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2', '2', '2', FALSE
);

select * from hotel;

create table hotel (
	hotel_pk int PRIMARY KEY,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    fax_number VARCHAR(10),
    check_in_time TIME,
    check_out_time TIME,
    hotel_rating DECIMAL(2,1),
    time_zone VARCHAR(4)
);
create table suite (
	hotel_pk INT PRIMARY KEY,
    FOREIGN KEY (hotel_pk) REFERENCES hotel(hotel_pk),
    hsafe BOOLEAN,
    refrigerator BOOLEAN,
    ground_floor BOOLEAN,
    microwave BOOLEAN,
    ironing BOOLEAN,
    clock_radio BOOLEAN,
    coffee_maker BOOLEAN,
    phone BOOLEAN,
    television BOOLEAN,
    room_count INT,
    queen_bed_count INT,
    king_bed_count INT,
    is_reserved_temp BOOLEAN
);