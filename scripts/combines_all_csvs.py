#script found online to combine all csvs into one
import os
import glob
import pandas as pd
#directory link
os.chdir("C:/Workspace/eRisk_CA/PSRA_sample_data/baseline/c-damage")
extension = 'csv'
all_filenames = [i for i in glob.glob('*.{}'.format(extension))]
#combine all files in the list
combined_csv = pd.concat([pd.read_csv(f) for f in all_filenames ])
#export to csv
combined_csv.to_csv( "damages-structural-mean_merge_baseline.csv", index=False, encoding='utf-8-sig')