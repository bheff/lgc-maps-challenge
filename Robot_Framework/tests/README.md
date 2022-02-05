# Installation:
```
sudo -H pip install --upgrade selenium
sudo -H pip install --upgrade robotframework
sudo -H pip install --upgrade robotframework-sshlibrary
sudo -H pip install --upgrade robotframework-seleniumlibrary
```
The (pip) --upgrade option can be omitted when installing the libraries for the first time.
Running these commands installs the latest Selenium and Robot Framework versions. You need to install browser drivers separately. 

### Install Browser drivers:
The general approach to install a browser driver is downloading a right driver, such as chromedriver for Chrome, and placing it into a directory that is in $PATH.

chromedriver can be found at https://sites.google.com/a/chromium.org/chromedriver/downloads

## To run all test suites:
```
cd <test dir>  (Robot_Framework/tests)
robot .
```
## To run an individual test suite: 
Example: just  run the backend test suite
```
cd <test dir>  (Robot_Framework/tests)
robot -s backend .
```

### Selecting individual test cases to run.
Each test is 'taged' with a name to make it convenient to run an individual test cases which is in a suite.
It is possible to include and exclude test cases by tag names with the --include (-i) and --exclude (-e) options
Example, This will run only the Active Platforms Indicator test in the ui_testing suite.
```
cd <test dir>  (Robot_Framework/tests)
robot -i <test tag> .
```