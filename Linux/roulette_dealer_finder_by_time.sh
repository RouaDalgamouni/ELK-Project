#!/bin/bash

cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis


grep -i "$1" $2_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
