CREATE VIEW Pairings AS
	SELECT air.name AS airline, p.p_id, c.name AS fullname, COUNT(*)
	FROM Airline air JOIN Plane p ON air.air_id = p.air_id
	JOIN Flight f ON p.p_id = f.p_id
	JOIN ScheduledCrew sc ON sc.f_id = f.f_id
	JOIN Crew c ON sc.c_id = c.c_id
	JOIN ScheduledGate sg ON f.f_id = sg.f_id
	WHERE YEAR(f.day) = 2023
	GROUP BY air.name, p.p_id, c.name
;

SELECT airline, p_id, fullname, count
FROM Pairings
WHERE count >= 10;
