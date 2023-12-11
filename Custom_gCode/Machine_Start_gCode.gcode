;sv04_Dual start

M605 S1 ;Set printer to auto park mode
T0 ;Make sure to use left extruder
M140 S[first_layer_bed_temperature] ;start preheating the bed
G28 ;home all axes
M190 S[first_layer_bed_temperature] ; heat to bed setting in Cura and WAIT
G34; Run Z-Stepper auto align
G29; BLTOUCH Mesh Generation
G1 Z5 F5000 ; lift nozzle
M104 S[first_layer_temperature] ;start preheating the hotend
M104 T1 S{(first_layer_temperature[current_extruder])-50} ;Partially heat 2nd extruder
M109 S[first_layer_temperature]; Heat hotend to setting in CURA and wait

G92 E0; reset extruder 1
G1 X2.0 Y20 Z0.28 F5000.0;
G1 X2.0 Y200.0 Z0.28 F1500.0 E15;
G1 X2.4 Y200.0 Z0.28 F5000.0;
G1 X2.4 Y20 Z0.28 F1500.0 E15;
G92 E0 ;Reset Extruder 1
G1 Z2.0 F3000;

; new code to purge right extruder too
M104 S{(first_layer_temperature[current_extruder])-50}; partially cool down extruder 1
T1; switch extruder
; Fully heat it
M104 S[first_layer_temperature]
M109 S[first_layer_temperature]

; purge line

G92 E0;
G1 X301.8 Y20 Z0.28 F5000.0;
G1 X301.8 Y200.0 Z0.28 F1500.0 E15;
G1 X302 Y200.0 Z0.28 F5000.0;
G1 X302 Y20 Z0.28 F1500.0 E15;
G92 E0; Reset extruder
G1 Z2.0 F3000;

; back to idle temp
M104 S{(first_layer_temperature[current_extruder])-20}

; park and swap back to T0
T0