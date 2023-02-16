use "data/derived/ted-columns.dta", clear

count
* count within-country tenders
count if iso_country_code == win_country_code

* count cross-country tenders
count if iso_country_code != win_country_code

* a shorter way of creating a dummy
generate same_country =(iso_country_code == win_country_code)

tabulate same_country

*award value is very skewed with huge outliers, model log() instead
generate ln_award_value_euro = ln(award_value_euro)
regress ln_award_value_euro same_country, robust

histogram ln_award_value_euro, by(same_country)
graph export "figure/value_histogram.pdf"