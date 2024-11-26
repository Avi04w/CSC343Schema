-- Q1

SELECT a.name, COUNT(sf.pass_id)
FROM Airport a JOIN Flight f ON a.a_id = f.a_id
JOIN ScheduledFlight sf ON f.f_id = sf.f_id
WHERE (EXTRACT YEAR FROM f.day) = 2023
GROUP BY a.name;
