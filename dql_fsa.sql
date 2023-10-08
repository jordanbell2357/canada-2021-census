SELECT DISTINCT characteristic_id, characteristic_name
FROM fsa 
WHERE characteristic_id IN (4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
							23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 41, 42, 43, 44, 45,
							46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 171, 174, 175, 176, 177,
							178, 179, 180, 181, 182, 183, 184, 185, 186, 1529, 1530, 1531,
							1532, 1533, 1534, 1535, 1536)
ORDER BY characteristic_id;

WITH RatioData AS (
    SELECT
        geo_name,
        -- Age Groups
        COALESCE(SUM(CASE WHEN characteristic_id = 8 THEN c1_count_total ELSE 0 END), 0) AS total_population,
        -- Dwelling Types
        COALESCE(SUM(CASE WHEN characteristic_id = 4 THEN c1_count_total ELSE 0 END), 0) AS total_dwellings,
        -- Household Sizes
        COALESCE(SUM(CASE WHEN characteristic_id = 50 THEN c1_count_total ELSE 0 END), 0) AS total_households,
        -- After-tax Income Groups
        COALESCE(SUM(CASE WHEN characteristic_id = 171 THEN c1_count_total ELSE 0 END), 0) AS total_aged_15_and_over,
        -- Immigrants
        COALESCE(SUM(CASE WHEN characteristic_id = 1529 THEN c1_count_total ELSE 0 END), 0) AS total_immigrants
    FROM fsa
    WHERE characteristic_id IN (4, 8, 50, 171, 1529) -- Summarizing base values
    GROUP BY geo_name
)

SELECT
    f.geo_name,
    f.characteristic_id,
    f.characteristic_name,
    
    -- Age Groups
    CASE 
        WHEN f.characteristic_id BETWEEN 9 AND 33 THEN 
            CASE WHEN r.total_population = 0 THEN 0 ELSE f.c1_count_total / r.total_population END
        -- Dwelling Types
        WHEN f.characteristic_id BETWEEN 42 AND 49 THEN 
            CASE WHEN r.total_dwellings = 0 THEN 0 ELSE f.c1_count_total / r.total_dwellings END
        -- Household Sizes
        WHEN f.characteristic_id BETWEEN 51 AND 55 THEN 
            CASE WHEN r.total_households = 0 THEN 0 ELSE f.c1_count_total / r.total_households END
        -- After-tax Income Groups
        WHEN f.characteristic_id BETWEEN 174 AND 186 THEN 
            CASE WHEN r.total_aged_15_and_over = 0 THEN 0 ELSE f.c1_count_total / r.total_aged_15_and_over END
        -- Immigrants
        WHEN f.characteristic_id BETWEEN 1530 AND 1536 THEN 
            CASE WHEN r.total_immigrants = 0 THEN 0 ELSE f.c1_count_total / r.total_immigrants END
        ELSE f.c1_count_total
    END AS c1_count_total_ratio
    
FROM fsa f
JOIN RatioData r ON f.geo_name = r.geo_name
WHERE f.characteristic_id NOT IN (4, 8, 50, 171, 1529) -- Excluding base values used for ratio calculations
ORDER BY f.geo_name, f.characteristic_id;