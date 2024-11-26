DROP SCHEMA IF EXISTS A3Airport CASCADE;
CREATE SCHEMA A3Airport;
SET SEARCH_PATH TO A3Airport;


-- An airport with unique identifier <a_id> , name is name <name>, located in (city, country) <city>, <country>
CREATE TABLE Airport (
	a_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
	country VARCHAR(100) NOT NULL
);

-- An airline with unique identifier <air_id> and name <name>
CREATE TABLE Airline (
	air_id INT PRIMARY KEY,
	name VARCHAR(30)
);

-- A plane with unique identifier <p_id>, requiring certification <certification> to operate, with capacity <capacity> and belonging to airline <air_id>
CREATE TABLE Plane (
	p_id INT PRIMARY KEY,
	certification VARCHAR(30) NOT NULL,
	capacity INT NOT NULL,
	air_id INT REFERENCES Airline(air_id)
);

-- A passenger with unique identifier <pass_id>, full name <full_name>, with citizenship to country <citizenship>, age <age>, and status (elite or regular) <status>
CREATE TABLE Passenger (
	pass_id INT PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	citizenship VARCHAR(30) NOT NULL,
	age INT NOT NULL,
	status VARCHAR(30) NOT NULL
);

-- A gate with unique identifier <g_id>, stationed at airport referenced by <a_id>
CREATE TABLE Gate (
	g_id INT PRIMARY KEY,
	a_id INT REFERENCES Airport(a_id)
);

-- A passenger referenced by <pass_id>, with visa to a country <visa>
CREATE TABLE Visas (
	pass_id INT REFERENCES Passenger(pass_id),
	visa VARCHAR(30) NOT NULL,
	PRIMARY KEY (pass_id, visa)
);

-- A crew member with unique identifier <c_id>, name <name>, with age <age>
CREATE TABLE Crew (
	c_id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	age INT NOT NULL
);

-- A crew member referenced by <c_id> and certification <certification>
CREATE TABLE CrewCertifications (
	c_id INT REFERENCES Crew(c_id),
	certification VARCHAR(30) NOT NULL
);

-- A route uniquely identified by <r_id> that flies from the departure airport <departure_airport> to <arrival_airport>
CREATE TABLE Route (
	r_id INT PRIMARY KEY,
	departure_airport INT REFERENCES Airport(a_id),
	arrival_airport INT REFERENCES Airport(a_id)
);

-- A flight with unique identifier <f_id>, operated by airline <air_id>,  flying on route <r_id> from <departure_time> to <arrival_time>, using plane referenced by <p_id> staffing <crew_num> crew and departing on <day>
-- A plane cannot be on 2 flights at the same time, a plane cannot depart from an airport where it didn’t last arrive (unless it is the plane’s first flight), planes require an hour between flights
CREATE TABLE Flight (
	f_id INT PRIMARY KEY,
	air_id INT REFERENCES Airline(air_id),
	r_id INT REFERENCES Route(r_id),
	p_id INT REFERENCES Plane(p_id),
	crew_num INT NOT NULL,
	day DATE NOT NULL,
	departure_time TIME NOT NULL,
	arrival_time TIME NOT NULL
);

-- A crew member referenced by <c_id> and the flight referenced by <f_id> that they are scheduled to work on
-- Flight crew cannot work for more than 14 hours of each 24 hour period
-- Flight crew must be certified on the type of plane they are working on
CREATE TABLE ScheduledCrew (
	c_id INT REFERENCES Crew(c_id),
	f_id INT REFERENCES Flight(f_id)
);

-- The ticket with unique identifier <t_id> for the passenger referenced by <pass_id> sitting in zone <zone> on flight <f_id> sitting in seat <seat_number>
CREATE TABLE Ticket (
	t_id INT PRIMARY KEY,
	pass_id INT REFERENCES Passenger(pass_id),
	zone INT NOT NULL,
	r_id INT REFERENCES Route(r_id),
	seat_number INT NOT NULL
);

-- A ticket (and passenger)  referenced by <t_id> for a  flight referenced by <f_id> with <num_baggage> bags that cannot total 2 bags for regular passengers and 4 bags for elite passengers, and whose total weight <total_weight> cannot exceed 50 kg for regular passengers and 100 kg for elite passengers, boarding on gate referenced by <g_id>
CREATE TABLE ScheduledFlight (
	f_id INT REFERENCES Flight(f_id),
	t_id INT REFERENCES Ticket(t_id),
	num_baggage INT NOT NULL,
	total_weight INT NOT NULL,
	g_id INT REFERENCES Gate(g_id),
	PRIMARY KEY (f_id, t_id)
);

-- The flight referenced by <f_id> departing from gate <g_id> from airport <a_id> is staffed by a crew member referenced by <c_id>
CREATE TABLE ScheduledGate (
	a_id INT REFERENCES Airport(a_id),
	g_id INT REFERENCES Gate(g_id),
	f_id INT REFERENCES Flight(f_id),
	c_id INT REFERENCES Crew(c_id)
);

-- The booking with unique identifier  <b_id> and booked by someone with the name <booked_by>
CREATE TABLE Booking (
	b_id INT PRIMARY KEY,
	booked_by VARCHAR(30) NOT NULL
);

-- The booking referenced by <b_id> for the passenger referenced by <pass_id>
CREATE TABLE BookedPassengers (
	b_id INT REFERENCES Booking(b_id),
	pass_id INT REFERENCES Passenger(pass_id),
	r_id INT REFERENCES Route(r_id)
);