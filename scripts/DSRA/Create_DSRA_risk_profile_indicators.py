#!/usr/bin/env python
#Import statements
import sys
import os
import argparse
import configparser
import psycopg2

#Main Function
def main ():
    os.chdir(sys.path[0])
    auth = get_config_params('config.ini')
    sqlquerystring = open('Create_DSRA_risk_profile_indicators_template.psql', 'r').read().format(**{'eq_scenario':'idm7p1_jdf_rlz_2', 'retrofit_prefix':'r2'})
    try:
        connection = psycopg2.connect(user = auth.get('rds', 'postgres_un'),
                                        password = auth.get('rds', 'postgres_pw'),
                                        host = auth.get('rds', 'postgres_host'),
                                        port = auth.get('rds', 'postgres_port'),
                                        database = auth.get('rds', 'postgres_db'))
        cursor = connection.cursor()
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
 
    parser = argparse.ArgumentParser(description="script description")
    parser.add_argument("--arg1", type=str, help="First argument")

    args = parser.parse_args()
    
    return args

if __name__ == '__main__':
    main() 

    