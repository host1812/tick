import os
import re
# import requests


DEFAULT_FILE_NAME = "data.influx"

influx_data_file = os.path.join(os.path.dirname(os.path.realpath(__file__)),DEFAULT_FILE_NAME)

with open(influx_data_file) as f:
    lines = f.readlines()

for line in lines:
    print(f"line: {line}")
    if "$random" in line:
        print("random token detected")
        random_funcs = re.findall(r"\$random\(.*\)", line)
        for rand_func in random_funcs:
            min, max = re.findall(r"\d+", rand_func)
            print(f"min: {min}, max: {max}")
