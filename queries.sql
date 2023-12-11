-- 1 First, use SELECT * from both tables and use your knowledge of queries
use learners_mockup_data;
select * from users;
select * from progress;

-- 2 What are the Top 25 schools (.edu domains)?
SELECT email_domain,COUNT(*)
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY email_domain
ORDER BY COUNT(*) DESC
LIMIT 25;

-- 2.1 How many .edu learners are located in New York?
SELECT city,COUNT(*)
FROM users
WHERE email_domain LIKE '%.edu' AND city = 'New York';

-- 2.2 The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?
SELECT mobile_app,COUNT(*)
FROM users
WHERE mobile_app = 'mobile-user';

-- 3. The data type of the sign_up_at column is DATETIME. It is for storing a date/time value in the database.
-- SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.
-- It takes two arguments: strftime(format, column)
-- Now, using this function, query for the sign up counts for each hour. 
SELECT sign_up_at,strftime('%H', sign_up_at),Count(*)
FROM users
GROUP BY 2
ORDER BY  2;

-- 4. Join the two tables using JOIN and then see what you can dig out of the data!
-- 4.1 Do different schools (.edu domains) prefer different courses?
SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_javascript,p.learn_java 
FROM  users u 
LEFT JOIN    progress p 
ON u.user_id = p.user_id 
GROUP BY  1 
ORDER BY  1 ASC;

-- 4.2 What courses are the New Yorkers students taking?
SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_javascript,p.learn_java 
FROM  users u 
LEFT JOIN    progress p 
ON u.user_id = p.user_id 
WHERE u.city = 'New York'
GROUP BY  1 
ORDER BY  1 ASC;

-- 4.3 What courses are the Chicago students taking? 
SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_javascript,p.learn_java 
FROM  users u 
LEFT JOIN    progress p 
ON u.user_id = p.user_id 
WHERE u.city = 'Chicago'
GROUP BY  1 
ORDER BY  1 ASC;

