-- Q1

SELECT a.a_id, a.name, COUNT(t.pass_id)
FROM Airport a JOIN Flight f ON a.a_id = f.a_id
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
JOIN Ticket t ON sf.t_id = t.t_id
WHERE YEAR(f.day) = 2023
GROUP BY a.a_id, a.name;
