Calculate Conversions. From quiz to home try on, and from home try on to purchase

SELECT COUNT(*)
FROM quiz;

SELECT COUNT(*)
FROM home_try_on;

SELECT COUNT(*)
FROM purchase;


Calculate most common results of style quiz

SELECT question, response, COUNT(*)
FROM survey
GROUP BY question, response;


Calculate purchase rates of those that were sent pairs to try on (3 vs 5)

WITH funnel AS (
  SELECT quiz.user_id, home_try_on.user_id IS NOT NULL AS 'is_home_try_on', home_try_on.number_of_pairs, purchase.user_id IS NOT NULL AS 'is_purchase' 
FROM quiz
LEFT JOIN home_try_on
ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
ON quiz.user_id = purchase.user_id)

SELECT number_of_pairs, SUM(is_home_try_on), SUM(is_purchase)
FROM funnel
GROUP BY number_of_pairs;
