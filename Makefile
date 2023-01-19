# Makefiles contain scripts that will be executed line by line
# But they can also be used to organize what command gets executed when.

# target: source1 source2
# <TAB>recipe step 1
# <TAB>recipe step 2

data/derived/ted-columns.csv: data/raw/european-commission/ted-sample.csv
	mkdir -p data/derived
	csvcut -c ID_NOTICE_CAN,ISO_COUNTRY_CODE,WIN_COUNTRY_CODE,AWARD_VALUE_EURO $< > $@

# $< is the FIRST source. $@ is the target

data/raw/european-commission/ted-sample.csv:
	mkdir -p data/raw/european-commission
	curl -Lo $@ "https://github.com/codedthinking/tender-home-bias/releases/download/v1.0/ted-sample.csv" 