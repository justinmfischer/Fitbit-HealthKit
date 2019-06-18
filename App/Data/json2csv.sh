#!/bin/bash

for eachFile in Fitbit/BodyMeasurements/*.json
	do
	    cat $eachFile | jq -r '.[] | {weight, bmi, fat, date: "\(.date) \(.time)"} | [.[] | tostring] | @csv' >> fitbit-data.csv
	done
