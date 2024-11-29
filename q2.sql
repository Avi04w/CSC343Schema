DROP VIEW IF EXISTS RouteFrequency CASCADE;
DROP VIEW IF EXISTS MaxRoutes CASCADE;

CREATE VIEW RouteFrequency AS 
    SELECT p.full_name, r.r_id, COUNT(*) AS count
    FROM Flight f JOIN Route r ON f.r_id = r.r_id
    JOIN ScheduledFlight sf ON f.f_id = sf.f_id
    JOIN Ticket t ON t.t_id = sf.t_id
    JOIN Passenger p ON t.pass_id = p.pass_id
    WHERE EXTRACT (YEAR FROM f.day) = 2023
    GROUP BY p.full_name, r.r_id
;

CREATE VIEW MaxRoutes AS
SELECT r_id, MAX(count) AS max
FROM RouteFrequency
GROUP BY r_id;

SELECT rf.full_name, rf.r_id, rf.count
FROM RouteFrequency rf JOIN MaxRoutes mr ON rf.r_id = mr.r_id AND rf.count = mr.max;