today=$(date +%Y%m%d)
weather_report=raw_data_$today

curl wttr.in/cairo --output $weather_report

grep °C $weather_report >tempratures.txt

Obs_tmp=$(head -1 tempratures.txt | rev | tr -s " " | xargs | cut -d " " -f2 | rev)
Fc_tmp=$(head -2 tempratures.txt | tail -1 |cut -d "C" -f 2 | tr -s " " | xargs | rev | cut -d " " -f2 | rev)

Hour=$(TZ='Egypt/Cairo' date -u +%H)
Day=$(TZ='Egypt/Cairo' date -u +%d)
Month=$(TZ='Egypt/Cairo' date -u +%m)
Year=$(TZ='Egypt/Cairo' date -u +%Y)

record=$(echo -e "$Year\t$Month\t$Day\t$Hour\t$Obs_tmp\t$Fc_tmp")
echo $record >>weather_report.log
