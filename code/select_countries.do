import delimited "data\raw\ted\ted-sample.csv", clear

keep iso_country_code  win_country_code award_value_euro
* winsorize small tender values
drop if strlen(win_country_code) > 2
* drop tenders with multiple winners
* FIXME: ....
drop if strlen(iso_country_code) > 2
replace award_value_euro = 300 if award_value_euro < 500
drop if missing(win_country_code, iso_country_code)

save "data/derived/ted-columns.dta", replace
