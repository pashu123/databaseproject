--DB report 
--data cleaning for the hackerrank survey data

update datanumeric
set q4others = ''
where q4education = '5'
update datavalues
set q4others = ''
where q4education = 'College graduate'
delete from codebookquestions
where survey_question is null
delete from qomapping
where survey_question is null
update datanumeric
set q0004_other = ''
where q4education <> '0'
update datavalues
set q0004_other = ''
where q4education <> 'Other'
update datanumeric
set q0004_other = 'college'
where q4education = '0' and q0004_other = 'Undergraduate'
select q4education = q0004_other
from datanumeric
where q4education = '' and q0004_other = 'Undergraduate'
update datavalues
set q0004_other = 'college'
where q4education = 'Other'
update datanumeric
set q0004_other = 'colgrad'
where q4education = '0' and q0004_other in 
('B.E','Undergraduate degree','University Graduate','Software Engineer', 'Bachelor', 'Bachelor degree', 'Bachelor''s degree', 'bachelor', 'Bachelors', 'Bachelor''s',
'Bachelors (Undergraduate)','Under graduate','Undergraduate','undergraduate', 'Btech', 'B.Tech','B.tech', 'btech', 'Engineering','BE', 'Beachelor of engineering', 'BE IT', 'Bsc', 'B.Sc',
'BSc Degree','BSc in Computer Science', 'B.Tech (CSE)', 'B.Tech in CSE', 'Btech in ece');
update datavalues
set q0004_other = 'colgrad'
where q4education = 'Other' and q0004_other in 
('B.E','Undergraduate degree','University Graduate','Software Engineer', 'Bachelor', 'Bachelor degree', 'Bachelor''s degree', 'bachelor', 'Bachelors', 'Bachelor''s',
'Bachelors (Undergraduate)','Under graduate','Undergraduate','undergraduate', 'Btech', 'B.Tech','B.tech', 'btech', 'Engineering','BE', 'Beachelor of engineering', 'BE IT', 'Bsc', 'B.Sc',
'BSc Degree','BSc in Computer Science', 'B.Tech (CSE)', 'B.Tech in CSE', 'Btech in ece','Baccalauréat', 'Engineer') 
----------------------------------------------------------
update datanumeric
set q0004_other = 'sschool'
where q4education = '0' and q0004_other in ('BSc in IT second year student', 'B.Tech 2nd year', 'Btech Cse', 'BTECH persuing', 'Engineering','Almost bachelor', 'Atm studing at a university');
update datanumeric
set q0004_other = '' and q4education = '5'
where q4education = '0' and q0004_other = 'colgrad'
update datavalues
set q0004_other = '' and q4education = 'College graduate'
where q4education = 'Other' and q0004_other = 'colgrad'
update datanumeric
set q0004_other = '' and q4education = '3'
where q4education = '0' and q0004_other = 'sschool'
update datavalues
set q0004_other = '' and q4education = 'Some college'
where q4education = 'Other' and q0004_other = 'sschool'
-----------------------------------------------------------
insert into qomapping
values('q1AgeBeginCoding', '0', 'Unknown');
update datanumeric
set q1agebegincoding = '0'
where q1agebegincoding = '#NULL!';
update datavalues
set q1agebegincoding = 'Unknown'
where q1agebegincoding = '#NULL!';
-----------------------------------------------------------
insert into qomapping
values('q2Age', '0', 'Unrevealed');
update datanumeric
set q2age = '0'
where q2age = '#NULL!';
update datavalues
set q2age = 'Unrevealed'
where q2age = '#NULL!';
------------------------------------------------------------
update qomapping
set label = '05 - 10 years old'
where data_field = 'q1AgeBeginCoding' and value = '1';
------------------------------------------------------------
update datavalues 
set q5degreefocus = 'Other'
where q5degreefocus = '';
update datavalues 
set q5degreefocus = 'Other'
where q5degreefocus = '#NULL!';
------------------------------------------------------------
update datavalues
set q0006_other = 'On the job'
where q6learncodeother <> '' and q0006_other in ('company training', 'Training', 'Training at my first company', 'in a job', 'in my first job','mostly on the job','Though my job', 'Job experience', 'job academy', 'On job training','At Work', 'Office work', 'training on the job at work','working','Workplace', 'workplace', 'Working experience', 'Work training', 'Working', 'on the job', 'At work','Comapany training','On-the-job', 'In work', 'on the job training', 'On the job training','Working!!','Work related', 'work experiance','from work', 'Training at the workplace', 'Ont the job', 'in the job' ,'training in my first job','Work Experience','Work experience','work experience' ,'Employer', 'colleagues', 'On Job', 'On job');
update datavalues
set q0006_other = 'Family (Parents, Siblings, Relatives)'
where q6learncodeother <> '' and q0006_other in (
'From my brother',
'From my brother as he is a developer in IT company.',
'inspired from brother', 'My mom taught me some',
'my brother', 'My brother', 'My brother start to teaching me', 'Brother influence'
,'Through my brother', 'Pestered my mother to teach me',
'Uncle teached me','Parents', 'parents', 'Parent', 'Parents taught me', 'Taught by parent', 'Taught by parents');
where q6learncodeother <> '' and q0006_other in ('Father', 'Father taught me', 'my father', 'from my father', 'my father and sister taught me', 'My father and sister taught me', 'My Father taught me', 'from my father');
----------------------------------------------------------------
update datavalues
set q8student = 'Non-Students'
where q8student = '';
update qomapping 
set label = 'Non-Students'
where data_field = 'q8Student' and value = '0';
____________________________________________________________
update datavalues
set q9CurrentRole = ''
where q9CurrentRole = '#NULL!';
update datanumeric
set q9CurrentRole = '0'
where q9CurrentRole = '#NULL!';
----------
update datanumeric 
set q5DegreeFocus = '0'
where q5DegreeFocus = '#NULL!';
----------
insert into qomapping
values('q3Gender', '0', 'Unrevealed');
update datavalues 
set q3Gender = 'Unrevealed'
where q3Gender = '#NULL!';
update datanumeric 
set q3Gender = '0'
where q3Gender = '#NULL!';
_______________________________________
update datavalues
set q12JobCritOther = ''
where q12JobCritOther = '#NULL!';
update datanumeric
set q12JobCritOther = '0'
where q12JobCritOther = '#NULL!';
----------
insert into qomapping
values('q14GoodReflecAbilities', '0', 'Don''t Know');
update datavalues 
set q14GoodReflecAbilities = 'Don''t Know'
where q14GoodReflecAbilities = '#NULL!';
update datanumeric 
set q14GoodReflecAbilities = '0'
where q14GoodReflecAbilities = '#NULL!';
-----------
insert into qomapping values('q17HirChaInterviews', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaHardAssessSkills', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaNotEnoughTalent', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaNoDiversCandidates', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaCompfromCompanies', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaJobDescript', '0', 'Not really a challenge');
insert into qomapping values('q17HirChaOther', '0', 'No other challenge');
insert into qomapping values('q17HirChaInterviews', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaHardAssessSkills', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaNotEnoughTalent', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaNoDiversCandidates', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaCompfromCompanies', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaJobDescript', '2', 'Not Hiring Manager');
insert into qomapping values('q17HirChaOther', '2', 'Not Hiring Manager');
----------------------------------------------------------------
update datavalues 
set q17HirChaCompfromCompanies = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaCompfromCompanies = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaCompfromCompanies = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaCompfromCompanies = '';
update datanumeric
set q17HirChaCompfromCompanies = '0'
where q16HiringManager = '1' and q17HirChaCompfromCompanies <> '1';
---------------------------------------------------------------
update datavalues 
set q17HirChaHardAssessSkills = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaHardAssessSkills = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaHardAssessSkills = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaHardAssessSkills = '';
update datanumeric
set q17HirChaHardAssessSkills = '0'
where q16HiringManager = '1' and q17HirChaHardAssessSkills <> '1';
----------------------------------------------------------------
update datavalues 
set q17HirChaNotEnoughTalent = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaNotEnoughTalent = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaNotEnoughTalent = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaNotEnoughTalent = '';
update datanumeric
set q17HirChaNotEnoughTalent = '0'
where q16HiringManager = '1' and q17HirChaNotEnoughTalent <> '1';
												  
select --dv.respondentid, 
dv.q17HirChaNotEnoughTalent, dn.q17HirChaNotEnoughTalent, dv.q16HiringManager 
,count(dv.respondentid)
from datanumeric as dn, datavalues as dv 
where dn.respondentid = dv.respondentid --and dv.q16hiringmanager = 'No' and dn.q17HirChaCompfromCompanies = '1'
group by 1,2,3;
----------------------------------------------------------------
update datavalues 
set q17HirChaNoDiversCandidates = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaNoDiversCandidates = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaNoDiversCandidates = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaNoDiversCandidates = '';
update datanumeric
set q17HirChaNoDiversCandidates = '0'
where q16HiringManager = '1' and q17HirChaNoDiversCandidates <> '1';
----------------------------------------------------------
update datavalues 
set q17HirChaInterviews = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaInterviews = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaInterviews = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaInterviews = '';
update datanumeric
set q17HirChaInterviews = '0'
where q16HiringManager = '1' and q17HirChaInterviews <> '1';
--------------------------------------------------------------------
update datavalues 
set q17HirChaJobDescript = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaJobDescript = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaJobDescript = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaJobDescript = '';
update datanumeric
set q17HirChaJobDescript = '0'
where q16HiringManager = '1' and q17HirChaJobDescript <> '1';
------------------------------------------------------------------
update datavalues 
set q17HirChaJobDescript = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaJobDescript = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaJobDescript = 'Not really a challenge'
where q16HiringManager = 'Yes' and q17HirChaJobDescript = '';
update datanumeric
set q17HirChaJobDescript = '0'
where q16HiringManager = '1' and q17HirChaJobDescript <> '1';
------------------------------------------------------------------
update datavalues 
set q17HirChaOther = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q17HirChaOther = '2'
where q16HiringManager = '2';
update datavalues 
set q17HirChaOther = 'No other challenge'
where q16HiringManager = 'Yes' and q17HirChaOther = '';
update datanumeric
set q17HirChaOther = '0'
where q16HiringManager = '1' and q17HirChaOther <> '1';
------------------------------------------------------------------
insert into qomapping values('q18NumDevelopHireWithinNextYear', '0', 'Not Hiring Manager');
update datavalues 
set q18NumDevelopHireWithinNextYear = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q18NumDevelopHireWithinNextYear = '0'
where q16HiringManager = '2';
update datavalues 
set q18NumDevelopHireWithinNextYear = '0 - 10'
where q16HiringManager = 'Yes' and q18NumDevelopHireWithinNextYear = '#NULL!';
update datanumeric
set q18NumDevelopHireWithinNextYear = '1'
where q16HiringManager = '1' and q18NumDevelopHireWithinNextYear = '#NULL!';
------------------------------------------------------------------
__________________________________________________________________
insert into qomapping values('q19TalToolResumeScreen', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolReferral', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolHackerRank', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolOtherProbSolv', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolPersTest', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolRemoteorLiveIntTool', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolOutsourceHumIntPanel', '0', 'Don''t use this tool');
insert into qomapping values('q19TalToolOther', '0', 'No other tool');
insert into qomapping values('q19TalToolResumeScreen', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolReferral', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolHackerRank', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolOtherProbSolv', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolPersTest', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolRemoteorLiveIntTool', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolOutsourceHumIntPanel', '2', 'Not Hiring Manager');
insert into qomapping values('q19TalToolOther', '2', 'Not Hiring Manager');
---------------------------------------------------------------------
update datavalues 
set q19TalToolResumeScreen = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolResumeScreen = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolResumeScreen = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolResumeScreen = '';
update datanumeric
set q19TalToolResumeScreen = '0'
where q16HiringManager = '1' and q19TalToolResumeScreen <> '1';
							  
---------------------------------------------------------------------
update datavalues 
set q19TalToolReferral = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolReferral = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolReferral = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolReferral = '';
update datanumeric
set q19TalToolReferral = '0'
where q16HiringManager = '1' and q19TalToolReferral <> '1';
---------------------------------------------------------------------
update datavalues 
set q19TalToolHackerRank = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolHackerRank = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolHackerRank = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolHackerRank = '';
update datanumeric
set q19TalToolHackerRank = '0'
where q16HiringManager = '1' and q19TalToolHackerRank <> '1';
---------------------------------------------------------------------
update datavalues 
set q19TalToolOtherProbSolv = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolOtherProbSolv = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolOtherProbSolv = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolOtherProbSolv = '';
update datanumeric
set q19TalToolOtherProbSolv = '0'
where q16HiringManager = '1' and q19TalToolOtherProbSolv <> '1';
--------------------------------------------------------------------
update datavalues 
set q19TalToolPersTest = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolPersTest = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolPersTest = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolPersTest = '';
update datanumeric
set q19TalToolPersTest = '0'
where q16HiringManager = '1' and q19TalToolPersTest <> '1';
---------------------------------------------------------------------
update datavalues 
set q19TalToolRemoteorLiveIntTool = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolRemoteorLiveIntTool = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolRemoteorLiveIntTool = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolRemoteorLiveIntTool = '';
update datanumeric
set q19TalToolRemoteorLiveIntTool = '0'
where q16HiringManager = '1' and q19TalToolRemoteorLiveIntTool <> '1';
---------------------------------------------------------------------
update datavalues 
set q19TalToolOutsourceHumIntPanel = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolOutsourceHumIntPanel = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolOutsourceHumIntPanel = 'Don''t use this tool'
where q16HiringManager = 'Yes' and q19TalToolOutsourceHumIntPanel = '';
update datanumeric
set q19TalToolOutsourceHumIntPanel = '0'
where q16HiringManager = '1' and q19TalToolOutsourceHumIntPanel <> '1';
---------------------------------------------------------------------
update datavalues 
set q19TalToolOther = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q19TalToolOther = '2'
where q16HiringManager = '2';
update datavalues 
set q19TalToolOther = 'No other tool'
where q16HiringManager = 'Yes' and q19TalToolOther = '';
update datanumeric
set q19TalToolOther = '0'
where q16HiringManager = '1' and q19TalToolOther <> '1';
---------------------------------------------------------------------------------------------------
insert into qomapping values('q20CandYearExp', '0', 'Not top 3');
insert into qomapping values('q20CandCompScienceDegree', '0', 'Not top 3');
insert into qomapping values('q20CandCodingBootcamp', '0', 'Not top 3');
insert into qomapping values('q20CandSkillCert', '0', 'Not top 3');
insert into qomapping values('q20CandHackerRankActivity', '0', 'Not top 3');
insert into qomapping values('q20CandOtherCodingCommAct', '0', 'Not top 3');
insert into qomapping values('q20CandGithubPersProj', '0', 'Not top 3');
insert into qomapping values('q20CandOpenSourceContrib', '0', 'Not top 3');
insert into qomapping values('q20CandHackathonPart', '0', 'Not top 3');
insert into qomapping values('q20CandPrevWorkExp', '0', 'Not top 3');
insert into qomapping values('q20CandPrestigeDegree', '0', 'Not top 3');
insert into qomapping values('q20CandLinkInSkills', '0', 'Not top 3');
insert into qomapping values('q20CandGithubPersProj2', '0', 'Not top 3');
insert into qomapping values('q20Other', '0', 'Not top 3');
--------------------------------------------------------------------------------------------------
insert into qomapping values('q20CandYearExp', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandCompScienceDegree', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandCodingBootcamp', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandSkillCert', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandHackerRankActivity', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandOtherCodingCommAct', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandGithubPersProj', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandOpenSourceContrib', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandHackathonPart', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandPrevWorkExp', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandPrestigeDegree', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandLinkInSkills', '2', 'Not Hiring Manager');
insert into qomapping values('q20CandGithubPersProj2', '2', 'Not Hiring Manager');
insert into qomapping values('q20Other', '2', 'Not Hiring Manager');
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandYearExp = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandYearExp = '2'
where q16HiringManager = '2';
update datavalues
set q20CandYearExp = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandYearExp = '';
update datanumeric
set q20CandYearExp = '0'
where q16HiringManager = '1' and q20CandYearExp <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandCompScienceDegree = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandCompScienceDegree = '2'
where q16HiringManager = '2';
update datavalues
set q20CandCompScienceDegree = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandCompScienceDegree = '';
update datanumeric
set q20CandCompScienceDegree = '0'
where q16HiringManager = '1' and q20CandCompScienceDegree <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandCodingBootcamp = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandCodingBootcamp = '2'
where q16HiringManager = '2';
update datavalues
set q20CandCodingBootcamp = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandCodingBootcamp = '';
update datanumeric
set q20CandCodingBootcamp = '0'
where q16HiringManager = '1' and q20CandCodingBootcamp <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandSkillCert = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandSkillCert = '2'
where q16HiringManager = '2';
update datavalues
set q20CandSkillCert = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandSkillCert = '';
update datanumeric
set q20CandSkillCert = '0'
where q16HiringManager = '1' and q20CandSkillCert <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandHackerRankActivity = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandHackerRankActivity = '2'
where q16HiringManager = '2';
update datavalues
set q20CandHackerRankActivity = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandHackerRankActivity = '';
update datanumeric
set q20CandHackerRankActivity = '0'
where q16HiringManager = '1' and q20CandHackerRankActivity <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandOtherCodingCommAct = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandOtherCodingCommAct = '2'
where q16HiringManager = '2';
update datavalues
set q20CandOtherCodingCommAct = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandOtherCodingCommAct = '';
update datanumeric
set q20CandOtherCodingCommAct = '0'
where q16HiringManager = '1' and q20CandOtherCodingCommAct <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandGithubPersProj = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandGithubPersProj = '2'
where q16HiringManager = '2';
update datavalues
set q20CandGithubPersProj = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandGithubPersProj = '';
update datanumeric
set q20CandGithubPersProj = '0'
where q16HiringManager = '1' and q20CandGithubPersProj <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandOpenSourceContrib = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandOpenSourceContrib = '2'
where q16HiringManager = '2';
update datavalues
set q20CandOpenSourceContrib = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandOpenSourceContrib = '';
update datanumeric
set q20CandOpenSourceContrib = '0'
where q16HiringManager = '1' and q20CandOpenSourceContrib <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandHackathonPart = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandHackathonPart = '2'
where q16HiringManager = '2';
update datavalues
set q20CandHackathonPart = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandHackathonPart = '';
update datanumeric
set q20CandHackathonPart = '0'
where q16HiringManager = '1' and q20CandHackathonPart <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandPrevWorkExp = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandPrevWorkExp = '2'
where q16HiringManager = '2';
update datavalues
set q20CandPrevWorkExp = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandPrevWorkExp = '';
update datanumeric
set q20CandPrevWorkExp = '0'
where q16HiringManager = '1' and q20CandPrevWorkExp <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandPrestigeDegree = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandPrestigeDegree = '2'
where q16HiringManager = '2';
update datavalues
set q20CandPrestigeDegree = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandPrestigeDegree = '';
update datanumeric
set q20CandPrestigeDegree = '0'
where q16HiringManager = '1' and q20CandPrestigeDegree <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandLinkInSkills = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandLinkInSkills = '2'
where q16HiringManager = '2';
update datavalues
set q20CandLinkInSkills = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandLinkInSkills = '';
update datanumeric
set q20CandLinkInSkills = '0'
where q16HiringManager = '1' and q20CandLinkInSkills <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20CandGithubPersProj2 = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20CandGithubPersProj2 = '2'
where q16HiringManager = '2';
update datavalues
set q20CandGithubPersProj2 = 'Not top 3'
where q16HiringManager = 'Yes' and q20CandGithubPersProj2 = '';
update datanumeric
set q20CandGithubPersProj2 = '0'
where q16HiringManager = '1' and q20CandGithubPersProj2 <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q20Other = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q20Other = '2'
where q16HiringManager = '2';
update datavalues
set q20Other = 'Not top 3'
where q16HiringManager = 'Yes' and q20Other = '';
update datanumeric
set q20Other = '0'
where q16HiringManager = '1' and q20Other <> '1';
--------------------------------------------------------------------------------------------------
insert into qomapping values('q21CoreCompProbSolv', '0', 'Not necessary');
insert into qomapping values('q21CoreCompProgLang', '0', 'Not necessary');
insert into qomapping values('q21CoreCompFrameworkProf', '0', 'Not necessary');
insert into qomapping values('q21CoreCompDebugging', '0', 'Not necessary');
insert into qomapping values('q21CoreCompCodebaseNav', '0', 'Not necessary');
insert into qomapping values('q21CoreCompPerfOpt', '0', 'Not necessary');
insert into qomapping values('q21CoreCompCodeReview', '0', 'Not necessary');
insert into qomapping values('q21CoreCompDatabaseDesign', '0', 'Not necessary');
insert into qomapping values('q21CoreCompSysDesign', '0', 'Not necessary');
insert into qomapping values('q21CoreCompTesting', '0', 'Not necessary');
--------------------------------------------------------------------------------------------------
insert into qomapping values('q21CoreCompProbSolv', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompProgLang', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompFrameworkProf', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompDebugging', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompCodebaseNav', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompPerfOpt', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompCodeReview', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompDatabaseDesign', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompSysDesign', '2', 'Not Hiring Manager');
insert into qomapping values('q21CoreCompTesting', '2', 'Not Hiring Manager');
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompProbSolv = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompProbSolv = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompProbSolv = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompProbSolv = '';
update datanumeric
set q21CoreCompProbSolv = '0'
where q16HiringManager = '1' and q21CoreCompProbSolv <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompProgLang = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompProgLang = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompProgLang = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompProgLang = '';
update datanumeric
set q21CoreCompProgLang = '0'
where q16HiringManager = '1' and q21CoreCompProgLang <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompFrameworkProf = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompFrameworkProf = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompFrameworkProf = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompFrameworkProf = '';
update datanumeric
set q21CoreCompFrameworkProf = '0'
where q16HiringManager = '1' and q21CoreCompFrameworkProf <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompDebugging = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompDebugging = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompDebugging = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompDebugging = '';
update datanumeric
set q21CoreCompDebugging = '0'
where q16HiringManager = '1' and q21CoreCompDebugging <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompCodebaseNav = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompCodebaseNav = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompCodebaseNav = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompCodebaseNav = '';
update datanumeric
set q21CoreCompCodebaseNav = '0'
where q16HiringManager = '1' and q21CoreCompCodebaseNav <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompPerfOpt = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompPerfOpt = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompPerfOpt = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompPerfOpt = '';
update datanumeric
set q21CoreCompPerfOpt = '0'
where q16HiringManager = '1' and q21CoreCompPerfOpt <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompCodeReview = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompCodeReview = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompCodeReview = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompCodeReview = '';
update datanumeric
set q21CoreCompCodeReview = '0'
where q16HiringManager = '1' and q21CoreCompCodeReview <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompDatabaseDesign = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompDatabaseDesign = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompDatabaseDesign = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompDatabaseDesign = '';
update datanumeric
set q21CoreCompDatabaseDesign = '0'
where q16HiringManager = '1' and q21CoreCompDatabaseDesign <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompSysDesign = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompSysDesign = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompSysDesign = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompSysDesign = '';
update datanumeric
set q21CoreCompSysDesign = '0'
where q16HiringManager = '1' and q21CoreCompSysDesign <> '1';
--------------------------------------------------------------------------------------------------
update datavalues
set q21CoreCompTesting = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q21CoreCompTesting = '2'
where q16HiringManager = '2';
update datavalues
set q21CoreCompTesting = 'Not necessary'
where q16HiringManager = 'Yes' and q21CoreCompTesting = '';
update datanumeric
set q21CoreCompTesting = '0'
where q16HiringManager = '1' and q21CoreCompTesting <> '1';
--------------------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfAgnostic', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfC', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfCPlusPlus', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfJava', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPython', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfRuby', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfJavascript', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfCSharp', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfGo', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfScala', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPerl', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfSwift', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPascal', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfClojure', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPHP', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfHaskell', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfLua', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfR', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfOther', '0', 'Not necessary');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfAgnostic', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfC', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfCPlusPlus', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfJava', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPython', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfRuby', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfJavascript', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfCSharp', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfGo', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfScala', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPerl', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfSwift', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPascal', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfClojure', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfPHP', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfHaskell', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfLua', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfR', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
insert into qomapping values('q22LangProfOther', '2', 'Not Hiring Manager');
---------------------------------------------------------------------------------------
update datavalues
set q22LangProfAgnostic = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfAgnostic = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfAgnostic = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfAgnostic = 'Not necessary';
update datanumeric
set q22LangProfAgnostic = '0'
where q16HiringManager = '1' and q22LangProfAgnostic <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfC = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfC = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfC = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfC = 'Not necessary';
update datanumeric
set q22LangProfC = '0'
where q16HiringManager = '1' and q22LangProfC <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfCPlusPlus = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfCPlusPlus = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfCPlusPlus = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfCPlusPlus = 'Not necessary';
update datanumeric
set q22LangProfCPlusPlus = '0'
where q16HiringManager = '1' and q22LangProfCPlusPlus <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfJava = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfJava = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfJava = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfJava = 'Not necessary';
update datanumeric
set q22LangProfJava = '0'
where q16HiringManager = '1' and q22LangProfJava <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfPython = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfPython = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfPython = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPython = 'Not necessary';
update datanumeric
set q22LangProfPython = '0'
where q16HiringManager = '1' and q22LangProfPython <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfRuby = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfRuby = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfRuby = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfRuby = 'Not necessary';
update datanumeric
set q22LangProfRuby = '0'
where q16HiringManager = '1' and q22LangProfRuby <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfJavascript = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfJavascript = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfJavascript = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfJavascript = 'Not necessary';
update datanumeric
set q22LangProfJavascript = '0'
where q16HiringManager = '1' and q22LangProfJavascript <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfCSharp = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfCSharp = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfCSharp = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfCSharp = 'Not necessary';
update datanumeric
set q22LangProfCSharp = '0'
where q16HiringManager = '1' and q22LangProfCSharp <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfGo = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfGo = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfGo = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfGo = 'Not necessary';
update datanumeric
set q22LangProfGo = '0'
where q16HiringManager = '1' and q22LangProfGo <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfScala = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfScala = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfScala = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfScala = 'Not necessary';
update datanumeric
set q22LangProfScala = '0'
where q16HiringManager = '1' and q22LangProfScala <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfPerl = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfPerl = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfPerl = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPerl = 'Not necessary';
update datanumeric
set q22LangProfPerl = '0'
where q16HiringManager = '1' and q22LangProfPerl <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfSwift = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfSwift = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfSwift = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfSwift = 'Not necessary';
update datanumeric
set q22LangProfSwift = '0'
where q16HiringManager = '1' and q22LangProfSwift <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfPascal = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfPascal = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfPascal = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPascal = 'Not necessary';
update datanumeric
set q22LangProfPascal = '0'
where q16HiringManager = '1' and q22LangProfPascal <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfClojure = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfClojure = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfClojure = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfClojure = 'Not necessary';
update datanumeric
set q22LangProfClojure = '0'
where q16HiringManager = '1' and q22LangProfClojure <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfPHP = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfPHP = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfPHP = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPHP = 'Not necessary';
update datanumeric
set q22LangProfPHP = '0'
where q16HiringManager = '1' and q22LangProfPHP <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfHaskell = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfHaskell = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfHaskell = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfHaskell = 'Not necessary';
update datanumeric
set q22LangProfHaskell = '0'
where q16HiringManager = '1' and q22LangProfHaskell <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfLua = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfLua = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfLua = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfLua = 'Not necessary';
update datanumeric
set q22LangProfLua = '0'
where q16HiringManager = '1' and q22LangProfLua <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfR = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfR = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfR = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfR = 'Not necessary';
update datanumeric
set q22LangProfR = '0'
where q16HiringManager = '1' and q22LangProfR <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q22LangProfOther = 'Not Hiring Manager'
where q16HiringManager = 'No';
update datanumeric
set q22LangProfOther = '2'
where q16HiringManager = '2';
update datavalues
set q22LangProfOther = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfOther = 'Not necessary';
update datanumeric
set q22LangProfOther = '0'
where q16HiringManager = '1' and q22LangProfOther <> '1';
------------------------------------------------------------------------------------------
update datavalues
set q24vimoremacs = ''
where q24vimoremacs = '#NULL!';
update datanumeric 
set q24vimoremacs = '0'
where q24vimoremacs = '#NULL!';
update datavalues
set q27EmergingTechSkill = ''
where q27EmergingTechSkill = '#NULL!';
update datanumeric 
set q27EmergingTechSkill = '0'
where q27EmergingTechSkill = '#NULL!';
-----------------------------------------------------------
update datavalues
set q25LangOcaml = 'Missing or Neither'
where q25LangOcaml = '';
update datavalues
set q25LangCSharp = 'Missing or Neither'
where q25LangCSharp = '';
update datavalues
set q25LangC = 'Missing or Neither'
where q25LangC = '';
update datavalues
set q25LangKotlin = 'Missing or Neither'
where q25LangKotlin = '';
update datavalues
set q25LangHaskell = 'Missing or Neither'
where q25LangHaskell = '';
update datavalues
set q25LangTypescript = 'Missing or Neither'
where q25LangTypescript = '';
update datavalues
set q25LangR = 'Missing or Neither'
where q25LangR = '';
update datavalues
set q25LangRust = 'Missing or Neither'
where q25LangRust = '';
update datavalues
set q25LangErlang = 'Missing or Neither'
where q25LangErlang = '';
update datavalues
set q25LangCPlusPlus = 'Missing or Neither'
where q25LangCPlusPlus = '';
update datavalues
set q25LangJava = 'Missing or Neither'
where q25LangJava = '';
update datavalues
set q25LangGo = 'Missing or Neither'
where q25LangGo = '';
update datavalues
set q25LangJavascript = 'Missing or Neither'
where q25LangJavascript = '';
update datavalues
set q25LangRuby = 'Missing or Neither'
where q25LangRuby = '';
update datavalues
set q25LangSwift = 'Missing or Neither'
where q25LangSwift = '';
update datavalues
set q25LangPHP = 'Missing or Neither'
where q25LangPHP = '';
update datavalues
set q25LangPerl = 'Missing or Neither'
where q25LangPerl = '';
update datavalues
set q25LangPascal = 'Missing or Neither'
where q25LangPascal = '';
update datavalues
set q25LangJulia = 'Missing or Neither'
where q25LangJulia = '';
update datavalues
set q25LangClojure = 'Missing or Neither'
where q25LangClojure = '';
update datavalues
set q25Scala = 'Missing or Neither'
where q25Scala = '';
update datavalues
set q25LangLua = 'Missing or Neither'
where q25LangLua = '';
update datavalues
set q25LangPython = 'Missing or Neither'
where q25LangPython = '';
---------------------------------------------------    
insert into qomapping values
('q26FrameLearnPyramid2', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnPyramid', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnExpressJS', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnAngularJS', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnDjango2', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnVueDotjs', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnASP', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnEmber', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnNodeDotjs', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnPadrino', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnRubyMotion', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnNetCore', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnDjango', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnRubyonRails', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnSpring', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnCocoa', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnMetero', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnJSF', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnPadrino2', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnStruts', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnReactNative', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnBackboneDotjs', '0', 'Missing or Neither');
insert into qomapping values
('q26FrameLearnReact', '0', 'Missing or Neither');
update datavalues
set q26FrameLearnPyramid2 = 'Missing or Neither'
where q26FrameLearnPyramid2 = '';
update datavalues
set q26FrameLearnPyramid = 'Missing or Neither'
where q26FrameLearnPyramid = '';
update datavalues
set q26FrameLearnExpressJS = 'Missing or Neither'
where q26FrameLearnExpressJS = '';
update datavalues
set q26FrameLearnAngularJS = 'Missing or Neither'
where q26FrameLearnAngularJS = '';
update datavalues
set q26FrameLearnDjango2 = 'Missing or Neither'
where q26FrameLearnDjango2 = '';
update datavalues
set q26FrameLearnVueDotjs = 'Missing or Neither'
where q26FrameLearnVueDotjs = '';
update datavalues
set q26FrameLearnASP = 'Missing or Neither'
where q26FrameLearnASP = '';
update datavalues
set q26FrameLearnEmber = 'Missing or Neither'
where q26FrameLearnEmber = '';
update datavalues
set q26FrameLearnNodeDotjs = 'Missing or Neither'
where q26FrameLearnNodeDotjs = '';
update datavalues
set q26FrameLearnPadrino = 'Missing or Neither'
where q26FrameLearnPadrino = '';
update datavalues
set q26FrameLearnRubyMotion = 'Missing or Neither'
where q26FrameLearnRubyMotion = '';
update datavalues
set q26FrameLearnNetCore = 'Missing or Neither'
where q26FrameLearnNetCore = '';
update datavalues
set q26FrameLearnDjango = 'Missing or Neither'
where q26FrameLearnDjango = '';
update datavalues
set q26FrameLearnRubyonRails = 'Missing or Neither'
where q26FrameLearnRubyonRails = '';
update datavalues
set q26FrameLearnSpring = 'Missing or Neither'
where q26FrameLearnSpring = '';
update datavalues
set q26FrameLearnCocoa = 'Missing or Neither'
where q26FrameLearnCocoa = '';
update datavalues
set q26FrameLearnMetero = 'Missing or Neither'
where q26FrameLearnMetero = '';
update datavalues
set q26FrameLearnJSF = 'Missing or Neither'
where q26FrameLearnJSF = '';
update datavalues
set q26FrameLearnPadrino2 = 'Missing or Neither'
where q26FrameLearnPadrino2 = '';
update datavalues
set q26FrameLearnStruts = 'Missing or Neither'
where q26FrameLearnStruts = '';
update datavalues
set q26FrameLearnReactNative = 'Missing or Neither'
where q26FrameLearnReactNative = '';
update datavalues
set q26FrameLearnBackboneDotjs = 'Missing or Neither'
where q26FrameLearnBackboneDotjs = '';
update datavalues
set q26FrameLearnReact = 'Missing or Neither'
where q26FrameLearnReact = '';
---------------------------------------------------   
insert into qomapping values ('q28LoveJulia', '0', 'Neutral');
insert into qomapping values ('q28LoveJavascript', '0', 'Neutral');
insert into qomapping values ('q28LoveR', '0', 'Neutral');
insert into qomapping values ('q28LoveLua', '0', 'Neutral');
insert into qomapping values ('q28LoveJava', '0', 'Neutral');
insert into qomapping values ('q28LoveCPlusPlus', '0', 'Neutral');
insert into qomapping values ('q28LoveC', '0', 'Neutral');
insert into qomapping values ('q28LoveOCaml', '0', 'Neutral');
insert into qomapping values ('q28LovePerl', '0', 'Neutral');
insert into qomapping values ('q28LoveErlang', '0', 'Neutral');
insert into qomapping values ('q28LoveKotlin', '0', 'Neutral');
insert into qomapping values ('q28LovePHP', '0', 'Neutral');
insert into qomapping values ('q28LoveRuby', '0', 'Neutral');
insert into qomapping values ('q28LoveHaskell', '0', 'Neutral');
insert into qomapping values ('q28LovePascal', '0', 'Neutral');
insert into qomapping values ('q28LoveGo', '0', 'Neutral');
insert into qomapping values ('q28LoveCSharp', '0', 'Neutral');
insert into qomapping values ('q28LoveSwift', '0', 'Neutral');
insert into qomapping values ('q28LoveScala', '0', 'Neutral');
insert into qomapping values ('q28LoveClojure', '0', 'Neutral');
insert into qomapping values ('q28LovePython', '0', 'Neutral');
insert into qomapping values ('q28LoveTypescript', '0', 'Neutral');
insert into qomapping values ('q28LoveRust', '0', 'Neutral');
update datavalues
set q28LoveJulia = 'Neutral'
where q28LoveJulia = '';
update datavalues
set q28LoveJavascript = 'Neutral'
where q28LoveJavascript = '';
update datavalues
set q28LoveR = 'Neutral'
where q28LoveR = '';
update datavalues
set q28LoveLua = 'Neutral'
where q28LoveLua = '';
update datavalues
set q28LoveJava = 'Neutral'
where q28LoveJava = '';
update datavalues
set q28LoveCPlusPlus = 'Neutral'
where q28LoveCPlusPlus = '';
update datavalues
set q28LoveC = 'Neutral'
where q28LoveC = '';
update datavalues
set q28LoveOCaml = 'Neutral'
where q28LoveOCaml = '';
update datavalues
set q28LovePerl = 'Neutral'
where q28LovePerl = '';
update datavalues
set q28LoveErlang = 'Neutral'
where q28LoveErlang = '';
update datavalues
set q28LoveKotlin = 'Neutral'
where q28LoveKotlin = '';
update datavalues
set q28LovePHP = 'Neutral'
where q28LovePHP = '';
update datavalues
set q28LoveRuby = 'Neutral'
where q28LoveRuby = '';
update datavalues
set q28LoveHaskell = 'Neutral'
where q28LoveHaskell = '';
update datavalues
set q28LovePascal = 'Neutral'
where q28LovePascal = '';
update datavalues
set q28LoveGo = 'Neutral'
where q28LoveGo = '';
update datavalues
set q28LoveCSharp = 'Neutral'
where q28LoveCSharp = '';
update datavalues
set q28LoveSwift = 'Neutral'
where q28LoveSwift = '';
update datavalues
set q28LoveScala = 'Neutral'
where q28LoveScala = '';
update datavalues
set q28LoveClojure = 'Neutral'
where q28LoveClojure = '';
update datavalues
set q28LovePython = 'Neutral'
where q28LovePython = '';
update datavalues
set q28LoveTypescript = 'Neutral'
where q28LoveTypescript = '';
update datavalues
set q28LoveRust = 'Neutral'
where q28LoveRust = '';
---------------------------------------------------    
insert into qomapping values ('q29FrameLoveASP', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveReactNative', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveNetCore', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveExpressJS', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveJSF', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveVuedotjs', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveDjango', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveStruts', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveMeteor', '0', 'Neutral');
insert into qomapping values ('q29FrameLovePadrino', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveNodeDotjs', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveCocoa', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveEmber', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveAngularJS', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveRubyMotion', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveRubyonRails', '0', 'Neutral');
insert into qomapping values ('q29FrameLovePyramid', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveBackboneDotjs', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveSpring', '0', 'Neutral');
insert into qomapping values ('q29FrameLoveReact', '0', 'Neutral');
update datavalues
set q29FrameLoveASP = 'Neutral'
where q29FrameLoveASP = '';
update datavalues
set q29FrameLoveReactNative = 'Neutral'
where q29FrameLoveReactNative = '';
update datavalues
set q29FrameLoveNetCore = 'Neutral'
where q29FrameLoveNetCore = '';
update datavalues
set q29FrameLoveExpressJS = 'Neutral'
where q29FrameLoveExpressJS = '';
update datavalues
set q29FrameLoveJSF = 'Neutral'
where q29FrameLoveJSF = '';
update datavalues
set q29FrameLoveVuedotjs = 'Neutral'
where q29FrameLoveVuedotjs = '';
update datavalues
set q29FrameLoveDjango = 'Neutral'
where q29FrameLoveDjango = '';
update datavalues
set q29FrameLoveStruts = 'Neutral'
where q29FrameLoveStruts = '';
update datavalues
set q29FrameLoveMeteor = 'Neutral'
where q29FrameLoveMeteor = '';
update datavalues
set q29FrameLovePadrino = 'Neutral'
where q29FrameLovePadrino = '';
update datavalues
set q29FrameLoveNodeDotjs = 'Neutral'
where q29FrameLoveNodeDotjs = '';
update datavalues
set q29FrameLoveCocoa = 'Neutral'
where q29FrameLoveCocoa = '';
update datavalues
set q29FrameLoveEmber = 'Neutral'
where q29FrameLoveEmber = '';
update datavalues
set q29FrameLoveAngularJS = 'Neutral'
where q29FrameLoveAngularJS = '';
update datavalues
set q29FrameLoveRubyMotion = 'Neutral'
where q29FrameLoveRubyMotion = '';
update datavalues
set q29FrameLoveRubyonRails = 'Neutral'
where q29FrameLoveRubyonRails = '';
update datavalues
set q29FrameLovePyramid = 'Neutral'
where q29FrameLovePyramid = '';
update datavalues
set q29FrameLoveBackboneDotjs = 'Neutral'
where q29FrameLoveBackboneDotjs = '';
update datavalues
set q29FrameLoveSpring = 'Neutral'
where q29FrameLoveSpring = '';
update datavalues
set q29FrameLoveReact = 'Neutral'
where q29FrameLoveReact = '';
---------------------------------------------------    
insert into qomapping values ('q30LearnCodeStackOverflow', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeYoutube', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeMOOC', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeCompCodingSites', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeOnlineTutorial', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeBooks', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeAcademicPaper', '0', 'Not This Resource');
insert into qomapping values ('q30LearnCodeOther', '0', 'Not This Resource');
update datavalues
set q30LearnCodeStackOverflow = 'Not This Resource'
where q30LearnCodeStackOverflow = '';
update datavalues
set q30LearnCodeYoutube = 'Not This Resource'
where q30LearnCodeYoutube = '';
update datavalues
set q30LearnCodeMOOC = 'Not This Resource'
where q30LearnCodeMOOC = '';
update datavalues
set q30LearnCodeCompCodingSites = 'Not This Resource'
where q30LearnCodeCompCodingSites = '';
update datavalues
set q30LearnCodeOnlineTutorial = 'Not This Resource'
where q30LearnCodeOnlineTutorial = '';
update datavalues
set q30LearnCodeBooks = 'Not This Resource'
where q30LearnCodeBooks = '';
update datavalues
set q30LearnCodeAcademicPaper = 'Not This Resource'
where q30LearnCodeAcademicPaper = '';
update datavalues
set q30LearnCodeOther = 'Not This Resource'
where q30LearnCodeOther = '';
---------------------------------------------------    
update datavalues
set q22LangProfAgnostic = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfAgnostic = '';
update datavalues
set q22LangProfC = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfC = '';
update datavalues
set q22LangProfCPlusPlus = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfCPlusPlus = '';
update datavalues
set q22LangProfJava = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfJava = '';
update datavalues
set q22LangProfPython = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPython = '';
update datavalues
set q22LangProfRuby = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfRuby = '';
update datavalues
set q22LangProfJavascript = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfJavascript = '';
update datavalues
set q22LangProfCSharp = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfCSharp = '';
update datavalues
set q22LangProfGo = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfGo = '';
update datavalues
set q22LangProfScala = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfScala = '';
update datavalues
set q22LangProfPerl = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPerl = '';
update datavalues
set q22LangProfSwift = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfSwift = '';
update datavalues
set q22LangProfPascal = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPascal = '';
update datavalues
set q22LangProfClojure = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfClojure = '';
update datavalues
set q22LangProfPHP = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfPHP = '';
update datavalues
set q22LangProfHaskell = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfHaskell = '';
update datavalues
set q22LangProfLua = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfLua = '';
update datavalues
set q22LangProfR = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfR = '';
update datavalues
set q22LangProfOther = 'Not necessary'
where q16HiringManager = 'Yes' and q22LangProfOther = '';
---------------------------------------------------