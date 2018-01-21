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

#if standard break here
echo $voltages_corrected > /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table


# apply OC settings here

MAX_FREQ=2726400

#if powersave set MAX_FREQ to 1,5Ghz

echo 0 > /sys/module/msm_thermal/core_control/enabled
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online

echo $MAX_FREQ > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo $MAX_FREQ > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo $MAX_FREQ > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo $MAX_FREQ > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
