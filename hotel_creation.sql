DROP DATABASE IF EXISTS hotel_sys;

create database hotel_sys;
use hotel_sys;

create table hotel (
	hotel_pk int PRIMARY KEY,
    check_in_time TIME,
    check_out_time TIME,
    hotel_rating DECIMAL(2,1),
    time_zone VARCHAR(4),
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
    
);

insert into hotel VALUES ('1', '11:30', '1:30', '3.4', 'EDT', '8149772014', '8159772015', 'Parkway East', 'Bedford', 'PA', '15522');

create table suite (
	suite_pk INT,
	hotel_pk INT,
    PRIMARY KEY(suite_pk, hotel_pk),
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

insert into suite VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '0','1','1','1');

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

insert into billing_multiplier_list VALUES ('1', '1.05', '1.06', '15.00', '15.00', '150.00', '40.00', '.90', '.90', '.90', '.90', '.90');

create table hotel_feature_list (
	hotel_feature_list_pk INT PRIMARY KEY,
    FOREIGN KEY (hotel_feature_list_pk)
		REFERENCES hotel(hotel_pk),
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

insert into hotel_feature_list VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

create table common_destination (
	destination_pk INT PRIMARY KEY,
	destination_name varchar(50),
    description varchar(500),
    destination_type varchar(40),
    CONSTRAINT chk_type CHECK (destination_type IN ('military_base', 'museum', 'school', 'airport', 'amusement_park', 'ski_resort')),
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
);

insert into common_destination VALUES ('1', 'MOMA', 'Museaum of Modern Art', 'museum', '8159772015', '8159772015', 'Parkway East', 'Bedford', 'PA', '15522');

create table destination_proximity (
	proximity_pk INT PRIMARY KEY,
    destination_pk INT,
    FOREIGN KEY (destination_pk) 
		REFERENCES common_destination(destination_pk)
        ON DELETE CASCADE,
	hotel_pk INT,
    FOREIGN KEY (hotel_pk) 
		REFERENCES hotel(hotel_pk)
        ON DELETE CASCADE,
	distance DECIMAL(5,2)
	
);

create table customer (
    customer_pk INT PRIMARY KEY,
    email VARCHAR(40),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone_number VARCHAR(11),
    is_member BOOLEAN
);

create table reservation (
    reservation_pk INT,
    hotel_pk INT,
    FOREIGN KEY (hotel_pk)
        REFERENCES hotel(hotel_pk)
        ON DELETE CASCADE,
    customer_pk INT,
    FOREIGN KEY (customer_pk)
        REFERENCES customer(customer_pk)
        ON DELETE CASCADE,
    suite_pk INT,
    FOREIGN KEY (suite_pk)
        REFERENCES suite(suite_pk)
        ON DELETE CASCADE,
    PRIMARY KEY(reservation_pk, hotel_pk, suite_pk, customer_pk),
    check_in_date DATETIME,
    check_out_date DATETIME,
    special_requests VARCHAR(300),
    room_cleaning_freq INT,
    guest_count INT,
    check_in_complete BOOLEAN,
    check_out_complete BOOLEAN
);

create table member (
    member_pk INT,
    customer_pk INT,
    FOREIGN KEY (customer_pk) 
        REFERENCES customer(customer_pk),
    PRIMARY KEY(member_pk, customer_pk),
    member_level VARCHAR(10),
    CONSTRAINT chk_member_level CHECK (member_level IN ('bronze', 'silver', 'gold', 'platinum', 'diamond')),
    points INT
);

create table payment_method (
    payment_method_pk INT,
    member_pk INT,
    FOREIGN KEY (member_pk) 
        REFERENCES member(member_pk),
    PRIMARY KEY(payment_method_pk, member_pk),
    credit_card_number VARCHAR(16),
    expiration_date DATETIME,
    security_code INT

);

create table payment (
    payment_pk INT,
    reservation_pk INT,
    FOREIGN KEY (reservation_pk)
        REFERENCES reservation(reservation_pk),
    PRIMARY KEY(payment_pk, reservation_pk),
    payment_method_pk INT,
    FOREIGN KEY (payment_method_pk)
        REFERENCES payment_method(payment_method_pk),
    payment_complete BOOLEAN,
    price DECIMAL(6,2)
);

create table franchise (
    franchise_pk INT,
    hotel_pk INT,
    FOREIGN KEY (hotel_pk) 
        REFERENCES hotel(hotel_pk),
    PRIMARY KEY(franchise_pk, hotel_pk),
    franchise_name VARCHAR(50),
    contact_name VARCHAR(50),
    email VARCHAR(40),
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
    
);

create table employee_role (
    role_pk INT PRIMARY KEY,
    role_title VARCHAR(30),
    department VARCHAR(30),
    CONSTRAINT chk_dept CHECK (department IN ('management', 'cleaning', 'finance', 'clerk', 'maintainance')),
    rol_description VARCHAR(50)
);

create table employee (
    employee_pk INT,
    franchise_pk INT,
    FOREIGN KEY (franchise_pk)
        REFERENCES franchise(franchise_pk),
    PRIMARY KEY(employee_pk, franchise_pk),
    role_pk INT,
    FOREIGN KEY (role_pk)
        REFERENCES employee_role(role_pk),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(40),
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
);

create table benefit_package (
    employee_pk INT PRIMARY KEY,
    FOREIGN KEY (employee_pk)
        REFERENCES employee(employee_pk),
    salary INT,
    hourly BOOLEAN,
    health_insurance INT,
    paid_leave_days DECIMAL(4,1),
    vacation_days DECIMAL(4,1),
    contracted BOOLEAN,
    401k_withholding DECIMAL(2,1),
    401k_contribution DECIMAL(2,1),
    fica_withholding DECIMAL(2,1),
    futa_withholding DECIMAL(2,1),
    suta_withholding DECIMAL(2,1)
);

create table photo_set_path (
    photo_set_path_pk INT PRIMARY KEY,
    image_1_path VARCHAR(255) NOT NULL,
    image_2_path VARCHAR(255) NOT NULL,
    image_3_path VARCHAR(255) NOT NULL,
    image_4_path VARCHAR(255) NOT NULL,
    image_5_path VARCHAR(255) NOT NULL

);

create table hotel_review (
    review_pk INT,
    member_pk INT,
    FOREIGN KEY (member_pk)
        REFERENCES member(member_pk),
    hotel_pk INT,
    FOREIGN KEY (hotel_pk)
        REFERENCES hotel(hotel_pk),
	PRIMARY KEY(review_pk, member_pk, hotel_pk),
    stars DECIMAL(2,1),
    CONSTRAINT chk_stars CHECK (5 > stars > 0),
    review_content VARCHAR(500),
    review_title VARCHAR(100),
    photo_set_path_pk INT,
    FOREIGN KEY (photo_set_path_pk) 
        REFERENCES photo_set_path(photo_set_path_pk)
);

create table travel_agency (
    travel_agency_pk INT PRIMARY KEY,
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
    
);

create table travel_agent (
    travel_agent_pk INT,
    travel_agency_pk INT,
    FOREIGN KEY (travel_agency_pk)
        REFERENCES travel_agency(travel_agency_pk),
    PRIMARY KEY (travel_agent_pk, travel_agency_pk),
    fax_number VARCHAR(10),
    phone_number VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip_code VARCHAR(9) NOT NULL
);



