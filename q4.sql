DROP VIEW IF EXISTS Pairings CASCADE;
DROP VIEW IF EXISTS FlightPairings CASCADE;
DROP VIEW IF EXISTS GatePairings CASCADE;

CREATE VIEW FlightPairings AS
	SELECT air.name AS airline, p.p_id, c.name AS fullname, COUNT(*)
	FROM Airline air JOIN Plane p ON air.air_id = p.air_id
	JOIN Flight f ON p.p_id = f.p_id
	JOIN ScheduledCrew sc ON sc.f_id = f.f_id
	JOIN Crew c ON sc.c_id = c.c_id
	WHERE EXTRACT (YEAR FROM f.day) = 2023
	GROUP BY air.name, p.p_id, c.name
;

CREATE VIEW GatePairings AS
	SELECT air.name AS airline, p.p_id, c.name AS fullname, COUNT(*)
	FROM Airline air JOIN Plane p ON air.air_id = p.air_id
	JOIN Flight f ON p.p_id = f.p_id
	JOIN ScheduledGate sg ON sg.f_id = f.f_id
	JOIN Crew c ON sg.c_id = c.c_id
	WHERE EXTRACT (YEAR FROM f.day) = 2023
	GROUP BY air.name, p.p_id, c.name
;

CREATE VIEW Pairings AS 
	(SELECT * FROM FlightPairings) UNION ALL (SELECT * FROM GatePairings);

SELECT airline, p_id, fullname, count
FROM Pairings
WHERE count >= 10;
