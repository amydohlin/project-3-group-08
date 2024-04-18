-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sA4lUP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "pitch_demo" (
    "Pitch_Number" int   NOT NULL,
    "Multiple_Entrepreneurs" bool   NOT NULL,
    "Entrepreneur_1_Name" varchar(100)   NOT NULL,
    "Entrepreneur_2_Name" varchar(100)   NOT NULL,
    "Gender" varchar(100)   NOT NULL,
    "City" varchar(100)   NOT NULL,
    "State" varchar(100)   NOT NULL,
    "Industry" varchar(100)   NOT NULL,
    CONSTRAINT "pk_pitch_demo" PRIMARY KEY (
        "Pitch_Number"
     )
);

CREATE TABLE "pitch_df" (
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

ALTER TABLE "pitch_demo" ADD CONSTRAINT "fk_pitch_demo_Pitch_Number" FOREIGN KEY("Pitch_Number")
REFERENCES "deal_df" ("Pitch_Number");

ALTER TABLE "pitch_df" ADD CONSTRAINT "fk_pitch_df_Pitch_Number" FOREIGN KEY("Pitch_Number")
REFERENCES "pitch_demo" ("Pitch_Number");

