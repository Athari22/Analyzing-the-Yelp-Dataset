Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table =  10000
v. elite_years table =  10000
vi. friend table =  10000
vii. hours table =  10000
viii. photo table =  10000
ix. review table =  10000
x. tip table = 10000
xi. user table =  10000



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =   10000 distinct records for primary key ‘id’ of Business table
ii. Hours =  1562  distinct records for foreign key ‘business_id’
iii. Category = 2643   distinct records for foreign key ‘business_id’
iv. Attribute =  1115   distinct records for foreign key ‘business_id’
v. Review =   8090  distinct records for foreign key ‘business_id’
vi. Checkin =  493 distinct records for foreign key ‘user_id’
vii. Photo =  6493  distinct records for foreign key ‘business_id’
viii. Tip = 537 distinct records for foreign key ‘user_id’
ix. User = 10000  distinct records for primary key ‘id’ of user table
x. Friend = 9415 distinct records for foreign key ‘Friend _id’ of Friend table
xi. Elite_years = 2780  distinct records for foreign key ‘user_id’

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: NO


	SQL code used to arrive at answer:
	SELECT *

FROM user

WHERE
      id IS NULL OR
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

		min:1		max:5		avg:  3.7082


	ii. Table: Business, Column: Stars

		min: 1.0		max: 5.0 		avg: 3.6549


	iii. Table: Tip, Column: Likes

		min:0		max:2		avg: 0.0144


	iv. Table: Checkin, Column: Count

		min:1		max:53		avg: 1.9414


	v. Table: User, Column: Review_count

		min:0		max:  2000		avg:24.2995



5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		SELECT city, SUM(review_count) AS most_review
		FROM business
		GROUP BY city
		ORDER BY most_review DESC ;


 	Copy and Paste the Result Below:
	+-----------------+-------------+
	| city            | most_review |
	+-----------------+-------------+
	| Las Vegas       |       82854 |
	| Phoenix         |       34503 |
	| Toronto         |       24113 |
	| Scottsdale      |       20614 |
	| Charlotte       |       12523 |
	| Henderson       |       10871 |
	| Tempe           |       10504 |
	| Pittsburgh      |        9798 |
	| Montréal        |        9448 |
	| Chandler        |        8112 |
	| Mesa            |        6875 |
	| Gilbert         |        6380 |
	| Cleveland       |        5593 |
	| Madison         |        5265 |
	| Glendale        |        4406 |
	| Mississauga     |        3814 |
	| Edinburgh       |        2792 |
	| Peoria          |        2624 |
	| North Las Vegas |        2438 |
	| Markham         |        2352 |
	| Champaign       |        2029 |
	| Stuttgart       |        1849 |
	| Surprise        |        1520 |
	| Lakewood        |        1465 |
	| Goodyear        |        1155 |
	+-----------------+-------------+
	(Output limit exceeded, 25 of 362 total rows shown)


6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
	SELECT stars, count(stars) as counts FROM business
	WHERE city='Avon'
	GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+--------+
| stars | counts |
+-------+--------+
|   1.5 |      1 |
|   2.5 |      2 |
|   3.5 |      3 |
|   4.0 |      2 |
|   4.5 |      1 |
|   5.0 |      1 |
+-------+--------+

ii. Beachwood

SQL code used to arrive at answer:
SELECT stars, count(stars) as counts FROM business
WHERE city='Beachwood'
GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+--------+
| stars | counts |
+-------+--------+
|   2.0 |      1 |
|   2.5 |      1 |
|   3.0 |      2 |
|   3.5 |      2 |
|   4.0 |      1 |
|   4.5 |      2 |
|   5.0 |      5 |
+-------+--------+


7. Find the top 3 users based on their total number of reviews:

	SQL code used to arrive at answer:
	SELECT name, max(review_count) AS top_user FROM user
	GROUP BY name
	ORDER BY top_user DESC
	LIMIT 3


	Copy and Paste the Result Below:
	+--------+----------+
	| name   | top_user |
	+--------+----------+
	| Gerald |     2000 |
	| Sara   |     1629 |
	| Yuri   |     1339 |
	+--------+----------+



8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	1) As can be seen from the column of the review_count and fans in the table below, having a high review_count doesn’t have a correlation to more fans.

		SELECT  name, review_count, fans FROM user
		GROUP BY fans
		ORDER BY review_count DESC

		+-----------+--------------+------+
		| name      | review_count | fans |
		+-----------+--------------+------+
		| Gerald    |         2000 |  253 |
		| Sara      |         1629 |   50 |
		| Yuri      |         1339 |   76 |
		| .Hon      |         1246 |  101 |
		| William   |         1215 |  126 |
		| Harald    |         1153 |  311 |
		| Roanna    |         1039 |  104 |
		| Mimi      |          968 |  497 |
		| Christine |          930 |  173 |
		| Nicole    |          864 |   43 |
		| Fran      |          862 |  124 |
		| Mark      |          861 |  115 |
		| Christina |          842 |   85 |
		| Dominic   |          836 |   37 |
		| Lissa     |          834 |  120 |
		| Lisa      |          813 |  159 |
		| Alison    |          775 |   61 |
		| Sui       |          754 |   78 |
		| Lyn       |          675 |   45 |
		| Jim       |          671 |   57 |
		| Grace     |          663 |   30 |
		| Jennifer  |          657 |   33 |
		| Jenn      |          657 |   62 |
		| Richard   |          643 |   24 |
		| Susanna   |          639 |   44 |
		+-----------+--------------+------+
		(Output limit exceeded, 25 of 90 total rows shown)


9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There more review with love word.
	+------+
	| LOVE |
	+------+
	| 1780 |
	+------+

	+------+
	| hate |
	+------+
	|  232 |
	+------+


	SQL code used to arrive at answer:
		SELECT count(*) AS LOVE FROM review
		WHERE text like '%love%'

		SELECT count(*) AS hate
		FROM review
		WHERE text like '%hate%'


10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		SELECT  name, fans FROM user
		ORDER BY fans DESC lIMIT 10


	Copy and Paste the Result Below:
	+-----------+------+
	| name      | fans |
	+-----------+------+
	| Amy       |  503 |
	| Mimi      |  497 |
	| Harald    |  311 |
	| Gerald    |  253 |
	| Christine |  173 |
	| Lisa      |  159 |
	| Cat       |  133 |
	| William   |  126 |
	| Fran      |  124 |
	| Lissa     |  120 |
	+-----------+------+



Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

I have chosen the city as Toronto and category  as Food. The query returns 3 food company details in which one of them are in the 2-3 stars category and the other two with 4-5 stars.

i. Do the two groups you chose to analyze have a different distribution of hours?
	For the Cabin Fever  they open at  Saturday from16:00 to 2:00  with 4.5 stars. And for  Halo Brewery  it open at Saturday 11:00 to 21:00 with 4.5 stars. Finlay Loblaws open at Saturday 8:00 to 22:00 with 2.5 stars.

ii. Do the two groups you chose to analyze have a different number of reviews?
    Yes. The reviews for 2-3 starred food company are less when compared to others with 4-5 stars.


iii. Are you able to infer anything from the location data provided between these two groups? Explain.
     No. Every food company is in different location.

SQL code used for analysis:

SELECT
		b.name,
		b.city,
		b.stars,
		b.review_count,
		b.address,
		b.postal_code,
		c.category,
		h.hours
FROM business AS b
		inner join category AS c
		ON b.id = c.business_id
		inner join hours AS h on h.business_id = b.id
WHERE
		b.city = 'Toronto' AND c.category = 'Food'
GROUP BY b.stars
ORDER BY b.stars DESC

	+--------------+---------+-------+--------------+----------------------+-------------+----------+----------------------+
	| name         | city    | stars | review_count | address              | postal_code | category | hours                |
	+--------------+---------+-------+--------------+----------------------+-------------+----------+----------------------+
	| Cabin Fever  | Toronto |   4.5 |           26 | 1669 Bloor Street W  | M6P 1A6     | Food     | Saturday|16:00-2:00  |
	| Halo Brewery | Toronto |   4.0 |           15 | 247 Wallace Avenue   | M6H 1V5     | Food     | Saturday|11:00-21:00 |
	| Loblaws      | Toronto |   2.5 |           10 | 2280 Dundas Street W | M6R 1X3     | Food     | Saturday|8:00-22:00  |
	+--------------+---------+-------+--------------+----------------------+-------------+----------+----------------------+

2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

i. Difference 1:
   open :
		+---------------+
		|    AVG(stars) |
		+---------------+
		| 3.67900943396 |
		+---------------+


	 close:
		+---------------+
		|    AVG(stars) |
		+---------------+
		| 3.52039473684 |
		+---------------+


ii. Difference 2:
    open:
		+-------------------+
		| AVG(review_count) |
		+-------------------+
		|     31.7570754717 |
		+-------------------+

		close:
		+-------------------+
		| AVG(review_count) |
		+-------------------+
		|     23.1980263158 |
		+-------------------+



SQL code used for analysis:
	SELECT AVG(stars) FROM business
	WHERE is_open=1

	SELECT AVG(stars) FROM business
	WHERE is_open=0

	SELECT AVG(review_count)  FROM business
	WHERE is_open=0

	SELECT AVG(review_count)  FROM business
	WHERE is_open=0



3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:

i. Indicate the type of analysis you chose to do:
  To find if city and review has effect relationship at stars in category
  as food company .

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
    For my data I need is city, review and star column from business table likewise a category column from category table.
		As category I choose food. furthermore  I wanted the data to be order by review to see if the change or not.


iii. Output of your finished dataset:
+------------+-------+--------------+----------+
| city       | stars | review_count | category |
+------------+-------+--------------+----------+
| Phoenix    |   4.0 |          431 | Food     |
| Scottsdale |   4.0 |           91 | Food     |
| Pittsburgh |   4.5 |           72 | Food     |
| Cleveland  |   4.0 |           49 | Food     |
| Middleton  |   4.0 |           37 | Food     |
| Tolleson   |   4.0 |           23 | Food     |
| York       |   3.0 |            8 | Food     |
| Oakville   |   5.0 |            7 | Food     |
| Las Vegas  |   2.5 |            6 | Food     |
| Chandler   |   5.0 |            5 | Food     |
| Tempe      |   2.5 |            5 | Food     |
| Willoughby |   3.5 |            5 | Food     |
| Paw Creek  |   3.5 |            3 | Food     |
| Toronto    |   3.5 |            3 | Food     |
+------------+-------+--------------+----------+


iv. Provide the SQL code you used to create your final dataset:

SELECT
b.city,
b.stars,
b.review_count,
c.category
FROM
business AS b
left join category AS c
ON
b.id=c.business_id
WHERE
category='Food'
GROUP BY b.city
ORDER BY b.review_count DESC
