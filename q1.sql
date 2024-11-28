-- Q1

SELECT a1.a_id, a.name, COUNT(t.pass_id)
FROM Flight f JOIN Route r ON f.f_id = r.r_id
JOIN Airport a1 ON a1.a_id = r.departure_airport
JOIN Airport a2 ON a2.a_id = r.arrival_airport
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE YEAR(f.day) = 2023
GROUP BY a1.a_id, a1.name;
