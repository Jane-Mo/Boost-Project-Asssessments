This repository has both solutions for the Signal Sounder 4000 Assessment:
You'll find both the files explained in this README file. 




# SQL-Rule-Engine
Project Assessment for Boost
Signal Sounder 4000 - SQL Challenge

My Assumptions: 
Upon reading the instructions for this project, I initially thought the solution would work for any number of towers since even though the sample data only included towers 1 & 2, there was not a hard code for them. Additionally, since the instructions did not specify that the rows go in order, so this could mean some were skipped. To deal with this, the delta logic made the most sense to look for the exact index. So when delta rules occurs, it outputs where it started not where it ended. 

My Approach:
In order to write an SQL query that returned the correct output, I made the solution with 3 common table expressions (CTE's). Upon researching SQL expressions I found that these would be the most useful for this project. 1. Comparisonresults. This CTE allowed me to check every value of the stream utilizing the comparison rule for each one. 2. Deltaresults. This CTE looks ahead a set number of rows in the tower to see if it satisfied the delta rule. 3. Combined. This CTE allowed me to merge the results and format the output as needed. 

How to run my solution:
Firstly, start the SQL server with the following:

docker run -e "Accept_EULA=Y" -e 'MSSQL_SA_PASSWORD=Str0ng!Passw0rd' 
-p 14333:14333 --name signal-sql -d mcr.micrsoft.com/mssql/server:2022-latest

Next, connect to 'localhost,14333' with the username 'sa' and password 'Str0ng!Passw0rd' 

Lastly, Open the solution.sql file and run it





# Project Assessment for Boost Signal Sounder 4000 - Logic & Rule Engineer Challenge

My Assumptions: For this assignment, I assumed the program only needed one tower per stream file since in the sample data given, there was only one tower. Since it stated that RowIndex starts at 0 and increases as it goes down, I assumed the values would always be in order from top to bottom. With the delta rules in this assignment I assumed the solution should output the starting index instead of the ending similar to the first project.

My Approach: I decided to use Python as my language of choice because not only is this my most known language but also because I found that Python was the best language to handle the instructions and task. I decided to go with these 3 main structures: 1.check_condition. This is in order to handle the comparison logic to see if it satisfies a <,>, or = condition. 2.evaluate_rules. This is to make sure the function loops through every rule and every value in the stream goes through the comparison or delta logic depending on the rule type specified. 3. main. This was to read the JSON configuration file and stream file then send the data to the evaluate_rules to get to the output.

How to run my solution: Make sure you have Python 3 installed by opening your terminal and running: python 3 --version

Next, go to whichever folder contains the files with: cd input your file path ex. cd Users/jmosq/Documents/Boost/Logic-proj

Lastly, run the program with the following: python3 solution.py rules.json stream.txt
