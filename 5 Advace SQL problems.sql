/* 1. what percentage of male and female Genz wants to go to office everyday*/
select 
((sum(case when Gender = 'Male\r' then 1 else 0 end)/count(*))*100) as Male_percentage, 
((sum(case when Gender = 'Female\r' then 1 else 0 end)/count(*))*100) as Female_percentage
 from learning_aspirations
LEFT JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
Where PreferredWorkingEnvironment = 'Every Day Office Environment' and  (Gender='Male\r' or Gender='Female\r')
GROUP BY PreferredWorkingEnvironment;

/*2. what percentage of genz who have choosen their career in Business operation are most likely to be influenced by parents*/

select count(*)*100/ (select count(*)
from learning_aspirations) as Genz_chose_business_ops
from learning_aspirations
where ClosestAspirationalCareer like 'Business Operations%' and CareerInfluenceFactor = 'My Parents';

/*3. % of genz prefer opting for higher studies */

select count(*)*100/ (select count(*)
from learning_aspirations) as Genz_HigherStudies, Gender
from learning_aspirations
Left join personalized_info on learning_aspirations.ResponseID = personalized_info.ResponseID 
Where HigherEducationAbroad  like 'Yes, I wil' and (Gender='Male\r' or Gender='Female\r') Group by Gender;

/*4 */
select count(*)*100/ (select count(*)
from mission_aspirations) as Genz_work_company, Gender
from mission_aspirations
Left join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID 
where MisalignedMissionLikelihood='Will work for them' or MisalignedMissionLikelihood='Will NOT work for them'
group by Gender;

/*5 */
select 
((sum(case when Gender = 'Female\r' then 1 else 0 end)/count(*))*100) as Female_percentage, PreferredWorkingEnvironment
 from learning_aspirations
Left join personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
group by PreferredWorkingEnvironment;

/*6*/
SELECT
    count(Gender) as Total_Female
FROM learning_aspirations
JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
JOIN mission_aspirations ON learning_aspirations.ResponseID = mission_aspirations.ResponseID
WHERE Gender='Female\r 'and NoSocialImpactLikelihood <=5 or ClosestAspirationalCareer =''
group by Gender;

/* 7 */
select 
Count(Gender) as Total_Male
from personalized_info
Left join learning_aspirations on personalized_info.ResponseID = learning_aspirations.ResponseID 
Where HigherEducationAbroad  like 'Yes, I wil' and (Gender='Male\r' ) and CareerInfluenceFactor='My Parents' Group by Gender;

/*8*/
select count(*)*100/ sum(count(*)) over () as Genz_No_SocialImpact,
gender
from personalized_info
join learning_aspirations on personalized_info.ResponseID = learning_aspirations.ResponseID
join mission_aspirations on mission_aspirations.ResponseID = personalized_info.ResponseID
where learning_aspirations.HigherEducationAbroad like 'Yes%' and mission_aspirations.NoSocialImpactLikelihood between 8 and 10
group by Gender;

/*9*/

select count(Gender) as Overall_Count , gender,
count(*)*100/sum(count(*)) over() as Overall_Percentage
from personalized_info
join manager_aspirations on personalized_info.ResponseID = manager_aspirations.ResponseID
where manager_aspirations.PreferredWorkSetup like '%team%'
Group by Gender;

/*10*/
select WorkLikelihood3Years,
Gender, 
count(Gender) as Overall_Count,
count(*)*100/sum(count(*)) over() as Overall_Percentage
from manager_aspirations
join personalized_info on manager_aspirations.ResponseID = personalized_info.ResponseID
group by Gender, WorkLikelihood3Years;

/*11*/
select WorkLikelihood3Years,
CurrentCountry,
count(Gender) as Overall_Count,
count(*)*100/sum(count(*)) over() as Overall_Percentage
from manager_aspirations
join personalized_info on manager_aspirations.ResponseID = personalized_info.ResponseID
group by WorkLikelihood3Years , CurrentCountry;

/*12*/

Select Gender, Count(Gender) as Total_Genz,
(case when ExpectedSalary3Years = '11k to 15k' then 11000
when ExpectedSalary3Years = '16k to 20k' then 16000
when ExpectedSalary3Years = '21k to 25k' then 21000
when ExpectedSalary3Years = '26k to 30k' then 26000
when ExpectedSalary3Years = '31k to 40k' then 31000
when ExpectedSalary3Years = '41k to 50k' then 41000
when ExpectedSalary3Years = '5K to 10K' then 5000
when ExpectedSalary3Years = '>50k' then 50000 end) as Avg_3yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
group by Gender, ExpectedSalary3Years;

/*13*/

Select Gender, Count(Gender) as Total_Genz,
case when ExpectedSalary5Years ='30k to 50k' then 30000 
when ExpectedSalary5Years = '50k to 70k' then 50000
when ExpectedSalary5Years = '71k to 90k' then 71000 
when ExpectedSalary5Years = '91k to 110k' then 91000
when ExpectedSalary5Years = '111k to 130k' then 111000     
when ExpectedSalary5Years = '>151k' then 151000 end as Avg_5yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
group by Gender, ExpectedSalary5Years;

/*14*/
Select Gender, Count(Gender) as Total_Genz,
(case when ExpectedSalary3Years = '11k to 15k' then 15000
when ExpectedSalary3Years = '16k to 20k' then 20000
when ExpectedSalary3Years = '21k to 25k' then 25000
when ExpectedSalary3Years = '26k to 30k' then 30000
when ExpectedSalary3Years = '31k to 40k' then 40000
when ExpectedSalary3Years = '41k to 50k' then 50000
when ExpectedSalary3Years = '5K to 10K' then 10000
when ExpectedSalary3Years = '>50k' then 50000 end) as Avg_highbar_3yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
group by Gender, ExpectedSalary3Years;

/*15*/
Select Gender, Count(Gender) as Total_Genz,
case when ExpectedSalary5Years ='30k to 50k' then 50000
when ExpectedSalary5Years = '50k to 70k' then 70000
when ExpectedSalary5Years = '71k to 90k' then 90000
when ExpectedSalary5Years = '91k to 110k' then 110000
when ExpectedSalary5Years = '111k to 130k' then 130000
when ExpectedSalary5Years = '>151k' then 151000 end as Avg_highbar_5yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
group by Gender, ExpectedSalary5Years;

/*16*/

Select Gender, Count(Gender) as Total_Genz,
(case when ExpectedSalary3Years = '11k to 15k' then 11000
when ExpectedSalary3Years = '16k to 20k' then 16000
when ExpectedSalary3Years = '21k to 25k' then 21000
when ExpectedSalary3Years = '26k to 30k' then 26000
when ExpectedSalary3Years = '31k to 40k' then 31000
when ExpectedSalary3Years = '41k to 50k' then 41000
when ExpectedSalary3Years = '5K to 10K' then 5000
when ExpectedSalary3Years = '>50k' then 50000 end) as Avg_3yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
where CurrentCountry = 'India'
group by Gender, ExpectedSalary3Years;

/*17*/

Select Gender, Count(Gender) as Total_Genz,
case when ExpectedSalary5Years ='30k to 50k' then 30000 
when ExpectedSalary5Years = '50k to 70k' then 50000
when ExpectedSalary5Years = '71k to 90k' then 71000 
when ExpectedSalary5Years = '91k to 110k' then 91000
when ExpectedSalary5Years = '111k to 130k' then 111000     
when ExpectedSalary5Years = '>151k' then 151000 end as Avg_5yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
where CurrentCountry = 'India'
group by Gender, ExpectedSalary5Years;

/*18*/
Select Gender, Count(Gender) as Total_Genz,
(case when ExpectedSalary3Years = '11k to 15k' then 15000
when ExpectedSalary3Years = '16k to 20k' then 20000
when ExpectedSalary3Years = '21k to 25k' then 25000
when ExpectedSalary3Years = '26k to 30k' then 30000
when ExpectedSalary3Years = '31k to 40k' then 40000
when ExpectedSalary3Years = '41k to 50k' then 50000
when ExpectedSalary3Years = '5K to 10K' then 10000
when ExpectedSalary3Years = '>50k' then 50000 end) as Avg_highbar_3yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
where CurrentCountry = 'India'
group by Gender, ExpectedSalary3Years;

/*19*/
Select Gender, Count(Gender) as Total_Genz,
case when ExpectedSalary5Years ='30k to 50k' then 50000
when ExpectedSalary5Years = '50k to 70k' then 70000
when ExpectedSalary5Years = '71k to 90k' then 90000
when ExpectedSalary5Years = '91k to 110k' then 110000
when ExpectedSalary5Years = '111k to 130k' then 130000
when ExpectedSalary5Years = '>151k' then 151000 end as Avg_highbar_5yr_Sal_Exp
from mission_aspirations
join personalized_info on mission_aspirations.ResponseID = personalized_info.ResponseID
where CurrentCountry = 'India'
group by Gender, ExpectedSalary5Years;

/*20*/
select Gender, 
count(Gender) as Overall_Count,
count(*)*100/sum(count(*)) over() as per_of_genz_working
from personalized_info
join mission_aspirations on personalized_info.ResponseID = mission_aspirations.ResponseID
where MisalignedMissionLikelihood = 'Will work for them' and  CurrentCountry = 'India'
Group by  Gender;