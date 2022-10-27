DROP DATABASE IF EXISTS hotel_sys;

create database hotel_sys;
use hotel_sys;


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
    FOREIGN KEY (hotel_pk) 
		REFERENCES hotel(hotel_pk)
        ON DELETE CASCADE,
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
    is_reserved_temp BOOLEAN,
    couch BOOLEAN,
    couch_converts BOOLEAN
    
);
create table billing_multiplier_list (
	hotel_pk INT PRIMARY KEY,
    FOREIGN KEY (hotel_pk) 
		REFERENCES hotel(hotel_pk)
        ON DELETE CASCADE,
	state_lodging_tax DECIMAL(4,3),
    local_sales_tax DECIMAL(4,3),
    pet_fee DECIMAL (4,2),
    extra_bed_fee DECIMAL (4,2),
    smoking_fee DECIMAL (5,2),
    base_rate DECIMAL (5,2),
    fema_discount DECIMAL (4,3),
    senior_discount DECIMAL (4,3),
    aarp_discount DECIMAL (4,3),
    government_discount DECIMAL (4,3),
    veteren_discount DECIMAL (4,3)
);
create table hotel_feature_list (
	allows_pets BOOLEAN,
    allows_smoking BOOLEAN,
    ev_charging BOOLEAN,
    vending_machines BOOLEAN,
    ice_machine BOOLEAN,
    elevator BOOLEAN,
    gym BOOLEAN,
    pool BOOLEAN,
    hot_tub BOOLEAN,
    breakfast BOOLEAN,
    outdoor_parking BOOLEAN,
    indoor_parking BOOLEAN,
    wifi BOOLEAN,
    fax_machine BOOLEAN,
    copy_machine BOOLEAN,
    late_check_out BOOLEAN,
    interior_corridors BOOLEAN,
    free_coffee BOOLEAN,
    laundry BOOLEAN,
    business_center BOOLEAN,
    accessible_features BOOLEAN,
    assistive_listening BOOLEAN,
    accessibility_ramp BOOLEAN,
    accessible_parking BOOLEAN,
    accessible_hotel BOOLEAN,
    braille_signage BOOLEAN,
    braille_elevator BOOLEAN,
    crib_available BOOLEAN,
    cot_available BOOLEAN
);

insert into hotel VALUES ('1', 'Parkway East', 'Bedford', 'PA', '8149772014', '8149772015', '11:30', '1:30', '3.4', 'EDT');
insert into suite values ('1', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2', '2', '2', FALSE);
insert into billing_multiplier_list values ('1', '1.05', '1.03', '30', '20', '100', '70', '.90', '.90', '.85', '.90', '.90');

delete from hotel where hotel_pk = 1;

select * from hotel;
select * from suite;
select * from billing_multiplier_list;

