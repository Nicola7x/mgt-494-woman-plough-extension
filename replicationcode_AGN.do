capture log close
clear all
set more off

cd "C:\Dropbox\Paola_Nathan\Paola\QJE_revision_codes_data\ReplicationCodes"

log using "replicationcode_AGN.log", replace

***************
*** Table I ***
***************
use "ethnoatlas_dataset.dta", clear
gen cutoff1=60	
gen cutoff2=60
gen constant=1

destring v104, gen(centroid_lat)
destring v106, gen(centroid_long)

for @ in any centroid_lat centroid_long fem_part_agriculture plow large_animals economic_complexity political_hierarchies tropical_climate agricultural_suitability: drop if missing(@)==1

****Regression with Conley Standard Errors****
x_ols centroid_lat centroid_long cutoff1 cutoff2 fem_part_agriculture constant plow large_animals economic_complexity political_hierarchies tropical_climate agricultural_suitability, coord(2) xreg(7)
su fem_part_agriculture if e(sample)
****OLS regression to obtain adjusted R2 reported in Table 1, column 1****
reg fem_part_agriculture plow large_animals economic_complexity political_hierarchies tropical_climate agricultural_suitability, r
fitstat

use "sccs_dataset.dta", clear

xi: reg fem_part_agriculture plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su fem_part_agriculture if e(sample)
fitstat
outreg using TableI.xls, replace coefastr 3aster se
xi: reg v108 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r 
su v108 if e(sample)
fitstat
outreg using TableI.xls, append coefastr 3aster se
xi: reg v109 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v109 if e(sample)
fitstat
outreg using TableI.xls, append coefastr 3aster se
xi: reg v110 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v110 if e(sample)
fitstat
outreg using TableI.xls, append coefastr 3aster se
xi: reg v111 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v111 if e(sample)
fitstat
outreg using TableI.xls, append coefastr 3aster se
xi: reg v112 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v112 if e(sample)
fitstat
outreg using TableI.xls, append coefastr 3aster se

***************
*** Table II ***
***************
xi: reg v113 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v113 if e(sample)
fitstat
outreg using TableII.xls, replace coefastr 3aster se
xi: reg v114 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v114 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v115 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v115 if e(sample) 
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v121 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v121 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v123 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v123 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v125 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v125 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v146 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v146 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v737 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v737 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
xi: reg v738 plow large_animals economic_complexity  political_hierarchies tropical_climate agricultural_suitability, r
su v738 if e(sample)
fitstat
outreg using TableII.xls, append coefastr 3aster se
clear

****************************************************************************************************
*** Table III: AES results for columns 7 and 8 can be obtained using the aes_regression.do file ****
****************************************************************************************************


use "crosscountry_dataset.dta", clear

xi: reg  flfp2000 	 plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity , r
fitstat
outreg using TableIII.xls, replace coefastr 3aster se
xi: reg  flfp2000 	 plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity  i.continent, r
fitstat
outreg using TableIII.xls, append coefastr 3aster se
su flfp2000 if e(sample)==1
xi: reg  female_ownership 		plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity , r
fitstat
outreg using TableIII.xls, append coefastr 3aster se
xi: reg  female_ownership 	plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity  i.continent, r
fitstat
outreg using TableIII.xls, append coefastr 3aster se
su female_ownership if e(sample)==1
xi: reg  women_politics 		plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity , r
fitstat
outreg using TableIII.xls, append coefastr 3aster se
xi: reg  women_politics 		plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity  i.continent, r
fitstat
outreg using TableIII.xls, append coefastr 3aster se
su women_politics if e(sample)==1
fitstat

**************************************************************************************************
*** Table IV: AES results for columns 7 and 8 can be obtained using the aes_regression.do file ***
**************************************************************************************************

use "crosscountry_dataset.dta", clear
xi: reg  flfp2000 	 plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
fitstat
outreg using TableIV.xls, replace coefastr 3aster se
xi: reg  flfp2000 	 plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity  ln_income ln_income_squared i.continent, r
fitstat
outreg using TableIV.xls, append coefastr 3aster se
su flfp2000 if e(sample)==1
xi: reg  female_ownership 	plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
fitstat
outreg using TableIV.xls, append coefastr 3aster se
xi: reg  female_ownership 	plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r
fitstat
outreg using TableIV.xls, append coefastr 3aster se
su female_ownership if e(sample)==1
xi: reg  women_politics 	plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
fitstat
outreg using TableIV.xls, append coefastr 3aster se
xi: reg  women_politics 	plow agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity  ln_income ln_income_squared i.continent, r
outreg using TableIV.xls, append coefastr 3aster se
fitstat
su women_politics if e(sample)==1
fitstat

***************
*** Table V ***
***************
use "WVS_dataset.dta", clear

xi: reg   		FLFP15_64   		plow ln_income ln_income2 economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married 		i.continent if age>=15 & age<=64, cl(regioncode)
su FLFP15_64 if e(sample)
fitstat
outreg using TableV.xls, replace coefastr 3aster se
xi: reg   		FLFP15_64       	plow economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married 		i.countrycode if age>=15 & age<=64 , cl(regioncode)
fitstat
su FLFP15_64 if e(sample)
outreg using TableV.xls, append coefastr 3aster se
xi: reg   		jobs_scarce	    	plow ln_income ln_income2 economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married i.sex i.continent, cl(regioncode)
su jobs_scarce if e(sample)
fitstat
outreg using TableV.xls, append coefastr 3aster se
xi: reg   		jobs_scarce	    	plow economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married i.sex	 	i.countrycode, cl(regioncode)
su jobs_scarce if e(sample)
fitstat
outreg using TableV.xls, append coefastr 3aster se
xi: reg   		men_pol_leaders		plow ln_income ln_income2 economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married i.sex i.continent, cl(regioncode)
su men_pol_leaders if e(sample)
fitstat
outreg using TableV.xls, append coefastr 3aster se
xi: reg   		men_pol_leaders		plow economic_complexity large_animals political_hierarchies tropical_climate agricultural_suitability primary secondary  age age_sq married i.sex		i.countrycode , cl(regioncode)
su men_pol_leaders if e(sample)
fitstat
outreg using TableV.xls, append coefastr 3aster se

***************
*** Table VI ***
***************
use "IPUMS_dataset.dta", clear
preserve	  
keep if country=="bolivia"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year if country=="bolivia", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, replace coefastr 3aster se
restore
preserve
keep if country=="chile"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year if country=="chile", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="cambodia"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year if country=="cambodia", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="malaysia"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year i.district*i.year if country=="malaysia", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="mongolia"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married 		 	i.district i.year i.district*i.year if country=="mongolia", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="nepal"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year if country=="nepal", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="philippines"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban 	i.district i.year if country=="philippines", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
preserve
keep if country=="uganda"
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married i.urban		i.district i.year i.district*i.year if country=="uganda", cl(ethnicity)	  
su ilf if e(sample)
su plow if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se
restore
xi: reg ilf plow large_animals tropical_climate agricultural_suitability economic_complexity political_hierarchies i.edattan age age_sq married 		  	i.district i.year i.district*i.year, cl(ethnicity)	  
su ilf if e(sample)
fitstat
outreg using TableVI.xls, append coefastr 3aster se

*****************
*** Table VII ***
*****************
use "crosscountry_dataset.dta", clear

xi: reg  flfp2000 	 plow intensity_agriculture hunting husbandry				   				agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, replace coefastr 3aster se

xi: reg  flfp2000 	 plow abs_inherit matrilocal patrilocal	nuclear_fam extended_fam	    	agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow   year_obs		 													agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow  years_civil_conflict years_interstate_conflict rugged				agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow communist_dummy european_descent										agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow oil_pc agr_va_gdp2000  man_va_gdp2000 serv_va_gdp2000 				agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow cath00 prot00 othchrist00 muslim00 hindu00 							agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

xi: reg  flfp2000 	 plow intensity_agriculture hunting husbandry abs_inherit matrilocal patrilocal nuclear_fam extended_fam year_obs years_civil_conflict years_interstate_conflict rugged communist_dummy european_descent oil_pc agr_va_gdp2000  man_va_gdp2000 serv_va_gdp2000 cath00 prot00 othchrist00 muslim00 hindu00  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r
su flfp2000 if e(sample)
fitstat
outreg using TableVII.xls, append coefastr 3aster se

************************
*** Table 8, Panel A ***
************************
use "crosscountry_dataset.dta", clear
reg  plow plow_positive_crops plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared if flfp2000~=., r 
su plow if e(sample)
test plow_negative_crops=plow_positive_crops
predict resid, resid
reg flfp2000 plow resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
drop resid 

xi: reg  plow plow_positive_crops plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent if flfp2000~=., r 
su plow if e(sample)
test plow_negative_crops=plow_positive_crops
predict resid, resid
xi: reg flfp2000 plow resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent , r 
drop resid 

reg  plow plow_positive_crops  plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared if female_ownership~=., r 
su plow if e(sample)
test plow_negative_crops=plow_positive_crops
predict resid, resid
reg female_ownership plow resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
drop resid 

xi: reg  plow plow_positive_crops plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent if female_ownership~=., r 
test plow_negative_crops=plow_positive_crops
predict resid, resid
xi: reg female_ownership plow resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent , r 
drop resid 

reg  plow plow_positive_crops plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared if women_politics~=., r 
su plow if e(sample)
test plow_negative_crops=plow_positive_crops
predict resid, resid
reg  women_politics plow resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
drop resid 

xi: reg  plow plow_positive_crops  plow_negative_crops agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent if women_politics~=., r 
test plow_negative_crops=plow_positive_crops
predict resid, resid
xi: reg  women_politics plow_negative_crops plow_positive_crops resid agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent , r 
drop resid 

************************
*** Table 8, Panel B ***
************************
xi: reg  flfp2000 		plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
outreg using TableVIIIb.xls, replace coefastr 3aster se
su flfp2000 if e(sample)
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

xi: reg  flfp2000 		plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r 
outreg using TableVIIIb.xls, append coefastr 3aster se
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

xi: reg  female_ownership	 	plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
outreg using TableVIIIb.xls, append coefastr 3aster se
su female_ownership if e(sample)
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

xi: reg  female_ownership	 	plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r 
outreg using TableVIIIb.xls, append coefastr 3aster se
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

xi: reg  women_politics	 		plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r 
outreg using TableVIIIb.xls, append coefastr 3aster se
su women_politics if e(sample)
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

xi: reg  women_politics	 		plow_negative_crops plow_positive_crops  agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r 
outreg using TableVIIIb.xls, append coefastr 3aster se
test plow_negative_crops plow_positive_crops
test plow_negative_crops=plow_positive_crops

************************
*** Table 8, Panel C ***
************************ 
xi: ivreg2  flfp2000 		(plow= plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared, r first
outreg using TableVIIIc.xls, replace coefastr 3aster se
xi: ivreg2  flfp2000 		(plow= plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r first
outreg using TableVIIIc.xls, append coefastr 3aster se
xi: ivreg2  female_ownership	 	(plow= plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared , r first
outreg using TableVIIIc.xls, append coefastr 3aster se
xi: ivreg2  female_ownership	 	(plow= plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r first
outreg using TableVIIIc.xls, append coefastr 3aster se
xi: ivreg2  women_politics	 		(plow=  plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared , r first
outreg using TableVIIIc.xls, append coefastr 3aster se
xi: ivreg2  women_politics	 		(plow=  plow_negative_crops plow_positive_crops) agricultural_suitability tropical_climate large_animals political_hierarchies economic_complexity ln_income ln_income_squared i.continent, r first
outreg using TableVIIIc.xls, append coefastr 3aster se

****************
*** Table IX ***
****************
use "cps_dataset.dta", clear

xi: reg ilf     plow_f large_animals_f economic_complexity_f tropical_climate_f political_hierarchies_f agricultural_suitability_f ln_income_f ln_income2f age age_sq single less_hs high_sc  i.metro i.statefip i.year  if age>=15 & age<=64 & sex==2, cl(fbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, replace coefastr 3aster se
xi: reg ilf     plow_m large_animals_m economic_complexity_m tropical_climate_m political_hierarchies_m agricultural_suitability_m ln_income_m ln_income2m age age_sq single less_hs high_sc  i.metro i.statefip i.year  if age>=15 & age<=64 & sex==2, cl(mbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se
xi: reg ilf     plow_m large_animals_m economic_complexity_m tropical_climate_m political_hierarchies_m agricultural_suitability_m ln_income_m ln_income2m age age_sq single less_hs high_sc  i.metro i.statefip i.year  if age>=15 & age<=64 & sex==2 & fbpl==mbpl, cl(mbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se

xi: reg ilf     plow_f large_animals_f economic_complexity_f tropical_climate_f political_hierarchies_f agricultural_suitability_f ln_income_f ln_income2f age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201, cl(fbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se
xi: reg ilf     plow_m large_animals_m economic_complexity_m tropical_climate_m political_hierarchies_m agricultural_suitability_m ln_income_m ln_income2m age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201, cl(mbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se
xi: reg ilf     plow_f large_animals_f economic_complexity_f tropical_climate_f political_hierarchies_f agricultural_suitability_f ln_income_f ln_income2f age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201 & fbpl==mbpl, cl(fbpl)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se

xi: reg ilf     plow_fh large_animals_fh economic_complexity_fh tropical_climate_fh political_hierarchies_fh agricultural_suitability_fh   ln_income_fh ln_income2fh age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201, cl(fbplh)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se
xi: reg ilf     plow_mh large_animals_mh economic_complexity_mh tropical_climate_mh political_hierarchies_mh agricultural_suitability_mh   ln_income_mh ln_income2mh age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201, cl(mbplh)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se
xi: reg ilf     plow_fh large_animals_fh economic_complexity_fh tropical_climate_fh political_hierarchies_fh agricultural_suitability_fh   ln_income_fh ln_income2fh age age_sq less_hs high_sc  ageh ageh_sq less_hs_h high_sc_h log_inc_h i.statefip  i.year  if age>=15 & age<=64 & sex==2 &  marst==1 & relate<=201 & fbplh==mbplh, cl(fbplh)
su ilf if e(sample)
fitstat
outreg using TableIX.xls, append coefastr 3aster se

****************
*** Table X ***
****************
use "ess_father_dataset.dta", clear
xi: reg job_scarce 			plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2	age agesq male married  yedu bigcity smallcity i.essround i.country_s, cl(father_isocode_3digits)
su job_scarce if e(sample)
fitstat
outreg using TableX.xls, replace coefastr 3aster se
xi: reg job_scarce_0to1 	plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2 age agesq male married   yedu bigcity smallcity i.essround i.country_s, cl(father_isocode_3digits)
su job_scarce_0to1 if e(sample)
fitstat
outreg using TableX.xls, append coefastr 3aster se
clear

use "ess_mother_dataset.dta", clear
xi: reg job_scarce 			plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2	age agesq male married  yedu bigcity smallcity i.essround i.country_s, cl(mother_isocode_3digits)
su job_scarce if e(sample)
fitstat
outreg using TableX.xls, append coefastr 3aster se
xi: reg job_scarce_0to1 	plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2 age agesq male married   yedu bigcity smallcity i.essround i.country_s, cl(mother_isocode_3digits)
su job_scarce_0to1 if e(sample)
fitstat
outreg using TableX.xls, append coefastr 3aster se
clear

use "ess_father_dataset.dta", clear
xi: reg job_scarce 			plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2	age agesq male married  yedu bigcity smallcity i.essround i.country_s if  mother_isocode_2digits==father_isocode_2digits, cl(father_isocode_3digits)
su job_scarce if e(sample)
fitstat
outreg using TableX.xls, append coefastr 3aster se
xi: reg job_scarce_0to1 	plow tropical_climate agricultural_suitability large_animals economic_complexity political_hierarchies ln_income ln_income2 age agesq male married   yedu bigcity smallcity i.essround i.country_s if  mother_isocode_2digits==father_isocode_2digits, cl(father_isocode_3digits)
su job_scarce_0to1 if e(sample)
fitstat
outreg using TableX.xls, append coefastr 3aster se

log close


