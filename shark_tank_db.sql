-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sA4lUP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Recreate the tables without the foreign key constraints
CREATE TABLE "entrepreneur_demographics" (
    "Pitch_Number" int NOT NULL,
    "Multiple_Entrepreneurs" bool NOT NULL,
    "Entrepreneur_1_Name" varchar(100) NOT NULL,
    "Entrepreneur_2_Name" varchar(100),
    "Gender" varchar(100) NOT NULL,
    "City" varchar(100) NOT NULL,
    "State" varchar(100) NOT NULL,
    "Industry" varchar(100) NOT NULL,
    CONSTRAINT "pk_entrepreneur_demographics" PRIMARY KEY ("Pitch_Number")
);

CREATE TABLE "pitch_info" (
	"pitch_id" SERIAL PRIMARY KEY,
    "Pitch_Number" int NOT NULL,
    "Episode_Number" int NOT NULL,
    "Season_Number" int NOT NULL,
    "Business_Description" varchar(100),
    "Got_Deal" bool NOT NULL
);

CREATE TABLE "deal_df" (
	"deal_id" SERIAL PRIMARY KEY, 
    "Pitch_Number" int NOT NULL,
    "Total_Deal_Amount" float,
    "Total_Deal_Equity" float,
    "Original_Offered_Equity" float,
    "Valuation_Requested" int,
    "Deal_Valuation" float,
    "Investment_Amount_Per_Shark" float,
    "Equity_Per_Shark" float,
    "Number_of_Sharks_in_Deal" float,
    "Barbara_Corcoran_Investment_Amount" float,
    "Barbara_Corcoran_Investment_Equity" float,
    "Mark_Cuban_Investment_Amount" float,
    "Mark_Cuban_Investment_Equity" float,
    "Lori_Greiner_Investment_Amount" float,
    "Lori_Greiner_Investment_Equity" float,
    "Robert_Herjavec_Investment_Amount" float,
    "Robert_Herjavec_Investment_Equity" float,
    "Daymond_John_Investment_Amount" float,
    "Daymond_John_Investment_Equity" float,
    "Kevin_O_Leary_Investment_Amount" float,
    "Kevin_O_Leary_Investment_Equity" float,
    "Guest_Investment_Amount" float,
    "Guest_Investment_Equity" float
);

-- Recreate the foreign key constraints
ALTER TABLE "pitch_info" ADD CONSTRAINT "fk_pitch_info_Pitch_Number" FOREIGN KEY("Pitch_Number") REFERENCES "entrepreneur_demographics" ("Pitch_Number");
ALTER TABLE "deal_df" ADD CONSTRAINT "fk_deal_df_Pitch_Number" FOREIGN KEY("Pitch_Number") REFERENCES "entrepreneur_demographics" ("Pitch_Number");


