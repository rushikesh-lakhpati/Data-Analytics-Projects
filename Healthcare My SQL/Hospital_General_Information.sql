# KPI1.1
select
city
,State
,CountyName
,count(FacilityID) as No_of_Hospitals
from health_care_analytics.hospital_general_information
group by City, State, CountyName;

# KPI1.2
select
HospitalType
,HospitalOwnership
,count(FacilityID) as No_of_Hospitals
from health_care_analytics.hospital_general_information
group by HospitalType, HospitalOwnership;

# KPI1.3
select
EmergencyServices
,count(FacilityID) as No_of_Hospitals
from health_care_analytics.hospital_general_information
group by EmergencyServices;

# KPI1.4
select
Hospitaloverallrating
,count(FacilityID) as No_of_Hospitals
From health_care_analytics.hospital_general_information
group by Hospitaloverallrating;

# KPI1.5
select
round(Avg((MORTGroupMeasureCount + CountofMORTMeasuresBetter + CountofMORTMeasuresNoDifferent + CountofMORTMeasuresWorse + CountofFacilityMORTMeasures)/5),1) as Mortality
,round(avg((SafetyGroupMeasureCount + CountofFacilitySafetyMeasures + CountofSafetyMeasuresBetter + CountofSafetyMeasuresNoDifferent + CountofSafetyMeasuresWorse)/5),1) as Safety_of_Care
,round(avg((READMGroupMeasureCount + CountofFacilityREADMMeasures + CountofREADMMeasuresBetter + CountofREADMMeasuresNoDifferent + CountofREADMMeasuresWorse)/5),1) as Readmission
,round(avg((PtExpGroupMeasureCount + CountofFacilityPtExpMeasures)/2),1) as Patient_Experience
,round(avg((TEGroupMeasureCount + CountofFacilityTEMeasures)/2),1) as Timely_and_Effective_Care
from health_care_analytics.hospital_general_information;

alter table hospital_general_information
add column Datecolumn date;

update hospital_general_information
set DateColumn = STR_TO_DATE(CONCAT(yearofStart, '-', MonthofStart, '-01'), '%Y-%m-%d');

# KPI1.6
select
FacilityName
,round(sum(datediff(CURDATE(),Datecolumn)/365.25),0) as ServiceYears
from health_care_analytics.hospital_general_information
group by FacilityName;








