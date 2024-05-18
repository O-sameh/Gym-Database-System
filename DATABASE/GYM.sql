CREATE DATABASE gym_management;
USE gym_management;

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(255),
    age INT,
    gender ENUM('Male', 'Female'),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    address VARCHAR(255),
    join_date DATE
);

CREATE TABLE membership (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    membership_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    membership_status ENUM('Active', 'Inactive', 'Expired'),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


CREATE TABLE fees_and_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status ENUM('Paid', 'Unpaid'),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE trainer (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_name VARCHAR(255),
    specialization VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    gender ENUM('Male', 'Female'),
    address VARCHAR(255),
    salary DECIMAL(10, 2)
);

CREATE TABLE training_area(
    training_area_id INT AUTO_INCREMENT PRIMARY KEY,
    area_name VARCHAR(255),
    area_description TEXT,
    capacity INT
);

CREATE TABLE equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(255),
    quantity INT,
    conditions VARCHAR(50),
    last_maintenance_date DATE,
    training_area_id INT,
    FOREIGN KEY (training_area_id) REFERENCES training_area(training_area_id)
);

CREATE TABLE class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(255),
    class_description TEXT,
    class_date DATE,
    class_time TIME,
    capacity INT,
    trainer_id INT,
    training_area_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (training_area_id) REFERENCES training_area(training_area_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    attendance_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    class_id INT,
    member_id INT,
    FOREIGN KEY (class_id) REFERENCES class(class_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);


INSERT INTO members (member_id, member_name, age, gender, phone_number, email, address, join_date) VALUES
(1, 'John Doe', 30, 'Male', '123-456-7890', 'john.doe@example.com', '123 Main St', '2023-01-15'),
(2, 'Jane Smith', 28, 'Female', '123-456-7891', 'jane.smith@example.com', '124 Main St', '2023-02-10'),
(3, 'Alice Johnson', 25, 'Female', '123-456-7892', 'alice.johnson@example.com', '125 Main St', '2023-03-05'),
(4, 'Bob Brown', 35, 'Male', '123-456-7893', 'bob.brown@example.com', '126 Main St', '2023-04-20'),
(5, 'Charlie Davis', 22, 'Male', '123-456-7894', 'charlie.davis@example.com', '127 Main St', '2023-05-15'),
(6, 'Diana Evans', 31, 'Female', '123-456-7895', 'diana.evans@example.com', '128 Main St', '2023-06-10'),
(7, 'Frank Green', 29, 'Male', '123-456-7896', 'frank.green@example.com', '129 Main St', '2023-07-05'),
(8, 'Hannah White', 27, 'Female', '123-456-7897', 'hannah.white@example.com', '130 Main St', '2023-08-01'),
(9, 'Ian Black', 33, 'Male', '123-456-7898', 'ian.black@example.com', '131 Main St', '2023-09-01'),
(10, 'Julie Miller', 24, 'Female', '123-456-7899', 'julie.miller@example.com', '132 Main St', '2023-10-01'),
(11, 'Kevin Scott', 26, 'Male', '123-456-7900', 'kevin.scott@example.com', '133 Main St', '2023-11-01'),
(12, 'Laura Adams', 32, 'Female', '123-456-7901', 'laura.adams@example.com', '134 Main St', '2023-12-01'),
(13, 'Michael Wilson', 34, 'Male', '123-456-7902', 'michael.wilson@example.com', '135 Main St', '2024-01-01'),
(14, 'Nancy Clark', 21, 'Female', '123-456-7903', 'nancy.clark@example.com', '136 Main St', '2024-02-01'),
(15, 'Oscar Turner', 28, 'Male', '123-456-7904', 'oscar.turner@example.com', '137 Main St', '2024-03-01'),
(16, 'Paula Lewis', 29, 'Female', '123-456-7905', 'paula.lewis@example.com', '138 Main St', '2024-04-01'),
(17, 'Quentin Harris', 30, 'Male', '123-456-7906', 'quentin.harris@example.com', '139 Main St', '2024-05-01'),
(18, 'Rachel King', 27, 'Female', '123-456-7907', 'rachel.king@example.com', '140 Main St', '2024-06-01'),
(19, 'Steve Martinez', 31, 'Male', '123-456-7908', 'steve.martinez@example.com', '141 Main St', '2024-07-01'),
(20, 'Tina Robinson', 33, 'Female', '123-456-7909', 'tina.robinson@example.com', '142 Main St', '2024-08-01');

INSERT INTO trainer (trainer_id, trainer_name, specialization, phone_number, email, gender, address, salary) VALUES
(1, 'Trainer One', 'Yoga', '123-456-7910', 'trainer.one@example.com', 'Male', '143 Main St', 50000),
(2, 'Trainer Two', 'Pilates', '123-456-7911', 'trainer.two@example.com', 'Female', '144 Main St', 52000),
(3, 'Trainer Three', 'Weightlifting', '123-456-7912', 'trainer.three@example.com', 'Male', '145 Main St', 48000),
(4, 'Trainer Four', 'Cardio', '123-456-7913', 'trainer.four@example.com', 'Female', '146 Main St', 51000),
(5, 'Trainer Five', 'CrossFit', '123-456-7914', 'trainer.five@example.com', 'Male', '147 Main St', 49000),
(6, 'Trainer Six', 'Aerobics', '123-456-7915', 'trainer.six@example.com', 'Female', '148 Main St', 50000),
(7, 'Trainer Seven', 'Martial Arts', '123-456-7916', 'trainer.seven@example.com', 'Male', '149 Main St', 53000),
(8, 'Trainer Eight', 'Zumba', '123-456-7917', 'trainer.eight@example.com', 'Female', '150 Main St', 52000),
(9, 'Trainer Nine', 'Swimming', '123-456-7918', 'trainer.nine@example.com', 'Male', '151 Main St', 51000),
(10, 'Trainer Ten', 'Boxing', '123-456-7919', 'trainer.ten@example.com', 'Female', '152 Main St', 49000),
(11, 'Trainer Eleven', 'Yoga', '123-456-7920', 'trainer.eleven@example.com', 'Male', '153 Main St', 50000),
(12, 'Trainer Twelve', 'Pilates', '123-456-7921', 'trainer.twelve@example.com', 'Female', '154 Main St', 52000),
(13, 'Trainer Thirteen', 'Weightlifting', '123-456-7922', 'trainer.thirteen@example.com', 'Male', '155 Main St', 48000),
(14, 'Trainer Fourteen', 'Cardio', '123-456-7923', 'trainer.fourteen@example.com', 'Female', '156 Main St', 51000),
(15, 'Trainer Fifteen', 'CrossFit', '123-456-7924', 'trainer.fifteen@example.com', 'Male', '157 Main St', 49000),
(16, 'Trainer Sixteen', 'Aerobics', '123-456-7925', 'trainer.sixteen@example.com', 'Female', '158 Main St', 50000),
(17, 'Trainer Seventeen', 'Martial Arts', '123-456-7926', 'trainer.seventeen@example.com', 'Male', '159 Main St', 53000),
(18, 'Trainer Eighteen', 'Zumba', '123-456-7927', 'trainer.eighteen@example.com', 'Female', '160 Main St', 52000),
(19, 'Trainer Nineteen', 'Swimming', '123-456-7928', 'trainer.nineteen@example.com', 'Male', '161 Main St', 51000),
(20, 'Trainer Twenty', 'Boxing', '123-456-7929', 'trainer.twenty@example.com', 'Female', '162 Main St', 49000);

INSERT INTO membership (membership_id, membership_type, start_date, end_date, membership_status, member_id) VALUES
(1, 'Monthly', '2023-01-01', '2023-01-31', 'Expired', 1),
(2, 'Monthly', '2023-02-01', '2023-02-28', 'Expired', 2),
(3, 'Monthly', '2023-03-01', '2023-03-31', 'Expired', 3),
(4, 'Monthly', '2023-04-01', '2023-04-30', 'Expired', 4),
(5, 'Monthly', '2023-05-01', '2023-05-31', 'Expired', 5),
(6, 'Monthly', '2023-06-01', '2023-06-30', 'Inactive', 6),
(7, 'Monthly', '2023-07-01', '2023-07-31', 'Inactive', 7),
(8, 'Monthly', '2023-08-01', '2023-08-31', 'Inactive', 8),
(9, 'Monthly', '2023-09-01', '2023-09-30', 'Inactive', 9),
(10, 'Monthly', '2023-10-01', '2023-10-31', 'Inactive', 10),
(11, 'Monthly', '2023-11-01', '2023-11-30', 'Active', 11),
(12, 'Monthly', '2023-12-01', '2023-12-31', 'Active', 12),
(13, 'Monthly', '2024-01-01', '2024-01-31', 'Active', 13),
(14, 'Monthly', '2024-02-01', '2024-02-28', 'Active', 14),
(15, 'Monthly', '2024-03-01', '2024-03-31', 'Active', 15),
(16, 'Monthly', '2024-04-01', '2024-04-30', 'Active', 16),
(17, 'Monthly', '2024-05-01', '2024-05-31', 'Active', 17),
(18, 'Monthly', '2024-06-01', '2024-06-30', 'Active', 18),
(19, 'Monthly', '2024-07-01', '2024-07-31', 'Active', 19),
(20, 'Monthly', '2024-08-01', '2024-08-31', 'Active', 20);

INSERT INTO fees_and_payments (payment_id, amount, payment_date, payment_method, payment_status, member_id) VALUES
(1, 50.00, '2023-01-01', 'Credit Card', 'Paid', 1),
(2, 55.00, '2023-02-01', 'Credit Card', 'Unpaid', 2),
(3, 60.00, '2023-03-01', 'Credit Card', 'Paid', 3),
(4, 65.00, '2023-04-01', 'Credit Card', 'Unpaid', 4),
(5, 70.00, '2023-05-01', 'Credit Card', 'Paid', 5),
(6, 75.00, '2023-06-01', 'Credit Card', 'Unpaid', 6),
(7, 80.00, '2023-07-01', 'Credit Card', 'Paid', 7),
(8, 85.00, '2023-08-01', 'Credit Card', 'Unpaid', 8),
(9, 90.00, '2023-09-01', 'Credit Card', 'Paid', 9),
(10, 95.00, '2023-10-01', 'Credit Card', 'Unpaid', 10),
(11, 100.00, '2023-11-01', 'Credit Card', 'Paid', 11),
(12, 105.00, '2023-12-01', 'Credit Card', 'Unpaid', 12),
(13, 110.00, '2024-01-01', 'Credit Card', 'Paid', 13),
(14, 115.00, '2024-02-01', 'Credit Card', 'Unpaid', 14),
(15, 120.00, '2024-03-01', 'Credit Card', 'Paid', 15),
(16, 125.00, '2024-04-01', 'Credit Card', 'Unpaid', 16),
(17, 130.00, '2024-05-01', 'Credit Card', 'Paid', 17),
(18, 135.00, '2024-06-01', 'Credit Card', 'Unpaid', 18),
(19, 140.00, '2024-07-01', 'Credit Card', 'Paid', 19),
(20, 145.00, '2024-08-01', 'Credit Card', 'Unpaid', 20);

INSERT INTO training_area (training_area_id, area_name, area_description, capacity) VALUES
(1, 'Main Gym Floor', 'General workout area with machines and weights', 50),
(2, 'Cardio Room', 'Room with cardio equipment', 30),
(3, 'Free Weights Room', 'Room with free weights and benches', 20),
(4, 'Group Class Studio', 'Studio for group fitness classes', 25),
(5, 'Cycling Studio', 'Studio with stationary bikes', 20),
(6, 'Yoga Studio', 'Peaceful studio for yoga classes', 30),
(7, 'Pilates Studio', 'Studio for pilates classes', 20),
(8, 'Boxing Ring', 'Area with boxing equipment', 15),
(9, 'Swimming Pool', 'Indoor swimming pool', 25),
(10, 'Outdoor Training Area', 'Open-air area for outdoor workouts', 35);

INSERT INTO equipment (equipment_id, equipment_name, quantity, conditions, last_maintenance_date, training_area_id) VALUES
(1, 'Treadmill', 10, 'Good', '2023-01-01', 1),
(2, 'Stationary Bike', 5, 'Fair', '2023-02-01', 2),
(3, 'Dumbbells', 20, 'Excellent', '2023-03-01', 3),
(4, 'Bench Press', 5, 'Good', '2023-04-01', 4),
(5, 'Rowing Machine', 3, 'Good', '2023-05-01', 5),
(6, 'Elliptical', 6, 'Fair', '2023-06-01', 6),
(7, 'Squat Rack', 4, 'Excellent', '2023-07-01', 7),
(8, 'Leg Press', 3, 'Good', '2023-08-01', 8),
(9, 'Kettlebells', 15, 'Fair', '2023-09-01', 9),
(10, 'Pull-Up Bar', 2, 'Good', '2023-10-01', 10),
(11, 'Yoga Mats', 30, 'Excellent', '2023-11-01', 1),
(12, 'Resistance Bands', 25, 'Good', '2023-12-01', 2),
(13, 'Medicine Balls', 10, 'Fair', '2024-01-01', 3),
(14, 'Battle Ropes', 5, 'Good', '2024-02-01', 4),
(15, 'Plyo Boxes', 7, 'Excellent', '2024-03-01', 5),
(16, 'Smith Machine', 2, 'Good', '2024-04-01', 6),
(17, 'Jump Ropes', 20, 'Fair', '2024-05-01', 7),
(18, 'Punching Bags', 6, 'Good', '2024-06-01', 8),
(19, 'Stepper Machine', 4, 'Excellent', '2024-07-01', 9),
(20, 'Foam Rollers', 12, 'Good', '2024-08-01', 10);

INSERT INTO class (class_id, class_name, class_description, class_date, class_time, capacity, trainer_id, training_area_id) VALUES
(1, 'Yoga Basics', 'Introductory yoga class', '2024-01-01', '09:00:00', 20, 1, 1),
(2, 'Advanced Pilates', 'Advanced pilates techniques', '2024-01-02', '10:00:00', 15, 2, 2),
(3, 'Weightlifting 101', 'Beginner weightlifting class', '2024-01-03', '11:00:00', 25, 3, 3),
(4, 'Cardio Blast', 'High-intensity cardio workout', '2024-01-04', '12:00:00', 30, 4, 4),
(5, 'CrossFit Challenge', 'Intense CrossFit session', '2024-01-05', '13:00:00', 20, 5, 5),
(6, 'Aerobics Fun', 'Energetic aerobics class', '2024-01-06', '14:00:00', 25, 6, 6),
(7, 'Martial Arts Intro', 'Basics of martial arts', '2024-01-07', '15:00:00', 20, 7, 7),
(8, 'Zumba Party', 'Dance-based fitness class', '2024-01-08', '16:00:00', 30, 8, 8),
(9, 'Swimming Techniques', 'Improve your swimming skills', '2024-01-09', '17:00:00', 15, 9, 9),
(10, 'Boxing Basics', 'Intro to boxing', '2024-01-10', '18:00:00', 20, 10, 10),
(11, 'Yoga Flow', 'Intermediate yoga class', '2024-01-11', '09:00:00', 20, 11, 1),
(12, 'Pilates Power', 'Intense pilates workout', '2024-01-12', '10:00:00', 15, 12, 2),
(13, 'Weightlifting Pro', 'Advanced weightlifting techniques', '2024-01-13', '11:00:00', 25, 13, 3),
(14, 'Cardio Mania', 'Extreme cardio workout', '2024-01-14', '12:00:00', 30, 14, 4),
(15, 'CrossFit Extreme', 'Advanced CrossFit session', '2024-01-15', '13:00:00', 20, 15, 5),
(16, 'Aerobics Fever', 'High-energy aerobics class', '2024-01-16', '14:00:00', 25, 16, 6),
(17, 'Martial Arts Advanced', 'Advanced martial arts techniques', '2024-01-17', '15:00:00', 20, 17, 7),
(18, 'Zumba Extreme', 'High-energy dance workout', '2024-01-18', '16:00:00', 30, 18, 8),
(19, 'Swimming Pro', 'Advanced swimming techniques', '2024-01-19', '17:00:00', 15, 19, 9),
(20, 'Boxing Pro', 'Advanced boxing techniques', '2024-01-20', '18:00:00', 20, 20, 10);

INSERT INTO attendance (attendance_id, attendance_date, check_in_time, check_out_time, class_id, member_id) VALUES
(1, '2024-01-01', '09:00:00', '10:00:00', 1, 1),
(2, '2024-01-02', '10:00:00', '11:00:00', 2, 2),
(3, '2024-01-03', '11:00:00', '12:00:00', 3, 3),
(4, '2024-01-04', '12:00:00', '13:00:00', 4, 4),
(5, '2024-01-05', '13:00:00', '14:00:00', 5, 5),
(6, '2024-01-06', '14:00:00', '15:00:00', 6, 6),
(7, '2024-01-07', '15:00:00', '16:00:00', 7, 7),
(8, '2024-01-08', '16:00:00', '17:00:00', 8, 8),
(9, '2024-01-09', '17:00:00', '18:00:00', 9, 9),
(10, '2024-01-10', '18:00:00', '19:00:00', 10, 10),
(11, '2024-01-11', '09:00:00', '10:00:00', 11, 11),
(12, '2024-01-12', '10:00:00', '11:00:00', 12, 12),
(13, '2024-01-13', '11:00:00', '12:00:00', 13, 13),
(14, '2024-01-14', '12:00:00', '13:00:00', 14, 14),
(15, '2024-01-15', '13:00:00', '14:00:00', 15, 15),
(16, '2024-01-16', '14:00:00', '15:00:00', 16, 16),
(17, '2024-01-17', '15:00:00', '16:00:00', 17, 17),
(18, '2024-01-18', '16:00:00', '17:00:00', 18, 18),
(19, '2024-01-19', '17:00:00', '18:00:00', 19, 19),
(20, '2024-01-20', '18:00:00', '19:00:00', 20, 20),
(21, '2024-01-01', '09:00:00', '10:00:00', 1, 1),
(22, '2024-01-02', '10:00:00', '11:00:00', 2, 1),
(23, '2024-01-03', '11:00:00', '12:00:00', 3, 1),
(24, '2024-01-04', '12:00:00', '13:00:00', 4, 3),
(25, '2024-01-05', '13:00:00', '14:00:00', 5, 3),
(26, '2024-01-06', '14:00:00', '15:00:00', 6, 3),
(27, '2024-01-07', '15:00:00', '16:00:00', 7, 4),
(28, '2024-01-08', '16:00:00', '17:00:00', 8, 6),
(29, '2024-01-09', '17:00:00', '18:00:00', 9, 6),
(30, '2024-01-10', '18:00:00', '19:00:00', 10, 16),
(31, '2024-01-11', '09:00:00', '10:00:00', 11, 16),
(32, '2024-01-12', '10:00:00', '11:00:00', 12, 16),
(33, '2024-01-13', '11:00:00', '12:00:00', 13, 13),
(34, '2024-01-14', '12:00:00', '13:00:00', 14, 15),
(35, '2024-01-15', '13:00:00', '14:00:00', 15, 15),
(36, '2024-01-16', '14:00:00', '15:00:00', 16, 13),
(37, '2024-01-17', '15:00:00', '16:00:00', 17, 12),
(38, '2024-01-18', '16:00:00', '17:00:00', 18, 9),
(39, '2024-01-19', '17:00:00', '18:00:00', 19, 1),
(40, '2024-01-20', '18:00:00', '19:00:00', 20, 1);
# Query to Retrieve Member’s Class Schedule
SELECT 
    m.member_name,
    c.class_name,
    c.class_date,
    c.class_time,
    ta.area_name
FROM 
    members m
JOIN 
    attendance a ON m.member_id = a.member_id
JOIN 
    class c ON a.class_id = c.class_id
JOIN 
    training_area ta ON c.training_area_id = ta.training_area_id
WHERE 
    m.member_id = 1;

# Query to Retrieve Classes Taught by a Trainer
SELECT 
    t.trainer_name AS trainer_name,
    c.class_name,
    c.class_date,
    c.class_time,
    ta.area_name
FROM 
    trainer t
JOIN 
    class c ON t.trainer_id = c.trainer_id
JOIN 
    training_area ta ON c.training_area_id = ta.training_area_id
WHERE 
    t.trainer_id = 5;

# Query to Retrieve Equipment Due for Maintenance
SELECT 
    e.equipment_name,
    e.quantity,
    e.conditions,
    e.last_maintenance_date,
    ta.area_name
FROM 
    equipment e
JOIN 
    training_area ta ON e.training_area_id = ta.training_area_id
WHERE 
    e.last_maintenance_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

# Query to Retrieve Members with Expired Memberships
SELECT 
    m.member_name,
    me.membership_type,
    me.start_date,
    me.end_date
FROM 
    members m
JOIN 
    membership me ON m.member_id = me.member_id
WHERE 
    me.membership_status = 'Expired';

# Query to retrieve Classes with the Highest Attendance
SELECT 
    c.class_name,
    COUNT(a.attendance_id) AS attendance_count
FROM 
    class c
JOIN 
    attendance a ON c.class_id = a.class_id
GROUP BY 
    c.class_id
ORDER BY 
    attendance_count DESC
LIMIT 1;

# Query to Retrieve Trainers who teach the most classes
SELECT 
    t.trainer_name ,
    COUNT(c.class_id) AS class_count
FROM 
    trainer t
JOIN 
    class c ON t.trainer_id = c.trainer_id
GROUP BY 
    t.trainer_id
ORDER BY 
    class_count DESC
LIMIT 1;

# Query to Calculate Total Revenue from Memberships this Month
SELECT 
    SUM(fp.amount) AS total_revenue
FROM 
    fees_and_payments fp
WHERE 
    MONTH(fp.payment_date) = MONTH(CURDATE())
    AND YEAR(fp.payment_date) = YEAR(CURDATE())
    AND fp.payment_status = 'Paid';

# Query to Retrieve Members with Unpaid Payments
SELECT 
    m.member_name,
    fp.amount,
    fp.payment_date
FROM 
    members m
JOIN 
    fees_and_payments fp ON m.member_id = fp.member_id
WHERE 
    fp.payment_status = 'Unpaid';

# Query to Calculate the Percentage of Members Who Attended Classes Last Month
SELECT 
    (SELECT COUNT(DISTINCT a.member_id) 
     FROM attendance a
     WHERE 
         MONTH(a.attendance_date) = MONTH(CURDATE() - INTERVAL 1 MONTH)
         AND YEAR(a.attendance_date) = YEAR(CURDATE() - INTERVAL 1 MONTH)) 
    / 
    (SELECT COUNT(*) FROM members) * 100 AS attendance_percentage;
