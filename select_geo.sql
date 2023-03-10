USE metro_cdmx;

-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875), -- Balderas
    POINT(-99.13303971, 19.42543703) -- Pino Suárez
) AS distance;

-- Calculamos en kilometros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;


-- Calculamos de forma dinamica con consultas anidadas
SELECT
ST_Distance_Sphere(
    (
		SELECT `location` from `locations`
		WHERE `station_id` = (
			SELECT `id` from `stations`
			WHERE name = "Balderas"
		)
    ),
    (
		SELECT `location` from `locations`
		WHERE `station_id` = (
			SELECT `id` from `stations`
			WHERE name = "Pino Suárez"
		)
    )
) / 1000 AS distance;

-- Calculamos de forma dinamica con un Inner Join
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Balderas"
    ),
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Pino Suarez"
    )
) / 1000 AS distance;