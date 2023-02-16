use "data/derived/ted-columns.dta", clear

count
* count within-country tenders
count if iso_country_code == win_country_code

* count cross-country tenders
count if iso_country_code != win_country_code

* a shorter way of creating a dummy
generate same_country =(iso_country_code == win_country_code)

tabulate same_country