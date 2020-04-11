; Semi-automatic bed leveling program for Creality Ender 3.
;
; This program will cause the extruder the circumnavigate the printing bed, place
; the nozzle in the base level printing position, and dwell while the user can
; adjust the bed height. Slide a sheet of paper under the nozzle at each position.
; There should be some resistance, but the paper should slide easily.
;
; Written by hal clark, 20190831.
;
; License: CC0.
; No warranty implied or granted; use at your own risk!
; This code might cause property damage, injury, or worse if improperly used.
; Confirm the validity and applicability yourself before using!
;
; See http://marlinfw.org/docs/gcode/G028.html
; and https://reprap.org/wiki/G-code for G-code listings.
;

; Display a warning message to the user.
M117 Use only if you understand the risks!
M70 P5 Use only if you understand the risks!
M0

; Configure modes.
G90 ; Use absolute spatial coordinates.
M82 ; Extruder uses absolute coordinates.
; M140 S0 ; Set bed temperature to 0 deg Celcius.
; M190 S0 ; Wait for bed temperature to reach target temp.
; M104 S0 ; Set extruder temperature to 0 deg Celcius.
; M109 S210 T0 ; Set extruder temperature and wait.

; Start near bed home position.
G1 Z10          ; Raise z-axis.
G28             ; Go to home position.

; Move clockwise around the bed, lowering to z=0 and pausing in each corner.
G1 Z10          ; Raise z-axis.
G1 X30 Y30      ; Move to Position 1
G1 Z0           ; Lower Z-axis.
M0              ; Pause print

G1 Z10
G1 X30 Y200
G1 Z0
M0

G1 Z10
G1 X200 Y200
G1 Z0
M0

G1 Z10
G1 X200 Y30
G1 Z0
M0

; Move diagonally across the bed to iteratively adjust the level.
G1 Z10 ; Lift Z axis
G1 X30 Y30
G1 Z0
M0

G1 Z10
G1 X200 Y200
G1 Z0
M0

G1 Z10
G1 X30 Y200
G1 Z0
M0

G1 Z10
G1 X200 Y30
G1 Z0
M0

; Return to home and prepare for a print.
G28
G1 Z50 ; Lift z-axis so the extruder can be easily accessed.

;
; DONE
;

