1. In what ways male and female students differ?
2. What factors influence students performance in exam ?
	1. It is important that they complete the preparatory courses.
	2. It is important for families to increase their education level and be open to learning.
	3. It is important that they have a standart plan for food
3. How to imporve the students performance in each test ?
6. avg test scores of students by gender
7. Distribution of scores by column for each test score
8. Does the parent level of education has any impact in the student score ?
9. Is the test preparation course helpful ?
10. Does the luch affect the student scores ?
11. is there any difference in scores between different ethnicities
12. Does lunch affect exam scores?


--------------------------------------------------------------------------------------------

select * 
from stud


-- # of students by gender 
select gender, 
count(gender) as num_students
from stud s 
group by gender 
order by  num_students desc;


-- # of students by race/ethnicity 
select "race/ethnicity", 
count("race/ethnicity") as num_groups
from stud s 
group by "race/ethnicity"  
order by num_groups desc;


-- # of students by "parental level of education" 
select "parental level of education" , 
count("parental level of education") as num_parental_lvl_edu
from stud s 
group by "parental level of education" 
order by num_parental_lvl_edu desc;


-- # of students by lunch 
select lunch, 
count(lunch) as num_lunch
from stud s 
group by lunch 
order by num_lunch desc;


-- # of students by "test preparation course" 
select "test preparation course" , 
count("test preparation course") as num_test_prep_course
from stud s 
group by "test preparation course"  
order by num_test_prep_course desc;


-- 2. What factors influence students performance in exam ?
select "race/ethnicity", 
"parental level of education", 
lunch, 
"test preparation course", 
avg("math score") as avg_math_score,
avg("reading score") as avg_reading_score,
avg("writing score") as avg_writing_score
from stud
group by "race/ethnicity", "parental level of education", lunch, "test preparation course" 
order by avg_math_score desc, avg_reading_score desc, avg_writing_score desc


-- avg test scores by gender
select gender, 
avg("math score") as avg_math_score,
avg("reading score") as avg_reading_score,
avg("writing score") as avg_writing_score
from stud s 
group by gender 
order by avg_math_score desc, avg_reading_score desc, avg_writing_score desc



-- avg test scores by race/ethnicity
select "race/ethnicity",
avg("math score") as avg_math_score,
avg("reading score") as avg_reading_score,
avg("writing score") as avg_writing_score
from stud s 
group by "race/ethnicity" 
order by avg_math_score desc, avg_reading_score desc, avg_writing_score desc


-- avg test scores by race/ethnicity and gender
select gender,
"race/ethnicity",
avg("math score") as avg_math_score,
avg("reading score") as avg_reading_score,
avg("writing score") as avg_writing_score
from stud s 
group by gender, "race/ethnicity" 
order by avg_math_score desc, avg_reading_score desc, avg_writing_score desc


-- avg test scores by parental level of education
select "parental level of education",
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by "parental level of education"
order by avg_math_score desc, avg_math_score desc, avg_math_score desc


-- avg test scores by parental level of education and gender
select gender,
"parental level of education",
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by gender, "parental level of education"
order by avg_math_score desc, avg_math_score desc, avg_math_score desc


-- avg test scores by test preparation course
select "test preparation course", 
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by "test preparation course"
order by avg_math_score desc, avg_math_score desc, avg_math_score desc


-- avg test scores by test preparation course and gender 
select gender,
"test preparation course", 
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by gender, "test preparation course"
order by avg_math_score desc, avg_math_score desc, avg_math_score desc


-- avg test scores by lunch
select lunch, 
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by lunch
order by avg_math_score desc, avg_math_score desc, avg_math_score desc


-- avg test scores by lunch and gender
select gender,
lunch, 
avg("math score") as avg_math_score,
avg("reading score") as avg_math_score,
avg("writing score") as avg_math_score
from stud s 
group by gender, lunch
order by avg_math_score desc, avg_math_score desc, avg_math_score desc
