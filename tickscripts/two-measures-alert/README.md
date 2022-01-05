# Notes on two measures alert

Note #1:
In `influxDBOut` node, you have to supply only `value`. If you use anything else, alert will trigger, however you will not see alert history in Chronograf UI.

Note #2:
Be specific on what value you want to `keep` in `influxDBOut`. Otherwise `influxDBOut` is failing to save data to the database.
