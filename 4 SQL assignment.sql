/* 1 Males responded to sruvey from India */
SELECT
    Gender,
    COUNT(Gender) as Total_Male
FROM personalized_info
WHERE Gender='Male\r' and CurrentCountry ='India';

/* 2 Females responded to survey India */

SELECT
    Gender,
    COUNT(Gender) as Total_Female
FROM personalized_info
WHERE Gender='Female\r'and CurrentCountry ='India';

/* 3 Genz influenced by parents from India*/

Select count(CareerInfluenceFactor) as Influenced_by_parents
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor ='My Parents'and CurrentCountry = 'India'; 

/* 4 Female Genz influenced by parents from India*/

Select count(CareerInfluenceFactor) as Influenced_by_parents
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor ='My Parents'and CurrentCountry = 'India' and Gender = 'Female\r'; 

/* 5 Male Genz influenced by parents from India*/

Select count(CareerInfluenceFactor) as Influenced_by_parents
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor ='My Parents'and CurrentCountry = 'India' and Gender = 'Male\r'; 

/* 6 Male & Female Genz influenced by parents from India*/

Select    Gender,
    COUNT(Gender) as Influenced_by_parents
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor ='My Parents'and CurrentCountry = 'India'
GROUP BY Gender; 

/* 7 Genz influenced by media and influencers in India*/

Select    
    COUNT(CareerInfluenceFactor) as Inf_by_Media_Influencers
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE (CareerInfluenceFactor ='Influencers who had successful careers'or CareerInfluenceFactor = 'Social Media like LinkedIn')and CurrentCountry='India';

/* 8 Male & Female Genz influenced by media and influencers in India*/

Select    
    COUNT(CareerInfluenceFactor) as Inf_by_Media_Influencers,
    Gender
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE (CareerInfluenceFactor ='Influencers who had successful careers'or CareerInfluenceFactor = 'Social Media like LinkedIn')and CurrentCountry='India'
GROUP BY Gender;

/* 9 Genz influenced by media  looking to go abroad*/

Select    
    COUNT(CareerInfluenceFactor) as Inf_by_Media_Influencers
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor = 'Social Media like LinkedIn' and HigherEducationAbroad = 'Yes, I wil';

/* 10 Genz influenced by circle and looking to go abroad*/

Select    
    COUNT(CareerInfluenceFactor) as Inf_by_Media_Influencers
From learning_aspirations 
INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor = 'People from my circle, but not family members' and HigherEducationAbroad = 'Yes, I wil';
