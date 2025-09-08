
*** Variables ***
# Configuration
${BROWSER} =  chrome
${ENVIRONMENT} =  prod
&{BASE_URL}  dev= https://dev.the-internet.herokuapp.com/    qa= https://qa.the-internet.herokuapp.com/   prod= https://the-internet.herokuapp.com/
                # Dictionary for dev, qa, prod sites - qa & dev are dummy sites here
${LOGIN_PATH} =  login    # to append to site url

${INVALID_CREDENTIALS_PATH_CSV} =  E:\\dev\\robot-scripts\\data-driven-ext-csv-hero\\Data\\Users.csv  # no " " and use E:\, e seems to open edge, check

                                      # "e:\\dev\\robot-scripts\\data-driven-ext-csv-hero\\Data\\Users.csv"