#Project Assessment for Boost 
Signal Sounder 4000 - Logic & Rule Engineer Challenge 

My Assumptions:
For this assignment, I assumed the program only needed one tower per stream file since in the sample data given, there was only one tower. Since it stated that RowIndex starts at 0 and increases as it goes down, I assumed the values would always be in order from top to bottom. With the delta rules in this assignment I assumed the solution should output the starting index instead of the ending similar to the first project. 

My Approach:
I decided to use Python as my language of choice because not only is this my most known language but also because I found that Python was the best language to handle the instructions and task. I decided to go with these 3 main structures: 1.check_condition. This is in order to handle the comparison logic to see if it satisfies a <,>, or = condition. 2.evaluate_rules. This is to make sure the function loops through every rule and every value in the stream goes through the comparison or delta logic depending on the rule type specified. 3. main. This was to read the JSON configuration file and stream file then send the data to the evaluate_rules to get to the output. 


How to run my solution: 
Make sure you have Python 3 installed by opening your terminal and running: python 3 --version

Next, go to whichever folder contains the files with: 
cd *input your file path* 
    ex. cd Users/jmosq/Documents/Boost/Logic-proj

Lastly, run the program with the following: 
python3 solution.py rules.json stream.txt
