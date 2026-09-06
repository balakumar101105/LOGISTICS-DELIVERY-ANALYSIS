CREATE TABLE delivery_logistics (
    delivery_id INT,
    delivery_partner VARCHAR(50),
    package_type VARCHAR(50),
    vehicle_type VARCHAR(30),
    delivery_mode VARCHAR(30),
    region VARCHAR(20),
    weather_condition VARCHAR(20),
    distance_km DECIMAL(10,2),
    package_weight_kg DECIMAL(10,2),
    delivery_time_hours INT,
    expected_time_hours INT,
    delayed VARCHAR(10),
    delivery_status VARCHAR(20),
    delivery_rating INT,
    delivery_cost DECIMAL(12,2)
);
SELECT COUNT(*) AS evaloo FROM delivery_logistics;

--nxt

SELECT 
    delayed,
    COUNT(*) AS evaloo,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM delivery_logistics
GROUP BY delayed
ORDER BY evaloo DESC;

--nxt

SELECT
    delivery_partner,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) AS delayed_deliveries,
    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) * 100.0/ COUNT( 2
    ) AS delay_rate
FROM delivery_logistics
GROUP BY delivery_partner
ORDER BY delay_rate DESC;
select * from delivery_logistics;

--nxt

SELECT
    CASE
        WHEN distance_km < 50 THEN '0-50 km'
        WHEN distance_km < 100 THEN '50-100 km'
        WHEN distance_km < 150 THEN '100-150 km'
        WHEN distance_km < 200 THEN '150-200 km'
        WHEN distance_km < 250 THEN '200-250 km'
        ELSE '250+ km'
    END AS distance_range,
    
    COUNT(*) AS total_deliveries,
    
    ROUND(AVG(delivery_time_hours), 2) AS avg_delivery_time,
    
    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS delay_rate

FROM delivery_logistics

GROUP BY distance_range

ORDER BY
    MIN(distance_km);

    --nxt

	SELECT
    package_type,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) AS delayed_deliveries,
    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS delay_rate
FROM delivery_logistics
GROUP BY package_type
ORDER BY delay_rate DESC;

--nxt

SELECT
    CASE
        WHEN distance_km < 50 THEN '0-50 km'
        WHEN distance_km < 100 THEN '50-100 km'
        WHEN distance_km < 150 THEN '100-150 km'
        WHEN distance_km < 200 THEN '150-200 km'
        WHEN distance_km < 250 THEN '200-250 km'
        ELSE '250+ km'
    END AS distance_range,

    COUNT(*) AS total_deliveries,

    ROUND(AVG(distance_km), 2) AS avg_distance_km,

    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost

FROM delivery_logistics

GROUP BY distance_range

ORDER BY MIN(distance_km);

--nxt

SELECT
    delivery_mode,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost,
    ROUND(AVG(distance_km), 2) AS avg_distance_km,
    ROUND(AVG(delivery_time_hours), 2) AS avg_delivery_time
FROM delivery_logistics
GROUP BY delivery_mode
ORDER BY avg_delivery_cost DESC;

--next

SELECT
    delivery_mode,
    ROUND(AVG(delivery_cost / distance_km), 2) AS avg_cost_per_km,
    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost,
    ROUND(AVG(distance_km), 2) AS avg_distance_km
FROM delivery_logistics
GROUP BY delivery_mode
ORDER BY avg_cost_per_km DESC;

--next

SELECT
    delivery_mode,
    weather_condition,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) AS delayed_deliveries,
    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS delay_rate
FROM delivery_logistics
GROUP BY delivery_mode, weather_condition
ORDER BY delivery_mode, delay_rate DESC;

--next

SELECT
    delivery_partner,
    COUNT(*) AS total_deliveries,

    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS delay_rate,

    ROUND(AVG(delivery_rating), 2) AS avg_rating,

    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost

FROM delivery_logistics

GROUP BY delivery_partner

ORDER BY delay_rate ASC;


--final KPI

SELECT
    COUNT(*) AS total_deliveries,

    SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END)
        AS delayed_deliveries,

    ROUND(
        SUM(CASE WHEN delayed = 'yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS overall_delay_rate,

    ROUND(AVG(delivery_rating), 2)
        AS avg_rating,

    ROUND(AVG(delivery_cost), 2)
        AS avg_delivery_cost,

    ROUND(AVG(distance_km), 2)
        AS avg_distance_km,

    ROUND(AVG(delivery_time_hours), 2)
        AS avg_delivery_time_hours

FROM delivery_logistics;