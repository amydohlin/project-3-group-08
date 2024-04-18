#import dependencies
import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

from config import user, password, database
####################################
# Setup access to Database
####################################
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@localhost/{database}')

#reflect an existing database into a new model
Base = automap_base()
#reflect the tables from the SQL file
Base.prepare(autoload_with=engine)

#Save references to each table
Entrepreneurs = Base.classes.entrepreneur_demographics
Pitches = Base.classes.pitch_info
Deals = Base.classes.deal_df
#in the future: shark demographics table can also be added as an endpoint
#Sharks = Base.classes.sharks_demographics

####################################
# Flask Setup
####################################
app = Flask(__name__)

####################################
# Flask Routes
####################################
@app.route("/")
def homepage():
    """List all available routes."""
    return(
        f"Welcome to the SharkTank Database API.<br>"
        f"Available Routes:<br/>"
        f"For Entrepreneur demographics: /api/v1.0/entrepreneurs <br/>"
        #f"For Shark demographics: /api/v1.0/sharks <br/>"
        f"For Pitch Info: /api/v1.0/pitches <br/>"
        f"For Deal Info: /api/v1.0/deals <br/>"
    )

@app.route("/api/v1.0/entrepreneurs")
def entrepreneurs():
    #Create session
    session = Session(engine)

    #query all info from the Entrepreneur table
    entrepreneurs = session.query(Entrepreneurs.Pitch_Number,
                                  Entrepreneurs.Multiple_Entrepreneurs, 
                                  Entrepreneurs.Entrepreneur_1_Name,
                                  Entrepreneurs.Entrepreneur_2_Name,
                                  Entrepreneurs.Gender,
                                  Entrepreneurs.City,
                                  Entrepreneurs.State,
                                  Entrepreneurs.Industry).all()
    
    session.close()

    #create a dictionary from the query data
    entrepreneur_list = []
    for number, multiples, e_1_name, e_2_name, gender,\
          city, state, industry in entrepreneurs:
        entrepreneur_dict = {}
        entrepreneur_dict["Pitch_Number"] = number
        entrepreneur_dict["Multiple_Entrepreneurs"] = multiples
        entrepreneur_dict["Entrepreneur_1_Name"] = e_1_name
        entrepreneur_dict["Entrepreneur_2_Name"] = e_2_name
        entrepreneur_dict["Gender"] = gender
        entrepreneur_dict["City"] = city
        entrepreneur_dict["State"] = state
        entrepreneur_dict["Industry"] = industry
        entrepreneur_list.append(entrepreneur_dict)

    #Return a JSON list of entrepreneurs from the dataset.
    return jsonify(entrepreneur_list)

@app.route("/api/v1.0/pitches")
def pitches():
    #Create session
    session = Session(engine)

    #query all info from the Pitches table
    pitches = session.query(Pitches.Pitch_Number,
                            Pitches.Episode_Number,
                            Pitches.Season_Number,
                            Pitches.Business_Description,
                            Pitches.Got_Deal).all()
    
    session.close()
    
    #create a dictionary from the query data
    pitch_list = []
    for p_number, e_number, s_number, description, deal in pitches:
        pitch_dict = {}
        pitch_dict["Pitch_Number"] = p_number
        pitch_dict["Episode_Number"] = e_number
        pitch_dict["Season_Number"] = s_number
        pitch_dict["Business_Description"] = description
        pitch_dict["Got_Deal"] = deal

        pitch_list.append(pitch_dict)

    #Return a JSON list of pitches from the dataset.
    return jsonify(pitch_list)

@app.route("/api/v1.0/deals")
def deals():
    #Create session
    session = Session(engine)

    #query all info from the Deals table
    deals = session.query(Deals.Pitch_Number,
                            Deals.Total_Deal_Amount,
                            Deals.Total_Deal_Equity,
                            Deals.Original_Offered_Equity,
                            Deals.Valuation_Requested,
                            Deals.Deal_Valuation,
                            Deals.Investment_Amount_Per_Shark,
                            Deals.Equity_Per_Shark,
                            Deals.Number_of_Sharks_in_Deal,
                            Deals.Barbara_Corcoran_Investment_Amount,
                            Deals.Barbara_Corcoran_Investment_Equity,
                            Deals.Mark_Cuban_Investment_Amount,
                            Deals.Mark_Cuban_Investment_Equity,
                            Deals.Lori_Greiner_Investment_Amount,
                            Deals.Lori_Greiner_Investment_Equity,
                            Deals.Robert_Herjavec_Investment_Amount,
                            Deals.Robert_Herjavec_Investment_Equity,
                            Deals.Daymond_John_Investment_Amount,
                            Deals.Daymond_John_Investment_Equity,
                            Deals.Kevin_O_Leary_Investment_Amount,
                            Deals.Kevin_O_Leary_Investment_Equity,
                            Deals.Guest_Investment_Amount,
                            Deals.Guest_Investment_Equity).all()
    
    session.close()
    
    #create a dictionary from the query data
    deal_list = []
    for p_number, total_amount, total_equity, offered_equity, valuation_req,\
          deal_val, invest_per, equity_per, number_sharks,\
          bc_amount, bc_equity, mc_amount, mc_equity, lg_amount, lg_equity,\
          rh_amount, rh_equity, dj_amount, dj_equity, kl_amount, kl_equity,\
          guest_amount, guest_equity\
          in deals:
        
        deal_dict = {}
        deal_dict["Pitch_Number"] = p_number
        deal_dict["Total_Deal_Amount"] = total_amount
        deal_dict["Total_Deal_Equity"] = total_equity
        deal_dict["Original_Offered_Equity"] = offered_equity
        deal_dict["Valuation_Requested"] = valuation_req
        deal_dict["Deal_Valuation"] = deal_val
        deal_dict["Investment_Amount_Per_Shark"] = invest_per
        deal_dict["Equity_Per_Shark"] = equity_per
        deal_dict["Number_of_Sharks_in_Deal"] = number_sharks
        deal_dict["Barbara_Corcoran_Investment_Amount"] = bc_amount
        deal_dict["Barbara_Corcoran_Investment_Equity"] = bc_equity
        deal_dict["Mark_Cuban_Investment_Amount"] = mc_amount
        deal_dict["Mark_Cuban_Investment_Equity"] = mc_equity
        deal_dict["Lori_Greiner_Investment_Amount"] = lg_amount
        deal_dict["Lori_Greiner_Investment_Equity"] = lg_equity
        deal_dict["Robert_Herjavec_Investment_Amount"] = rh_amount
        deal_dict["Robert_Herjavec_Investment_Equity"] = rh_equity
        deal_dict["Daymond_John_Investment_Amount"] = dj_amount
        deal_dict["Daymond_John_Investment_Equity"] = dj_equity
        deal_dict["Kevin_O_Leary_Investment_Amount"] = kl_amount
        deal_dict["Kevin_O_Leary_Investment_Equity"] = kl_equity
        deal_dict["Guest_Investment_Amount"] = guest_amount
        deal_dict["Guest_Investment_Equity"] = guest_equity

        deal_list.append(deal_dict)

    #Return a JSON list of deals from the dataset.
    return jsonify(deal_list)

if __name__ == '__main__':
    app.run(debug=True)

