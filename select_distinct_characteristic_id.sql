SELECT DISTINCT characteristic_id, characteristic_name
FROM fsa 
WHERE characteristic_id IN (8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
							23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 41, 42, 43, 44, 45,
							46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 171, 174, 175, 176, 177,
							178, 179, 180, 181, 182, 183, 184, 185, 186)
ORDER BY characteristic_id;