#!/usr/bin/env python
#Import statements
import sys
import os
import argparse
import configparser
import psycopg2

'''
Script to create DSRA indicator views 
Can be run from the command line with mandatory arguments 
Run this script with a command like:
python Create_DSRA_risk_profile_indicators.py --eqScenario="idm7p1_jdf_rlz_0" --retrofitPrefix="b0"
'''

#Main Function
def main ():
    os.chdir(sys.path[0])
    auth = get_config_params('config.ini')
    args = parse_args()
    sqlquerystring = open('Create_DSRA_risk_profile_indicators_template.psql', 'r').read().format(**{'eq_scenario':args.eqScenario, 'retrofit_prefix':args.retrofitPrefix})
    try:
        connection = psycopg2.connect(user = auth.get('rds', 'postgres_un'),
                                        password = auth.get('rds', 'postgres_pw'),
                                        host = auth.get('rds', 'postgres_host'),
                                        port = auth.get('rds', 'postgres_port'),
                                        database = auth.get('rds', 'postgres_db'))
        cursor = connection.cursor()
        #Drop the whole schema for each fresh run
        if args.retrofitPrefix == "b0":
            cursor.execute("DROP SCHEMA IF EXISTS results_{eq_scenario} CASCADE;".format(**{'eq_scenario':args.eqScenario}))
            cursor.execute("CREATE SCHEMA IF NOT EXISTS results_{eq_scenario};".format(**{'eq_scenario':args.eqScenario}))

        cursor.execute(sqlquerystring)
        connection.commit()
    
    
    except (Exception, psycopg2.Error) as error :
        print ("Error while connecting to PostgreSQL", error)

    finally:
        if(connection):
            cursor.close()
            connection.close()

    return


#Support Functions
def get_config_params(args):
    """
    Parse Input/Output columns from supplied *.ini file
    """
    configParseObj = configparser.ConfigParser()
    configParseObj.read(args)
    return configParseObj

def parse_args():
    parser = argparse.ArgumentParser(description='''Script to create DSRA indicator views 
    Can be run from the command line with mandatory arguments 
    Run this script with a command like:
    python Create_DSRA_risk_profile_indicators.py --eqScenario="idm7p1_jdf_rlz_0" --retrofitPrefix="b0"''')
    parser.add_argument("--eqScenario", type=str, help="Earthquake scenario id")
    parser.add_argument("--retrofitPrefix", type=str, help="Retrofit Prefix i.e. (b0, r1, r2)")

    args = parser.parse_args()
    
    return args

if __name__ == '__main__':
    main() 

    