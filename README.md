# Fitbit-HealthKit
An iOS app which bulk imports Fitbit Aira scale CSV Weight (Pounds), Body Mass Index (BMI) and Body Fat Percentage (BFP) measurement data into Apple's HealthKit. This pattern can be more broadly expanded to include other HKQuantityTypeIdentifiers which include Steps, Running, Walking, Cycling, Etc.

While this example uses local data, it could be further enhanced by leveraging the Fitbit REST APIs and OAuth 2.0.

# Example
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/health-importer.gif "Example")

# Getting started

# 1. Request data archive from Fitbit
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive.png "Archive")
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive-confirm.png "Confirm")
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive-complete.png "Complete")

# 2. Install jq (lightweight and flexible command-line JSON processor) https://stedolan.github.io/jq
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/jq.png "Download")

# 3. Copy the weight.json files from the archive ▸ user-site-export into Health-Import⁩ ▸ ⁨App⁩ ▸ ⁨Data⁩ ▸ ⁨Fitbit⁩ ▸ BodyMeasurements

![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/user-site-export.png "Export")
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/body-measurements.png "Import")

# 4. Run json2csv.sh

![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/cli-1.png "CLI")
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/cli-2.png "CLI")

# 5. Run Health-Importer on device


