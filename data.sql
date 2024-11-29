-- Insert airport information into Airport table
INSERT INTO Airport (a_id, name, city, country)
VALUES
(1, 'Airport A', 'City A', 'Country A'),
(2, 'Airport B', 'City B', 'Country B'),
(3, 'Airport C', 'City C', 'Country C'),
(4, 'Airport D', 'City D', 'Country D');

-- Insert airline information into Airline table
INSERT INTO Airline (air_id, name)
VALUES
(1, 'Airline A');

-- Insert plane information into Plane table
INSERT INTO Plane (p_id, certification, capacity, air_id)
VALUES
(1, 'Certification A', 20, 1),
(2, 'Certification A', 30, 1),
(3, 'Certification B', 5, 1);

-- Insert 50 passengers into the Passenger table
INSERT INTO Passenger (pass_id, full_name, citizenship, age, status)
VALUES
(1, 'Passenger 1', 'Country A', 25, 'regular'),
(2, 'Passenger 2', 'Country B', 35, 'regular'),
(3, 'Passenger 3', 'Country A', 12, 'regular'),
(4, 'Passenger 4', 'Country C', 28, 'regular'),
(5, 'Passenger 5', 'Country C', 40, 'regular'),
(6, 'Passenger 6', 'Country A', 5, 'regular'),
(7, 'Passenger 7', 'Country B', 22, 'regular'),
(8, 'Passenger 8', 'Country C', 27, 'regular'),
(9, 'Passenger 9', 'Country C', 19, 'regular'),
(10, 'Passenger 10', 'Country A', 31, 'regular'),
(11, 'Passenger 11', 'Country A', 22, 'regular'),
(12, 'Passenger 12', 'Country A', 29, 'regular'),
(13, 'Passenger 13', 'Country A', 31, 'regular'),
(14, 'Passenger 14', 'Country B', 25, 'regular'),
(15, 'Passenger 15', 'Country B', 40, 'regular'),
(16, 'Passenger 16', 'Country C', 18, 'regular'),
(17, 'Passenger 17', 'Country B', 50, 'regular'),
(18, 'Passenger 18', 'Country A', 23, 'regular'),
(19, 'Passenger 19', 'Country A', 32, 'regular'),
(20, 'Passenger 20', 'Country A', 45, 'regular'),
(21, 'Passenger 21', 'Country C', 20, 'elite'),
(22, 'Passenger 22', 'Country C', 19, 'regular'),
(23, 'Passenger 23', 'Country A', 33, 'regular'),
(24, 'Passenger 24', 'Country A', 25, 'regular'),
(25, 'Passenger 25', 'Country A', 40, 'regular'),
(26, 'Passenger 26', 'Country A', 35, 'regular'),
(27, 'Passenger 27', 'Country B', 23, 'regular'),
(28, 'Passenger 28', 'Country A', 29, 'regular'),
(29, 'Passenger 29', 'Country A', 21, 'regular'),
(30, 'Passenger 30', 'Country C', 34, 'regular'),
(31, 'Passenger 31', 'Country B', 22, 'regular'),
(32, 'Passenger 32', 'Country C', 28, 'regular'),
(33, 'Passenger 33', 'Country A', 24, 'regular'),
(34, 'Passenger 34', 'Country A', 27, 'regular'),
(35, 'Passenger 35', 'Country A', 25, 'regular'),
(36, 'Passenger 36', 'Country B', 29, 'regular'),
(37, 'Passenger 37', 'Country C', 23, 'regular'),
(38, 'Passenger 38', 'Country B', 30, 'regular'),
(39, 'Passenger 39', 'Country A', 26, 'regular'),
(40, 'Passenger 40', 'Country A', 29, 'regular'),
(41, 'Passenger 41', 'Country C', 28, 'regular'),
(42, 'Passenger 42', 'Country B', 22, 'regular'),
(43, 'Passenger 43', 'Country A', 5, 'regular'),
(44, 'Passenger 44', 'Country A', 25, 'regular'),
(45, 'Passenger 45', 'Country C', 30, 'regular'),
(46, 'Passenger 46', 'Country B', 31, 'regular'),
(47, 'Passenger 47', 'Country A', 24, 'regular'),
(48, 'Passenger 48', 'Country C', 33, 'regular'),
(49, 'Passenger 49', 'Country A', 25, 'regular'),
(50, 'Passenger 50', 'Country D', 26, 'regular');

-- Insert gate information into Gate table
INSERT INTO Gate (g_id, gate_name, a_id)
VALUES
(1, 'Gate 1', 1), 
(2, 'Gate 1', 2), 
(3, 'Gate 1', 3),
(4, 'Gate 1', 4);

-- Insert visa information into Visas table
INSERT INTO Visas (pass_id, visa)
VALUES
(50, 'Country A'),
(50, 'Country B'),
(50, 'Country C');

-- Insert crew information into Crew table
INSERT INTO Crew (c_id, name, age)
VALUES
(1, 'Crew 1', 25),
(2, 'Crew 2', 30),
(3, 'Crew 3', 35),
(4, 'Crew 4', 40),
(5, 'Crew 5', 40),
(6, 'Crew 6', 42),
(7, 'Crew 7', 40);

-- Insert crew certifications into CrewCertifications table
INSERT INTO CrewCertifications (c_id, certification)
VALUES
(1, 'Ground Crew'),
(2, 'Ground Crew'),
(3, 'Ground Crew'),
(4, 'Ground Crew'),
(5, 'Certification A'),
(6, 'Certification A'),
(7, 'Certification A'),
(5, 'Certification B'),
(6, 'Certification B'),
(7, 'Certification B');

-- Insert route information into Route table
INSERT INTO Route (r_id, departure_airport, arrival_airport)
VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 1);

-- Insert flight information into Flight table
Insert into Flight (f_id, air_id, r_id, p_id, crew_num, day, departure_time, arrival_time)
VALUES
(1, 1, 4, 1, 2, '2022-01-02', '03:00:00', '18:30:00'),
(2, 1, 1, 1, 2, '2023-01-15', '08:00:00', '12:00:00'),
(3, 1, 2, 2, 3, '2023-02-20', '10:00:00', '14:00:00');

-- Insert scheduled crew information into ScheduledCrew table
INSERT INTO ScheduledCrew (f_id, c_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3);

-- Insert ticket information into Ticket table
INSERT INTO Ticket (t_id, pass_id, r_id)
VALUES
(1, 50, 4),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(9, 8, 1),
(10, 9, 1),
(11, 10, 1),
(12, 11, 1),
(13, 12, 1),
(14, 13, 1),
(15, 14, 1),
(16, 15, 1),
(17, 16, 1),
(18, 17, 1),
(19, 18, 1),
(20, 19, 1),
(21, 20, 1),
(22, 1, 2),
(23, 2, 2),
(24, 3, 2),
(25, 4, 2),
(26, 5, 2),
(27, 6, 2),
(28, 7, 2),
(29, 8, 2),
(30, 9, 2),
(31, 10, 2),
(32, 11, 2),
(33, 12, 2),
(34, 13, 2),
(35, 14, 2),
(36, 15, 2),
(37, 16, 2),
(38, 17, 2),
(39, 18, 2),
(40, 19, 2),
(41, 20, 2),
(42, 21, 3),
(43, 22, 3),
(44, 23, 3),
(45, 24, 3),
(46, 25, 3),
(47, 26, 3),
(48, 27, 3),
(49, 28, 3),
(50, 29, 3),
(51, 30, 3);


-- Insert scheduled flight information into ScheduledFlight table
INSERT INTO ScheduledFlight (f_id, t_id, seat_number, zone, num_baggage, total_weight, g_id)
VALUES
(1, 1, 1, 2, 1, 20, 4),
(2, 2, 1, 2, 1, 30, 1),
(2, 3, 2, 2, 1, 30, 1),
(2, 4, 3, 2, 1, 30, 1),
(2, 5, 4, 2, 2, 40, 1),
(2, 6, 5, 2, 2, 40, 1),
(2, 7, 6, 2, 2, 40, 1),
(2, 8, 7, 2, 2, 40, 1),
(2, 9, 8, 2, 2, 40, 1),
(2, 10, 9, 2, 2, 40, 1),
(2, 11, 10, 2, 2, 40, 1),
(2, 12, 11, 2, 2, 40, 1),
(2, 13, 12, 2, 2, 40, 1),
(2, 14, 13, 2, 2, 40, 1),
(2, 15, 14, 2, 2, 40, 1),
(2, 16, 15, 2, 2, 40, 1),
(2, 17, 16, 2, 2, 40, 1),
(2, 18, 17, 2, 2, 40, 1),
(2, 19, 18, 2, 2, 40, 1),
(2, 20, 19, 2, 2, 40, 1),
(2, 21, 20, 2, 1, 20, 1),
(3, 22, 1, 2, 1, 20, 2),
(3, 23, 2, 2, 1, 20, 2),
(3, 24, 3, 2, 1, 20, 2),
(3, 25, 4, 2, 1, 20, 2),
(3, 26, 5, 2, 1, 20, 2),
(3, 27, 6, 2, 1, 20, 2),
(3, 28, 7, 2, 1, 20, 2),
(3, 29, 8, 2, 1, 20, 2),
(3, 30, 9, 2, 1, 20, 2),
(3, 31, 10, 2, 1, 20, 2),
(3, 32, 11, 2, 1, 20, 2),
(3, 33, 12, 2, 1, 20, 2),
(3, 34, 13, 2, 1, 20, 2),
(3, 35, 14, 2, 1, 20, 2),
(3, 36, 15, 2, 1, 20, 2),
(3, 37, 16, 2, 1, 20, 2),
(3, 38, 17, 2, 1, 20, 2),
(3, 39, 18, 2, 1, 20, 2),
(3, 40, 19, 2, 1, 20, 2),
(3, 41, 20, 2, 1, 20, 2),
(3, 42, 21, 1, 1, 20, 2),
(3, 43, 22, 2, 1, 20, 2),
(3, 44, 23, 2, 1, 20, 2),
(3, 45, 24, 2, 1, 20, 2),
(3, 46, 25, 2, 1, 20, 2),
(3, 47, 26, 2, 1, 20, 2),
(3, 48, 27, 2, 1, 20, 2),
(3, 49, 28, 2, 1, 20, 2),
(3, 50, 29, 2, 1, 20, 2),
(3, 51, 30, 2, 1, 20, 2);

-- Insert scheduled gate information into ScheduledGate table
INSERT INTO ScheduledGate (a_id, g_id, f_id, c_id)
VALUES
(1, 1, 2, 1),
(2, 2, 3, 2),
(4, 4, 1, 4);

-- Insert bookings for each passenger into Booking and BookedPassengers tables
INSERT INTO Booking (b_id, booked_by)
VALUES
(1, 50),
(2, 1),
(3, 1);

-- Distribute passengers across bookings
INSERT INTO BookedPassengers (b_id, pass_id, r_id)
VALUES
(1, 50, 4),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 12, 1),
(2, 13, 1),
(2, 14, 1),
(2, 15, 1),
(2, 16, 1),
(2, 17, 1),
(2, 18, 1),
(2, 19, 1),
(2, 20, 1),
(3, 1, 2),
(3, 2, 2),
(3, 3, 2),
(3, 4, 2),
(3, 5, 2),
(3, 6, 2),
(3, 7, 2),
(3, 8, 2),
(3, 9, 2),
(3, 10, 2),
(3, 11, 2),
(3, 12, 2),
(3, 13, 2),
(3, 14, 2),
(3, 15, 2),
(3, 16, 2),
(3, 17, 2),
(3, 18, 2),
(3, 19, 2),
(3, 20, 2),
(3, 21, 2),
(3, 22, 3),
(3, 23, 3),
(3, 24, 3),
(3, 25, 3),
(3, 26, 3),
(3, 27, 3),
(3, 28, 3),
(3, 29, 3),
(3, 30, 3);