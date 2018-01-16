#!/bin/bash
base_voltages=(800 810 820 820 820 820 830 830 850 875 880 900 940 980 1040 1070 1120 1160 1200)

psv=$(cat /sys/devices/system/soc/soc0/pvs_bin)

voltages_corrected=""

ITER=36

for i in "${base_voltages[@]}"; do
    let ITER=${ITER}-2
    i=$(( $i - $(( $psv * 8)) - $ITER ));
    voltages_corrected="$voltages_corrected $i"
done

echo $voltages_corrected > /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table
