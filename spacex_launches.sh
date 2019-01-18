#!/bin/sh
# with jq and curl installed
# Get specific stats for latest SpaceX mission (unofficial)
# ISC License (ISC)
# https://opensource.org/licenses/ISC
# Copyright © 2019 nick3499

blob=$(curl -s https://api.spacexdata.com/v3/launches/latest | jq '.')
ld=$(date +'%a %d %b %Y %r %Z' -d "@$(echo $blob | jq '.launch_date_unix')")

echo "\033[0;33m*** Latest SpaceX Mission ***\033[0;0m"
echo "\033[0;32mMission:\033[0;0m $(echo $blob | jq '.mission_name' | tr -d '"')" \
"\033[0;32m- Flight number:\033[0;0m $(echo $blob | jq '.flight_number')"
echo '\033[0;33mLaunch date:\033[0;0m' $ld
echo "\033[0;33mRocket:\033[0;0m \033[0;32mName:\033[0;0m $(echo $blob | jq '.rocket.rocket_name' | tr -d '"')" \
"\033[0;32m- Type:\033[0;0m $(echo $blob | jq '.rocket.rocket_type' | tr -d '"')"
echo "\033[0;33mLanding:\033[0;0m \033[0;32mType:\033[0;0m $(echo $blob | jq '.rocket.first_stage.cores[0].landing_type' | tr -d '"')" \
"\033[0;32m- Vehicle:\033[0;0m $(echo $blob | jq '.rocket.first_stage.cores[0].landing_vehicle' | tr -d '"')"
echo "\033[0;33mPayload:\033[0;0m \033[0;32mCustomer:\033[0;0m $(echo $blob | jq '.rocket.second_stage.payloads[0].customers[0]' | tr -d '"')" \
"\033[0;32m- Country:\033[0;0m $(echo $blob | jq '.rocket.second_stage.payloads[0].nationality' | tr -d '"')" \
"\033[0;32m- Manufacturer:\033[0;0m $(echo $blob | jq '.rocket.second_stage.payloads[0].manufacturer' | tr -d '"')" \
"\033[0;32m- Payload type:\033[0;0m $(echo $blob | jq '.rocket.second_stage.payloads[0].payload_type' | tr -d '"')"
echo "\033[0;33mOrbit:\033[0;0m $(echo $blob | jq '.rocket.second_stage.payloads[0].orbit' | tr -d '"')"
echo "\033[0;33mLaunch site:\033[0;0m $(echo $blob | jq '.launch_site.site_name_long' | tr -d '"')"
echo "\033[0;33mDetails:\033[0;0m $(echo $blob | jq '.details' | tr -d '"' | fmt -w 80)"
