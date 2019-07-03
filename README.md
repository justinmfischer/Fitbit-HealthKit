# Fitbit-HealthKit
An iOS app which bulk imports Fitbit Aira scale CSV Weight (Pounds), Body Mass Index (BMI) and Body Fat Percentage (BFP) measurement data into Apple's HealthKit. This pattern can be more broadly expanded to include other HKQuantityTypeIdentifiers which include Steps, Running, Walking, Cycling, Etc.

While this example uses local data, it could be further enhanced by leveraging the Fitbit REST APIs and OAuth 2.0.

# Example
![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/health-importer.gif "Example")

# Getting started

# 1. Request data archive from Fitbit
<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive.png "Archive")</kbd>

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive-confirm.png "Confirm")</kbd>

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/fitbit-archive-complete.png "Complete")</kbd>

# 2. Install jq (lightweight and flexible command-line JSON processor) https://stedolan.github.io/jq
<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/jq.png "Download")</kbd>

# 3. Copy the weight.json files from the archive ▸ user-site-export into Health-Import⁩ ▸ ⁨App⁩ ▸ ⁨Data⁩ ▸ ⁨Fitbit⁩ ▸ BodyMeasurements

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/user-site-export.png "Export")</kbd>

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/body-measurements.png "Import")</kbd>

# 4. Run json2csv.sh

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/cli-1.png "CLI")</kbd>

<kbd>![alt text](https://github.com/justinmfischer/Fitbit-HealthKit/blob/master/Github/cli-2.png "CLI")</kbd>

# 5. Run Health-Importer on device


