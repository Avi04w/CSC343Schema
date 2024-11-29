-- Q1

DROP VIEW IF EXISTS Arrivals CASCADE;
DROP VIEW IF EXISTS Departures CASCADE;

CREATE VIEW Departures AS
SELECT a1.a_id, a1.name, COUNT(t.pass_id)
FROM Flight f JOIN Route r ON f.f_id = r.r_id
JOIN Airport a1 ON a1.a_id = r.departure_airport
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE EXTRACT(YEAR FROM f.day) = 2023
GROUP BY a1.a_id, a1.name;

CREATE VIEW Arrivals AS 
SELECT a2.a_id, a2.name, COUNT(t.pass_id)
FROM Flight f JOIN Route r ON f.f_id = r.r_id
JOIN Airport a2 ON a2.a_id = r.arrival_airport
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE EXTRACT (YEAR FROM f.day) = 2023
GROUP BY a2.a_id, a2.name;

SELECT a_id, name, SUM(count)
FROM Departures UNION ALL Arrivals
GROUP BY a_id, name;