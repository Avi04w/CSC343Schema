DROP VIEW IF EXISTS CountryRoutes CASCADE;
DROP VIEW IF EXISTS GlobalAverage CASCADE;
DROP VIEW IF EXISTS FilteredRoutes CASCADE;

CREATE VIEW CountryRoutes AS 
    SELECT r.r_id, a1.country AS departure_country, a2.country AS arrival_country, AVERAGE(COUNT(v.pass_id)) AS avg_visa_passengers
    FROM Flight f JOIN Route r ON f.r_id = r.r_id
    JOIN Airport a1 ON r.departure_airport = a1.a_id
    JOIN Airport a2 ON r.arrival_airport = a2.a_id
    JOIN ScheduledFlight sf ON f.f_id = sf.f_id
    JOIN Ticket t ON sf.t_id = t.t_id
    JOIN Visas v ON t.pass_id = v.pass_id 
    WHERE a1.country <> a2.country AND v.visa = a2.country
    GROUP BY r.r_id, a1.country, a2.country;

CREATE VIEW GlobalAverage AS 
    SELECT AVG(avg_visa_passengers) AS overall_avg_visa_passengers FROM CountryRoutes;

CREATE VIEW FilteredRoutes AS 
    SELECT cr.r_id, cr.departure_country, cr.arrival_country, cr.avg_visa_passengers
    FROM CountryRoutes cr CROSS JOIN GlobalAverage ga 
    WHERE cr.avg_visa_passengers < 0.25 * ga.overall_avg_visa_passengers;

SELECT a1.name, a2.name, fr.avg_visa_passengers
FROM FilteredRoutes fr JOIN Route r ON fr.r_id = r.r_id
JOIN Airport a1 ON r.departure_airport = a1.a_id
JOIN Airport a2 ON r.arrival_airport = a2.a_id;

