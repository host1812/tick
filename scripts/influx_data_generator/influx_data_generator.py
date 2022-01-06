# import requests


DEFAULT_FILE_NAME = "data.influx"

with DEFAULT_FILE_NAME as f:
    lines = open(f).readlines

for line in lines:
    print(f"line: {line}")
