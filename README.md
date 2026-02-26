# SQL-Rule-Engine
Project Assessment for Boost
Signal Sounder 4000 - SQL Challenge

My Assumptions: 
Upon reading the instructions for this project, I initially 

My Approach:
In order to write an SQL query that returned the correct output, 

How to run my solution:
Firstly, start the SQL server with the following:

docker run -e "Accept_EULA=Y" -e 'MSSQL_SA_PASSWORD=Str0ng!Passw0rd' 
-p 14333:14333 --name signal-sql -d mcr.micrsoft.com/mssql/server:2022-latest

Next, connect to 'localhost,14333' with the username 'sa' and password 'Str0ng!Passw0rd' 

Lastly, Open the solution.sql file and run it
