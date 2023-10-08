WITH RatioData AS (
    SELECT
        geo_name,
        -- Age Groups
        COALESCE(MAX(CASE WHEN characteristic_id = 8 THEN c1_count_total ELSE NULL END), 0) AS total_population,
        -- Dwelling Types
        COALESCE(MAX(CASE WHEN characteristic_id = 41 THEN c1_count_total ELSE NULL END), 0) AS total_dwellings,
        -- Household Sizes
        COALESCE(MAX(CASE WHEN characteristic_id = 50 THEN c1_count_total ELSE NULL END), 0) AS total_households,
        -- After-tax Income Groups
        COALESCE(MAX(CASE WHEN characteristic_id = 171 THEN c1_count_total ELSE NULL END), 0) AS total_aged_15_and_over
    FROM fsa
    WHERE characteristic_id IN (8, 41, 50, 171) -- Summarizing base values
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
        ELSE f.c1_count_total
    END AS c1_count_total_ratio
    
FROM fsa f
JOIN RatioData r ON f.geo_name = r.geo_name
WHERE f.characteristic_id NOT IN (8, 41, 50, 171) -- Excluding base values used for ratio calculations
ORDER BY f.geo_name, f.characteristic_id;
