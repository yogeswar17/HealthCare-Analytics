create database Health_care_project;

#----------------------------KPI 1--------------------------#
#--------Number of Patients across various summaries--------#

select
concat(round(sum(Number_of_patients_included_in_the_transfusion_summary)/1000),"K") as "No of Patients in transfusion summary",
concat(round(sum(Number_of_patients_in_hypercalcemia_summary)/1000),"K") as "No of Patients in hypercalcemia summary",
concat(round(sum(Number_of_patients_in_long_term_catheter_summary)/1000),"K") as "No of Patients in long term catheter summary",
concat(round(sum(Number_of_patients_in_nPCR_summary)/1000,2),"K") as "No of Patients in nPCR summary",
concat(round(sum(Number_of_patients_in_Serum_phosphorus_summary)/1000),"K") as "No of patients in Serum phosphorus summary",
concat(round(sum(Number_of_Patients_included_in_fistula_summary)/1000),"K") as "No of Patients in fistual summary",
concat(round(sum(Number_of_patients_included_in_hospitalization_summary)/1000),"K") as "No of Patients in hospitalization summary",
concat(round(sum(Number_of_Patients_included_in_survival_summary)/1000),"K") as "No of Patients in survival summary"
from dialysis_i;


#------------------------KPI 2------------------------#
#------------Profit Vs Non-Profit Stats---------------#



select
count(case when Profit_or_NonProfit="Profit" then 1 else null end) as total_Profit,
count(case when Profit_or_NonProfit="Non-Profit" then 1 else null end) as total_non_Profit
from dialysis_i;




#-------------------------------------KPI 3-------------------------------------#
#--------Chain Organizations w.r.t. Total Performance Score as No Score---------#

select 
d1.Chain_Organization,
count(d2.Total_Performance_Score) as "Count of No Score"
from dialysis_i d1
join dialysis_ii d2
using(Provider_Number)
where Total_Performance_Score='No Score'
group by Chain_Organization;


#-----------------------KPI 4------------------------#
#------------Dialysis Stations Stats-----------------#


select state,city,
count(dialysis_stations) as "dialysis stations"
from dialysis_i
group by state,city;


#----------------------KPI 5----------------------#
#-------# of Category Text  - As Expected----------#



select
count(case when Patient_Transfusion_category_text="As Expected" then 1 else null end) as "Transfusion Category text",
count(case when Patient_hospitalization_category_text="As Expected" then 1 else null end) as "Hospitalization category text",
count(case when Patient_Survival_Category_Text="As Expected" then 1 else null end) as "Survival category text",
count(case when Patient_Infection_category_text="As Expected" then 1 else null end) as "Infection category text",
count(case when Fistula_Category_Text="As Expected" then 1 else null end) as "Fistual category text",
count(case when SWR_category_text="As Expected" then 1 else null end) as "SWR category text",
count(case when PPPW_category_text="As Expected" then 1 else null end) as "PPPW category text"
from dialysis_i;



#--------------------KPI 6-------------------#
#-------Average Payment Reduction Rate-------#


select
concat(round(avg(PY2020_Payment_Reduction_Percentage),2),"%") as "Avg Payment reduction rate"
from dialysis_ii
where PY2020_Payment_Reduction_Percentage > 0;


















#--------------KPI 1------------#

select "hypercalcemia summary" as Summaries,
concat(round(sum(Number_of_patients_in_hypercalcemia_summary)/1000),"K") as "Total no of Patients" from dialysis_i
union all
select"long term catheter summary",
concat(round(sum(Number_of_patients_in_long_term_catheter_summary)/1000),"K") from dialysis_i
union all
select "nPCR summary",
concat(round(sum(Number_of_patients_in_nPCR_summary)/1000,2),"K") from dialysis_i
union all
select "Serum phosphorus summary",
concat(round(sum(Number_of_patients_in_Serum_phosphorus_summary)/1000),"K") from dialysis_i
union all
select "fistual summary",
concat(round(sum(Number_of_Patients_included_in_fistula_summary)/1000),"K") from dialysis_i
union all
select "hospitalization summary",
concat(round(sum(Number_of_patients_included_in_hospitalization_summary)/1000),"K") from dialysis_i
union all
select "survival summary",
concat(round(sum(Number_of_Patients_included_in_survival_summary)/1000),"K") from dialysis_i
union all
select "transfusion summary",
concat(round(sum(Number_of_patients_included_in_the_transfusion_summary)/1000),"K") from dialysis_i;




#-------------- KPI 5--------------#
select "Transfusion Category text" as "Category text",
count(case when Patient_Transfusion_category_text="As Expected" then 1 else null end) as "Count of As Expected" from dialysis_i
union all
select "Hospitalization category text",
count(case when Patient_hospitalization_category_text="As Expected" then 1 else null end) from dialysis_i
union all
select "Survival category text",
count(case when Patient_Survival_Category_Text="As Expected" then 1 else null end) from dialysis_i
union all
select "Infection category text",
count(case when Patient_Infection_category_text="As Expected" then 1 else null end) from dialysis_i
union all
select "Fisual category text",
count(case when Fistula_Category_Text="As Expected" then 1 else null end) from dialysis_i
union all
select "SWR category text",
count(case when SWR_category_text="As Expected" then 1 else null end) from dialysis_i
union all
select "PPPW category text",
count(case when PPPW_category_text="As Expected" then 1 else null end) from dialysis_i;










#---------------KPI 5--------------#

select 
sum(if(Patient_Transfusion_category_text="As Expected",1,0)) as "Transfusion Category text",
sum(if(Patient_hospitalization_category_text="As Expected",1,0)) as "Hospitalization category text",
sum(if(Patient_Survival_Category_Text="As Expected",1,0)) as "Survival category text",
sum(if(Patient_Infection_category_text="As expected",1,0)) as "Infection category text",
sum(if(Fistula_Category_Text="As Expected",1,0)) as "Fistual category text",
sum(if(SWR_category_text="As Expected",1,0)) as "SWR category text",
sum(if(PPPW_category_text="As Expected",1,0)) as "PPPW category text"
from dialysis_i;

#------------------KPI 5------------------#
select "Transfusion Category text" as "Category text",
sum(if(Patient_Transfusion_category_text="As Expected",1,0)) as "Count of As Expected" from dialysis_i
union all
select "Hospitalization category text",
sum(if(Patient_hospitalization_category_text="As Expected",1,0)) from dialysis_i
union all
select "Survival category text",
sum(if(Patient_Survival_Category_Text="As Expected",1,0)) from dialysis_i
union all
select "Infection category text",
sum(if(Patient_Infection_category_text="As expected",1,0)) from dialysis_i
union all
select "Fisual category text",
sum(if(Fistula_Category_Text="As Expected",1,0)) from dialysis_i
union all
select "SWR category text",
sum(if(SWR_category_text="As Expected",1,0)) from dialysis_i
union all
select "PPPW category text",
sum(if(PPPW_category_text="As Expected",1,0)) from dialysis_i;






