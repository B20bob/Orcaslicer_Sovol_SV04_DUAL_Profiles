

-------------Filament START G-code > Tool T1 (Right):-------------

; Filament gcode T0 (Start)
T1
;raise to operating temp
M104 S200
M109 S200
M106 S255 ;set part cooling fan to max

;lower into position
;G1 Z(layer_z)

;G1 F600 E5.5
; Filament gcode T0 (End)



--------------Filament END G-code > Tool T1 (Right):--------------

; filament end gcode 
;END Gcode for filament T0 (Start)
G92 E0
G1 F600 E-1 ; Retract
;G0 X-20 F12000 ; Park T0
;raise nozzle
;G1 Z(layer_z + 10)
;drop temp to idle
M104 S190
;park and change tool
;T0
M106 S0 ;turn off part cooling fan
;G92 E0 (DON'T USE! LAYER SHIFT!!)
;{if has_wipe_tower and total_toolchanges > 0}T1
;G0 X{wipe_tower_x[0]} Y{wipe_tower_y[0]} F{travel_speed*60}{endif}
;END gcode for filament T0 (End)


