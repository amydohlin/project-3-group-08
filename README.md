# Project-3 Shark Tank (Reality Show) Analysis
## University of Minnesota - Data Visualization and Analytics Bootcamp
# Group Members
- Anna Bitzer
- Atul Shiwakoti
- Tianyue Li
- Amy Dohlin

# Overview
   - Shark Tank (ABC channel business-oriented show) is where new start-up entrepreneurs come into the show to grab the required amount of funding in exchange for their portion(share) of the business. The business tycoons (presented as Sharks) could provide the asked value, or more in exchange for an equity of the company from the pitchers. The end goal for the entrepreneurs who come to the show is to win over the sharks with their business pitch and convince them to invest in their businesses.
# Objectives 
 
   - To determine the most successful pitched industries on the show over several seasons.
   - Overview of the shark investments in the pitchers based on their gender.
   - Overview of the investments done by sharks in various industries over several seasons.
   - Most frequently pitched industries among the pitchers for investment.

# Data Collection
   - The data for the project was collected from the Kaggle.com
   - It comprises the Shark Tank seasons 1 to 15, ranging from Aug 2009 to Sept 2023.
   - The initial dataset has 53 columns and 1345 records.
   - link = https://www.kaggle.com/datasets/thirumani/shark-tank-us-dataset

# Data Cleaning
   - Initial Data Cleaning
      - Unnecessary columns were removed.
      - Datatypes were updated.
      - Duplicate values were dropped.

   - Pitcher Demographics Table (Anna Bitzer)
      -  The "Multiple Entrepreneurs" column datatype was switched to boolean.
      -  Null values in all string columns (name, gender, city, state, industry) were replaced with "Unknown.
     -  The "Entrepreneur Names" column, which could contain multiple entrepreneurs, was split into new columns, "Entrepreneur 1 Name" and "Entrepreneur 2 Name", separated by a comma or the word "and". 
         -  Some instances of the "Multiple Entrepreneurs" column were incorrect. They were corrected using a conditional that checked if a second entrepreneur was present in the "Entrepreneur 2 Name" column.
         -  Finally, the columns were reordered, and some were renamed.
      
   - Deal Info Table (Tianyue Li)
      - The table leverages a foreign key "Pitch_Number" from the pitch demographics table
      - One of the challenges of structuring the deal_df was Sharks data are independently tracked, which could benefit from additional transposing to make the table structure "long" (more rows) instead of wide (more columns) structure
      The shark columns of the deal data frame contained many null values because not all sharks might be investing during every episode. These values were converted to zeros "0" to accommodate the float column type better.
   - Pitch Info Table
      - This table captures the season, episode info, business description of each deal, and whether the deal was successful and received investments from the sharks.

   - Shark Demographics
      - This table contains the resident and guest sharks' names and gender information.
      - The Kaggle dataset did not initially contain gender information for sharks. 
The final data frame was exported to CSV for upload into an SQL database with the other tables.
The final data frame was exported to CSV for upload into an SQL database with the other tables.
# Database (SQL)
   - The tables created from the cleaned data were pitch_demo (demographics of the pitchers), pitch_info, deal_info (i.e., if they got the deal and how much), and shark_demographics.
   In the ERD, only the pitch_demo, pitch_info, and deal_info tables were used since they contained the most pertinent information. The pitch_demo table was the primary table used to link to the others, with Pitch_Number as the primary key.
   - The primary key created the necessary relationship between the three tables. It allowed them to be imported into PostgreSQL, where they could be accessed at any time and used in the last step with Flask API.

# Flask API
   - The final data can be accessed in JSON format using the SharkTankDatabase API. This can be accessed by running the Flask app, housed in the file shark_tank_flask.py. To run the app, the data must be first imported into the Postgres SQL database. In the config.py file, replace the user, password, and database values with your values. Make sure that psycopg2 is installed before running the shark_tank_flask.py file (for more info, see https://www.geeksforgeeks.org/connecting-postgresql-with-sqlalchemy-in-python/#).
   - The API has three available endpoints: one for the entrepreneur demographics table, one for the pitch table, and one for the deal table.
   - 
# Ethical Consideration
   - This is the reality show where would-be entrepreneurs try to sell their new ideas for business ventures to one or more angel investors (i.e., the sharks) in return for a stake in the business. However, we can observe several tactics implied by both parties to get the deal going their way. In some cases, an ethical dilemma occurs for certain shark members. In most cases, sharks seem to provide the deal in the area of their expertise, whereas in others, they tend to avoid or even diminish the product value that looks to be competitive with their already existing products on the market. 
  - Throughout seasons, the show (Shark Tank) and ABC network had been accused of holding fewer amounts of equity in return for pitchers to perform in their show, thus exposing their products to the market. After several Sharks backlashes, the company decided not to withhold any equity of the pitchers coming into the show. This negatively impacted the show, and the number of deals done in the episode decreased. Pitchers tend not to accept the deal even after providing them with the exact amount that was asked for in return for a proportion of their business at stake. One of the possible reasons could be that some pitchers appear on the show just for marketing, targeting the larger audience as the show is televised. 
  - There were a few instances of pitcher products related to the healthcare sector, ranging from psychotherapy to blood pressure measurements. Shark seemed with much enthusiasm demonstrated for requiring insured individuals to pour out their hearts and mental health problems into an online business licensed by their insurance company, with absolutely NO discussion - at least in the portion of the negotiations that aired on TV - about the potential privacy implications of this business plan. Does anyone ensure the privacy of the customers' personal data? Who owns the data? What uses can be made of the data by the business running the services?
# References
- Instructor Hunter and TA Randy's guidance on data frame structuring
- Data retrieved from : (https://www.kaggle.com/datasets/thirumani/shark-tank-us-dataset)
- psycopg2 installment : https://stackoverflow.com/questions/12906351/importerror-no-module-named-psycopg2
- Top 20 deals that did not go through and became successful:  https://www.youtube.com/watch?v=Jrl2YfX5_-Q
