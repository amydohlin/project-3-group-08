#import dependencies
import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

from config import user, password
####################################
# Setup access to Database
####################################
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@localhost/sharktank_db')

#reflect an existing database into a new model
Base = automap_base()
#reflect the tables from the SQL file
Base.prepare(autoload_with=engine)

#Save references to each table
Entrepreneurs = Base.classes.entrepreneur_demographics
Sharks = Base.classes.sharks_demographics
Pitches = Base.classes.pitch_info
Deals = Base.classes.deal_df

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
        f"For Shark demographics: /api/v1.0/sharks <br/>"
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

    #convert list of tuples to normal list
    entrepreneur_list = list(np.ravel(entrepreneurs))

    #Return a JSON list of stations from the dataset.
    return jsonify(entrepreneur_list)

@app.route("/api/v1.0/pitches")
def pitches():
    #Create session
    session = Session(engine)

    #query all info from the Pitches table
    deals = session.query(Pitches.Pitch_Number,
                            Pitches.Episode_Number,
                            Pitches.Season_Number,
                            Pitches.Business_Description,
                            Pitches.Got_Deal).all()
    
    session.close()

    #convert list of tuples to normal list
    pitch_list = list(np.ravel(pitches))

    #Return a JSON list of stations from the dataset.
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

    #convert list of tuples to normal list
    deal_list = list(np.ravel(deals))

    #Return a JSON list of stations from the dataset.
    return jsonify(deal_list)

if __name__ == '__main__':
    app.run(debug=True)

