# SQL-Rule-Engine
Project Assessment for Boost
Signal Sounder 4000 - SQL Challenge

My Assumptions: 
Upon reading the instructions for this project, I initially thought the solution would work for any number of towers since even though the sample data only included towers 1 & 2, there was not a hard code for them. 

My Approach:
In order to write an SQL query that returned the correct output, I made the solution with 3 common table expressions (CTE's). Upon researching SQL expressions I found that these would be the most useful for this project. 1. Comparisonresults. This CTE allowed me to check every value of the stream utilizing the comparison rule for each one. 2. Deltaresults. This CTE looks ahead a set number of rows in the tower to see if it satisfied the delta rule. 3. Combined. This CTE allowed me to merge the results and format the output as needed. 

How to run my solution:
Firstly, start the SQL server with the following:

docker run -e "Accept_EULA=Y" -e 'MSSQL_SA_PASSWORD=Str0ng!Passw0rd' 
-p 14333:14333 --name signal-sql -d mcr.micrsoft.com/mssql/server:2022-latest

Next, connect to 'localhost,14333' with the username 'sa' and password 'Str0ng!Passw0rd' 

Lastly, Open the solution.sql file and run it
