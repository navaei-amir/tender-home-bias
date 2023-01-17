# Makefiles contain scripts that will be executed line by line
# But they can also be used to organize what command gets executed when.

# target: source1 source2
# <TAB>recipe step 1
# <TAB>recipe step 2

data/raw/european-commission/ted-sample.csv:
	curl -Lo data/raw/european-commission/ted-sample.csv "https://github.com/codedthinking/tender-home-bias/releases/download/v1.0/ted-sample.csv" 