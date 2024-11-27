-- CSC343 Assignment 3 Schema - Richard Guo, Avi Walia

-- Could not:

	NOTE: All "could not" constraints have the functionality to be enforced, but require triggers/assertions to do so.

	- Each flight's number of scheduled crew must match the number of required crew for that flight
	- Planes cannot be on two flights a the same time, and require at least an hour between flights
	- Flight crew cannot work more than 14 hours of each 24 hour period
	- Flight crew must be certified on the type of plane for each flight they are assigned to
	- Passengers under the age of 12 must travel with at least one other passenger age 18 years or older on that booking
	- If a flight route is between two different countries, passengers must have a valid visa that allows them to enter that country, unless they are a citizen
	- Passengers cannot board a flight until the airlinr has confirmed proof of valid visa
	- "Elite” status passengers can have a maximum of four pieces of luggage with a combined weight of 100kg per flight
	- Passengers with “elite” status board first, passengers travelling on a booking with children under 6 board second, and standby passengers
	board last. Everyone else boards between the second group and the standby group
	- Only one plane can be at a gate at a time. Planes arrive at a gate at least 30 minutes before a departure and remain there for at least 30 minutes after an arrival.
	- If the same plane is carrying two flights that end/begin within 2 hours of each other, then it should arrive at/depart from the same gate for those flights

-- Did not:

-- Extra constraints:
	- All tickets start as "standby" tickets, and then the tickets that "guarantee" a spot on the plane will appear in the ScheduledFlight table, so "standby" tickets are those who appear in the Ticket table but not the ScheduledFlight table
	- Each plane needs at least 1 crew member to fly
	- The only two possible types of passengers are 'elite' and 'regular'

-- Assumptions:
	- There will be no ground crew for flights that are ARRIVING at a gate
	- Passengers can only have a citizenship for one country
	- Seat number does not exceed the plane's capacity


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
	age INT NOT NULL CHECK (age >= 0),
	status VARCHAR(30) NOT NULL CHECK (status IN ('elite', 'regular))
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
	crew_num INT NOT NULL CHECK (crew_num >= 1),
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

-- The ticket with unique identifier <t_id> for the passenger referenced by <pass_id> flying on route <r_id>. All tickets are for standby until they appear in ScheduledFlight
CREATE TABLE Ticket (
	t_id INT PRIMARY KEY,
	pass_id INT REFERENCES Passenger(pass_id),
	r_id INT REFERENCES Route(r_id),
);

-- A ticket (and passenger) referenced by <t_id> for a  flight referenced by <f_id> with <num_baggage> bags that cannot total 2 bags for regular passengers and 4 bags for elite passengers, and whose total weight <total_weight> cannot exceed 50 kg for regular passengers and 100 kg for elite passengers, boarding on gate referenced by <g_id>. Boarding zone is <zone> and assigned seating is <seat_number>
CREATE TABLE ScheduledFlight (
	f_id INT REFERENCES Flight(f_id),
	t_id INT REFERENCES Ticket(t_id),
	seat_number INT NOT NULL,
	zone INT NOT NULL,
	num_baggage INT NOT NULL CHECK (num_baggage <= 2),
	total_weight INT NOT NULL CHECK (total_weight <= 50),
	g_id INT REFERENCES Gate(g_id),
	PRIMARY KEY (f_id, t_id),
	UNIQUE(f_id, seat_number)
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