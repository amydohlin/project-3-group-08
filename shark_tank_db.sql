-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sA4lUP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.



-- Drop the foreign key constraints first
ALTER TABLE "pitch_info" DROP CONSTRAINT "fk_pitch_info_Pitch_Number";
ALTER TABLE "deal_df" DROP CONSTRAINT "fk_deal_df_Pitch_Number";

-- Drop the dependent tables
DROP TABLE IF EXISTS pitch_info;
DROP TABLE IF EXISTS deal_df;

-- Drop the main table with CASCADE to drop dependent objects
DROP TABLE IF EXISTS entrepreneur_demographics CASCADE;

-- Recreate the tables without the foreign key constraints
CREATE TABLE "entrepreneur_demographics" (
    "Pitch_Number" int NOT NULL,
    "Multiple_Entrepreneurs" bool NOT NULL,
    "Entrepreneur_1_Name" varchar(100) NOT NULL,
    "Entrepreneur_2_Name" varchar(100) NOT NULL,
    "Gender" varchar(100) NOT NULL,
    "City" varchar(100) NOT NULL,
    "State" varchar(100) NOT NULL,
    "Industry" varchar(100) NOT NULL,
    CONSTRAINT "pk_entrepreneur_demographics" PRIMARY KEY ("Pitch_Number")
);

CREATE TABLE "pitch_info" (
    "Pitch_Number" int NOT NULL,
    "Episode_Number" int NOT NULL,
    "Season_Number" int NOT NULL,
    "Business_Description" varchar(100) NOT NULL,
    "Got_Deal" bool NOT NULL
);

CREATE TABLE "deal_df" (
    "Pitch_Number" int NOT NULL,
    "Total_Deal_Amount" float NOT NULL,
    "Total_Deal_Equity" float NOT NULL,
    "Original_Offered_Equity" float NOT NULL,
    "Valuation_Requested" int NOT NULL,
    "Deal_Valuation" float NOT NULL,
    "Investment_Amount_Per_Shark" float NOT NULL,
    "Equity_Per_Shark" float NOT NULL,
    "Number_of_Sharks_in_Deal" float NOT NULL,
    "Barbara_Corcoran_Investment_Amount" float NOT NULL,
    "Barbara_Corcoran_Investment_Equity" float NOT NULL,
    "Mark_Cuban_Investment_Amount" float NOT NULL,
    "Mark_Cuban_Investment_Equity" float NOT NULL,
    "Lori_Greiner_Investment_Amount" float NOT NULL,
    "Lori_Greiner_Investment_Equity" float NOT NULL,
    "Robert_Herjavec_Investment_Amount" float NOT NULL,
    "Robert_Herjavec_Investment_Equity" float NOT NULL,
    "Daymond_John_Investment_Amount" float NOT NULL,
    "Daymond_John_Investment_Equity" float NOT NULL,
    "Kevin_O_Leary_Investment_Amount" float NOT NULL,
    "Kevin_O_Leary_Investment_Equity" float NOT NULL,
    "Guest_Investment_Amount" float NOT NULL,
    "Guest_Investment_Equity" float NOT NULL
);

-- Recreate the foreign key constraints
ALTER TABLE "pitch_info" ADD CONSTRAINT "fk_pitch_info_Pitch_Number" FOREIGN KEY("Pitch_Number") REFERENCES "entrepreneur_demographics" ("Pitch_Number");
ALTER TABLE "deal_df" ADD CONSTRAINT "fk_deal_df_Pitch_Number" FOREIGN KEY("Pitch_Number") REFERENCES "entrepreneur_demographics" ("Pitch_Number");


CREATE TABLE "sharks_demographics" (

);

CREATE TABLE "entrepreneur_demographics" (
    "Pitch_Number" int   NOT NULL,
    "Multiple_Entrepreneurs" bool   NOT NULL,
    "Entrepreneur_1_Name" varchar(100)   NOT NULL,
    "Entrepreneur_2_Name" varchar(100)   NOT NULL,
    "Gender" varchar(100)   NOT NULL,
    "City" varchar(100)   NOT NULL,
    "State" varchar(100)   NOT NULL,
    "Industry" varchar(100)   NOT NULL,
    CONSTRAINT "pk_entrepreneur_demographics" PRIMARY KEY (
        "Pitch_Number"
     )
);

CREATE TABLE "pitch_info" (
    "Pitch_Number" int   NOT NULL,
    "Episode_Number" int   NOT NULL,
    "Season_Number" int   NOT NULL,
    "Business_Description" varchar(100)   NOT NULL,
    "Got_Deal" bool   NOT NULL
);

CREATE TABLE "deal_df" (
    "Pitch_Number" int   NOT NULL,
    "Total_Deal_Amount" float   NOT NULL,
    "Total_Deal_Equity" float   NOT NULL,
    "Original_Offered_Equity" float   NOT NULL,
    "Valuation_Requested" int   NOT NULL,
    "Deal_Valuation" float   NOT NULL,
    "Investment_Amount_Per_Shark" float   NOT NULL,
    "Equity_Per_Shark" float   NOT NULL,
    "Number_of_Sharks_in_Deal" float   NOT NULL,
    "Barbara_Corcoran_Investment_Amount" float   NOT NULL,
    "Barbara_Corcoran_Investment_Equity" float   NOT NULL,
    "Mark_Cuban_Investment_Amount" float   NOT NULL,
    "Mark_Cuban_Investment_Equity" float   NOT NULL,
    "Lori_Greiner_Investment_Amount" float   NOT NULL,
    "Lori_Greiner_Investment_Equity" float   NOT NULL,
    "Robert_Herjavec_Investment_Amount" float   NOT NULL,
    "Robert_Herjavec_Investment_Equity" float   NOT NULL,
    "Daymond_John_Investment_Amount" float   NOT NULL,
    "Daymond_John_Investment_Equity" float   NOT NULL,
    "Kevin_O_Leary_Investment_Amount" float   NOT NULL,
    "Kevin_O_Leary_Investment_Equity" float   NOT NULL,
    "Guest_Investment_Amount" float   NOT NULL,
    "Guest_Investment_Equity" float   NOT NULL
);

ALTER TABLE "pitch_info" ADD CONSTRAINT "fk_pitch_info_Pitch_Number" FOREIGN KEY("Pitch_Number")
REFERENCES "entrepreneur_demographics" ("Pitch_Number");

ALTER TABLE "deal_df" ADD CONSTRAINT "fk_deal_df_Pitch_Number" FOREIGN KEY("Pitch_Number")
REFERENCES "entrepreneur_demographics" ("Pitch_Number");


