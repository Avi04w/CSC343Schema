-- Q1

DROP VIEW IF EXISTS Traffic CASCADE;

CREATE VIEW Traffic AS
(SELECT a.a_id, a.name, COUNT(t.pass_id) -- Departure airport
FROM Flight f JOIN Route r ON f.r_id = r.r_id
JOIN Airport a ON a.a_id = r.departure_airport
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE EXTRACT(YEAR FROM f.day) = 2023
GROUP BY a.a_id, a.name)
UNION ALL
(SELECT a.a_id, a.name, COUNT(t.pass_id) -- Arrival airport
FROM Flight f JOIN Route r ON f.r_id = r.r_id
JOIN Airport a ON a.a_id = r.arrival_airport
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE EXTRACT (YEAR FROM f.day) = 2023
GROUP BY a.a_id, a.name);

SELECT a.a_id AS a_id, a.name AS airport_name, 
COALESCE(SUM(count), 0) AS total_passengers
FROM Airport a LEFT JOIN Traffic t ON t.a_id = a.a_id AND t.name = a.name
GROUP BY a.a_id, a.name;