; --- Global Settings
; layer_height = {layer_height}
; smooth_spiralized_contours = {smooth_spiralized_contours}
; magic_mesh_surface_mode = {magic_mesh_surface_mode}
; machine_extruder_count = {machine_extruder_count}
; default_material_bed_temperature = {default_material_bed_temperature}
; default_material_print_temperature = {default_material_print_temperature}
; material_bed_temperature = {material_bed_temperature}
; material_bed_temperature_layer_0 = {material_bed_temperature_layer_0}
; material_print_temperature = {material_print_temperature}
; material_print_temperature_layer_0 = {material_print_temperature_layer_0}
; --- Single Extruder Settings
; speed_z_hop = {speed_z_hop}
; retraction_amount = {retraction_amount}
; retraction_hop = {retraction_hop}
; retraction_hop_enabled = {retraction_hop_enabled}
; retraction_enable = {retraction_enable}
; retraction_speed = {retraction_speed}
; retraction_retract_speed = {retraction_retract_speed}
; retraction_prime_speed = {retraction_prime_speed}
; speed_travel = {speed_travel}

; Ender 3 Custom Start G-code
G92 E0 ; Reset Extruder
M104 S120
M140 S{material_bed_temperature_layer_0} ; set final bed temp
G4 S10 ; allow partial nozzle warmup
G28 ; Home all axes
G0 Z0.16
G92 Z0
G1 Z2.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
M104 S{material_print_temperature_layer_0} ; set final nozzle temp
M190 S{material_bed_temperature_layer_0} ; wait for bed temp to stabilize
M109 S{material_print_temperature_layer_0} ; wait for nozzle temp to stabilize
G92 E0
G1 X5 Y20 Z0.3 F5000.0 ; Move to start position
M290 Z0.2 ; Babystep Z
M900 K0.6 ; Linear Advance
G1 X5 Y200.0 Z0.3 F1500.0 E15 ; Draw the first line
G1 X5.3 Y200.0 Z0.3 F5000.0 ; Move to side a little
G1 X5.3 Y20 Z0.3 F1500.0 E30 ; Draw the second line
G92 E0 ; Reset Extruder
G1 Z2.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X15 Y20 Z0.3 F5000.0 ; Move over to prevent blob squish