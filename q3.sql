-- Assuming that the average passengers requiring visas between country A and country B is calculated by # people requiring visas / # of flights
DROP VIEW IF EXISTS PairAverages CASCADE;
DROP VIEW IF EXISTS GlobalAverage CASCADE;


CREATE VIEW PairAverages AS (
	SELECT a1.country AS c1, a2.country AS c2, COUNT(p.pass_id) / COUNT(DISTINCT sf.f_id) AS avg
	FROM Flight f JOIN Route r ON f.r_id = r.r_id
	JOIN Airport a1 ON r.departure_airport = a1.a_id
	JOIN Airport a2 ON r.arrival_airport = a2.a_id
	JOIN ScheduledFlight sf ON f.f_id = sf.f_id
	JOIN Ticket t ON sf.t_id = t.t_id
	JOIN Passenger p ON t.pass_id = p.pass_id
	JOIN Visas v ON v.pass_id = p.pass_id
	WHERE a1.country <> a2.country AND v.visa = a2.country
	GROUP BY a1.country, a2.country
);

CREATE VIEW GlobalAverage AS (
	SELECT AVG(avg)
	FROM PairAverages
);

SELECT pa.c1, pa.c2, pa.avg
FROM PairAverages pa
WHERE pa.avg * 4 <= ALL(SELECT * FROM GlobalAverage);
