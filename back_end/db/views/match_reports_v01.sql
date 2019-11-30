SELECT up1.name as username, up2.name as match, count(*) as num_matches
    FROM user_preferences up1
    JOIN user_preferences up2
    ON up1.interest=up2.interest
    GROUP BY up1.name,up2.name
    ORDER BY num_matches DESC