-- models/trips_per_property.sql

WITH stations AS (
    SELECT * FROM {{ ref('stg_stations') }}
),
trips AS(
    SELECT * FROM {{ ref('stg_trips') }}
)
SELECT
  stations.property_type,
  COUNT(*) AS trips,
FROM AS trips t
JOIN stations AS s
ON 
    t.start_station_id = s.station_id
GROUP BY 
    stations.property_type