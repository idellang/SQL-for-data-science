-Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet
-
-This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.
-
-In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.
-
-For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
-In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.
-
-
-
-Part 1: Yelp Dataset Profiling and Understanding
-
-1. Profile the data by finding the total number of records for each of the tables below:
-	
-i. Attribute table = 10000
-ii. Business table = 10000 
-iii. Category table = 10000 
-iv. Checkin table = 10000 
-v. elite_years table = 10000 
-vi. friend table = 10000 
-vii. hours table = 10000 
-viii. photo table = 10000 
-ix. review table = 10000 
-x. tip table = 10000 
-xi. user table = 10000 
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = id : 10000, 
ii. Hours = business_id : 1562
iii. Category = business_id : 2643
iv. Attribute = business_id: 1115
v. Review = id: 10000, business_id: 8090, user_id: 9581
vi. Checkin = business_id:493
vii. Photo = id: 10000 ,business_id:6493
viii. Tip = user_id: 537, business_id:3979
ix. User = id:10000
x. Friend = user_id: 11, friend_id: 9415
xi. Elite_years = user_id: 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: NO
	
	
	SQL code used to arrive at answer:
			SELECT * FROM user
				--check each column
				WHERE id IS NULL OR
				name IS NULL OR
				review_count IS NULL OR
				yelping_since IS NULL OR
				useful IS NULL OR
				funny IS NULL OR
				cool IS NULL OR
				fans IS NULL OR
				average_stars IS NULL OR
				compliment_hot IS NULL OR
				compliment_more IS NULL OR
				compliment_profile IS NULL OR
				compliment_cute IS NULL OR
				compliment_list IS NULL OR
				compliment_note IS NULL OR
				compliment_plain IS NULL OR
				compliment_cool IS NULL OR
				compliment_funny IS NULL OR
				compliment_writer IS NULL OR
				compliment_photos IS NULL
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:1 		max:5		avg:3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0		avg:3.6549 
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144 
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414 
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000		avg:24.2995 
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	SELECT city, SUM(review_count) AS `total review`
	FROM business
	GROUP BY city
	ORDER BY SUM(review_count)  DESC
	
	Copy and Paste the Result Below:
	
		+-----------------+--------------+
	| city            | total review |
	+-----------------+--------------+
	| Las Vegas       |        82854 |
	| Phoenix         |        34503 |
	| Toronto         |        24113 |
	| Scottsdale      |        20614 |
	| Charlotte       |        12523 |
	| Henderson       |        10871 |
	| Tempe           |        10504 |
	| Pittsburgh      |         9798 |
	| Montréal        |         9448 |
	| Chandler        |         8112 |
	| Mesa            |         6875 |
	| Gilbert         |         6380 |
	| Cleveland       |         5593 |
	| Madison         |         5265 |
	| Glendale        |         4406 |
	| Mississauga     |         3814 |
	| Edinburgh       |         2792 |
	| Peoria          |         2624 |
	| North Las Vegas |         2438 |
	| Markham         |         2352 |
	| Champaign       |         2029 |
	| Stuttgart       |         1849 |
	| Surprise        |         1520 |
	| Lakewood        |         1465 |
	| Goodyear        |         1155 |
	+-----------------+--------------+
	(Output limit exceeded, 25 of 362 total rows shown)
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

	SELECT stars, review_count FROM
	business
	WHERE city = 'Avon'


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

	+-------+--------------+
	| stars | review_count |
	+-------+--------------+
	|   2.5 |            3 |
	|   4.0 |            4 |
	|   5.0 |            3 |
	|   3.5 |            7 |
	|   1.5 |           10 |
	|   3.5 |           31 |
	|   4.5 |           31 |
	|   3.5 |           50 |
	|   2.5 |            3 |
	|   4.0 |           17 |
	+-------+--------------+


ii. Beachwood

SQL code used to arrive at answer:

	SELECT stars, review_count FROM
	business
	WHERE city = 'Beachwood'


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

	+-------+--------------+
	| stars | review_count |
	+-------+--------------+
	|   3.0 |            8 |
	|   3.0 |            3 |
	|   4.5 |           14 |
	|   5.0 |            6 |
	|   4.0 |           69 |
	|   4.5 |            3 |
	|   5.0 |            4 |
	|   2.0 |            8 |
	|   3.5 |            3 |
	|   3.5 |            3 |
	|   5.0 |            6 |
	|   2.5 |            3 |
	|   5.0 |            3 |
	|   5.0 |            4 |
	+-------+--------------+		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	SELECT id, name, SUM(review_count) AS `total count`
	FROM user
	GROUP BY id, name
	ORDER BY SUM(review_count) DESC
	LIMIT 3
		
		
	Copy and Paste the Result Below:
		+------------------------+--------+-------------+
	| id                     | name   | total count |
	+------------------------+--------+-------------+
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |        2000 |
	| -3s52C4zL_DHRK0ULG6qtg | Sara   |        1629 |
	| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |        1339 |
	+------------------------+--------+-------------+
		


8. Does posing more reviews correlate with more fans?
	

	Please explain your findings and interpretation of the results:
	
	It seems tho that those who reviewer more have more fans. This is the table with the most number of review count. 
	If we check those who did not review, most of them have no fans
	
		+------------------------+-----------+--------------+------+
	| id                     | name      | review_count | fans |
	+------------------------+-----------+--------------+------+
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
	| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |   50 |
	| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
	| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
	| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
	| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
	| -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |   16 |
	| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
	| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
	| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
	| -fUARDNuXAfrOn4WLSZLgA | Ed        |          904 |   38 |
	| -hKniZN2OdshWLHYuj21jQ | Nicole    |          864 |   43 |
	| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
	| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 |
	| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 |
	| -kO6984fXByyZm3_6z2JYg | Dominic   |          836 |   37 |
	| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
	| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
	| -l9giG8TSDBG1jnUBUXp5w | Alison    |          775 |   61 |
	| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 |
	| -AaBjWJYiQxXkCMDlXfPGw | Tim       |          702 |   35 |
	| -jt1ACMiZljnBFvS6RRvnA | L         |          696 |   10 |
	| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 |
	| -hxUwfo3cMnLTv-CAaP69A | Crissy    |          676 |   25 |
	| -H6cTbVxeIRYR-atxdielQ | Lyn       |          675 |   45 |
	+------------------------+-----------+--------------+------+
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Yes

	
	SQL code used to arrive at answer:
	
	SELECT has_love, COUNT(has_love)
	FROM
		(SELECT id,
		CASE
		WHEN lower(text) LIKE '%love%' THEN 1
		WHEN lower(text) LIKE '%hate%' THEN 0
		END AS `has_love`
		FROM review)
	GROUP BY has_love
	
		+----------+-----------------+
	| has_love | COUNT(has_love) |
	+----------+-----------------+
	|     None |               0 |
	|        0 |             178 |
	|        1 |            1780 |
	+----------+-----------------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
	SELECT id, name, SUM(fans) AS `num_fans`
	FROM user
	GROUP BY id, name
	ORDER BY SUM(fans) DESC
	LIMIT 10
	
	
	Copy and Paste the Result Below:
		+------------------------+-----------+----------+
	| id                     | name      | num_fans |
	+------------------------+-----------+----------+
	| -9I98YbNQnLdAmcYfb324Q | Amy       |      503 |
	| -8EnCioUmDygAbsYZmTeRQ | Mimi      |      497 |
	| --2vR0DIsmQ6WfcSzKWigw | Harald    |      311 |
	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |      253 |
	| -0IiMAZI2SsQ7VmyzJjokQ | Christine |      173 |
	| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |      159 |
	| -9bbDysuiWeo2VShFJJtcw | Cat       |      133 |
	| -FZBTkAZEXoP7CYvRV2ZwQ | William   |      126 |
	| -9da1xk7zgnnfO1uTVYGkA | Fran      |      124 |
	| -lh59ko3dxChBSZ9U7LfUw | Lissa     |      120 |
	+------------------------+-----------+----------+

	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

Yes, those who have higher stars have lower working hours. 

ii. Do the two groups you chose to analyze have a different number of reviews?
Those who are reviewed more have more working hours. The reason may be because they cater more custoemrs.         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
Yes. We can see that those who have more working hours may have more customers and are more reviewed. The reviews on these shops are less bias unlike
those who have high stars but only few review count

SQL code used for analysis:
	SELECT b.name, b.stars, b.review_count, h.hours
	FROM business b
	JOIN hours h
	ON b.id = h.business_id
	WHERE b.city = 'Las Vegas'
	GROUP BY(b.stars)
	
		+--------------------------------+-------+--------------+---------------------+
	| name                           | stars | review_count | hours               |
	+--------------------------------+-------+--------------+---------------------+
	| Walgreens                      |   2.5 |            6 | Saturday|8:00-22:00 |
	| Wingstop                       |   3.0 |          123 | Saturday|11:00-0:00 |
	| Hi Scores - Blue Diamond       |   3.5 |          105 | Saturday|0:00-0:00  |
	| Anthem Pediatrics              |   4.0 |           16 | Saturday|8:00-12:00 |
	| Red Rock Canyon Visitor Center |   4.5 |           32 | Saturday|8:00-16:30 |
	| Desert Medical Equipment       |   5.0 |            4 | Monday|8:00-17:00   |
	+--------------------------------+-------+--------------+---------------------+

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
Most closed stores are bakery and sweet shops whereas those who are open are related to hotels, entertainment, INNs, services, etc. This implies that bakery and
breakfast shops do not survive much in las vegas

SQL code used for analysis:
	SELECT b.name, b.stars, b.review_count, b.is_open, c.category
	FROM business b
	JOIN category c
	ON b.id = c.business_id
	WHERE b.city = 'Las Vegas'
	ORDER BY b.is_open

	+--------------------------------------+-------+--------------+---------+---------------------------------+
	| name                                 | stars | review_count | is_open | category                        |
	+--------------------------------------+-------+--------------+---------+---------------------------------+
	| Wooly Wonders                        |   3.5 |           11 |       0 | Knitting Supplies               |
	| Wooly Wonders                        |   3.5 |           11 |       0 | Shopping                        |
	| Sweet Ruby Jane Confections          |   4.0 |           30 |       0 | Food                            |
	| Sweet Ruby Jane Confections          |   4.0 |           30 |       0 | Chocolatiers & Shops            |
	| Sweet Ruby Jane Confections          |   4.0 |           30 |       0 | Bakeries                        |
	| Sweet Ruby Jane Confections          |   4.0 |           30 |       0 | Specialty Food                  |
	| Sweet Ruby Jane Confections          |   4.0 |           30 |       0 | Desserts                        |
	| Jacques Cafe                         |   4.0 |          168 |       0 | Restaurants                     |
	| Jacques Cafe                         |   4.0 |          168 |       0 | Vegetarian                      |
	| Jacques Cafe                         |   4.0 |          168 |       0 | French                          |
	| Jacques Cafe                         |   4.0 |          168 |       0 | American (New)                  |
	| Jacques Cafe                         |   4.0 |          168 |       0 | Breakfast & Brunch              |
	| Jacques Cafe                         |   4.0 |          168 |       0 | Sandwiches                      |
	| Jacques Cafe                         |   4.0 |          168 |       0 | Gluten-Free                     |
	| Hibachi-San                          |   4.5 |            3 |       0 | Restaurants                     |
	| Hibachi-San                          |   4.5 |            3 |       0 | Japanese                        |
	| Motors & More                        |   5.0 |            7 |       1 | Home Services                   |
	| Motors & More                        |   5.0 |            7 |       1 | Solar Installation              |
	| Motors & More                        |   5.0 |            7 |       1 | Heating & Air Conditioning/HVAC |
	| WorldMark Las Vegas - Spencer Street |   3.5 |           19 |       1 | Hotels & Travel                 |
	| WorldMark Las Vegas - Spencer Street |   3.5 |           19 |       1 | Resorts                         |
	| WorldMark Las Vegas - Spencer Street |   3.5 |           19 |       1 | Vacation Rentals                |
	| WorldMark Las Vegas - Spencer Street |   3.5 |           19 |       1 | Event Planning & Services       |
	| WorldMark Las Vegas - Spencer Street |   3.5 |           19 |       1 | Hotels                          |
	| Hi Scores - Blue Diamond             |   3.5 |          105 |       1 | Arts & Entertainment            |
	+--------------------------------------+-------+--------------+---------+---------------------------------+
(Output limit exceeded, 25 of 78 total rows shown)

         
ii. Difference 2:
There's not much difference between the average score of those shops who are open compared to those who are close. However, we can see that the number of 
review count is much higher for those that are open. This is obvious since you can only give your reviews for those shops that are open.

         
SQL code used for analysis:

	SELECT b.is_open, AVG(b.stars), SUM(b.review_count)
	FROM business b
	JOIN category c
	ON b.id = c.business_id
	WHERE b.city = 'Las Vegas'
	GROUP BY b.is_open
			 
		+---------+---------------+---------------------+
	| is_open |  AVG(b.stars) | SUM(b.review_count) |
	+---------+---------------+---------------------+
	|       0 |           4.0 |                1354 |
	|       1 | 4.03225806452 |                6913 |
	+---------+---------------+---------------------+		 

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
Rating prediction for a business.         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
We can conduct a predictive model using the various columns as the predictor and the star rating as the response. We can fit a model depending on the dataset available.
Check first the types of data and how each data relates to the response. We can choose a model that is resilient to unresponsive predictors like ensemble models. However, 
if we wanted to lessen the computation burden, we can estimate the predictive power of each predictor first, and filter those uninformative predictors.                           
                  
iii. Output of your finished dataset:
     +-----------+-------+--------------+--------------------+------------------+--------+-------+------+
| city      | stars | review_count | hours              | category         | useful | funny | cool |
+-----------+-------+--------------+--------------------+------------------+--------+-------+------+
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Shopping         |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Shopping         |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Food             |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Food             |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Seafood Markets  |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Seafood Markets  |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Fruits & Veggies |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Fruits & Veggies |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Ethnic Food      |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Ethnic Food      |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Market Stalls    |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Market Stalls    |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Farmers Market   |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Farmers Market   |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Specialty Food   |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Specialty Food   |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Public Markets   |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Public Markets   |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Meat Shops       |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Sunday|10:00-16:00 | Meat Shops       |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Friday|7:00-18:00  | Shopping         |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Friday|7:00-18:00  | Shopping         |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Friday|7:00-18:00  | Food             |      1 |     1 |    1 |
| Cleveland |   4.5 |          723 | Friday|7:00-18:00  | Food             |      0 |     0 |    0 |
| Cleveland |   4.5 |          723 | Friday|7:00-18:00  | Seafood Markets  |      1 |     1 |    1 |
+-----------+-------+--------------+--------------------+------------------+--------+-------+------+
(Output limit exceeded, 25 of 381 total rows shown)    
         
iv. Provide the SQL code you used to create your final dataset:

	SELECT b.city, b.stars, b.review_count,
	h.hours,
	c.category,
	r.text, r.useful, r.funny, r.cool
	FROM business b 
	JOIN hours h
	ON b.id = h.business_id
	JOIN category c
	ON b.id = c.business_id
	JOIN review r
	ON b.id = r.business_id