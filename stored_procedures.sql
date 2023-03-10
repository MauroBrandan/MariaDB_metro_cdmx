USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE calculate_distance_between_points(
    IN point_one POINT,
    point_two POINT,
    meters BOOLEAN
)
BEGIN

    IF meters THEN
        SELECT
        ST_Distance_Sphere(point_one, point_two) AS distance;
    ELSE
        SELECT
        ST_Distance_Sphere(point_one, point_two) / 1000 AS distance;
    END IF;

END //

DELIMITER ;