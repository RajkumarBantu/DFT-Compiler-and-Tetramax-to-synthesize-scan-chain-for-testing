#Set target library
set target_library "/home/banturr/Desktop/VLSI_Test_Power/Lab3/db/saed90nm_typ_ht.db"

#Set link library
set link_library "/home/banturr/Desktop/VLSI_Test_Power/Lab3/db/saed90nm_typ_ht.db"

#Set symbol library
set symbol_library "/home/banturr/Desktop/VLSI_Test_Power/Lab3/db/saed90nm.sdb"


#Analyze
analyze -library work -format verilog "/home/banturr/Desktop/VLSI_Test_Power/Lab3/src/sqrt.v"

#Elaborate
elaborate sqrt_Top -architecture verilog -library DEFAULT

#Link
link

#Uniquify
uniquify -force

#constraints
create_clock clk -period 40 -waveform {0 20}
set_clock_latency 0.3 clk
set_input_delay 2.0 -clock clk [all_inputs]
set_output_delay 1.65 -clock clk [all_outputs]
set_load 0.1 [all_outputs]
set_max_fanout 1 [all_inputs]
set_fanout_load 8 [all_outputs]
report_port
set_max_area 0

#Checking design and timing
check_design
check_timing

#Compile
compile -exact_map

# Critical path
change_selection -name global -replace [get_timing_paths -delay_type max -nworst 1 -max_paths 1 -include_hierarchical_pins]

#Reports
report_area -hierarchy > /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/sqrt.area 
report_timing > /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/sqrt.timing
report_power > /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/sqrt.power
report_cell > /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/sqrt.cell

#Gate Level Netlist .v File
write -hierarchy -format verilog -output write -hierarchy -format verilog -output /home/banturr/Desktop/VLSI_Test_Power/Lab3/src/sqrt_net_level.v

# .sdc File Generation
write_sdc -nosplit /home/banturr/Desktop/VLSI_Test_Power/Lab3/src/sqrt.sdc

set dft_runname scan
set scan_library [list /home/banturr/Desktop/VLSI_Test_Power/Lab3/db/saed90nm_typ_ht.db]
set scancell DFFPOSX1_SCAN
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 40
set test_default_period 100
set test_default_scan_style multiplexed_flip_flop



# Update filebase
set basename {sqrt_Top}
set filebase [format "%s%s" [format "%s%s" $basename "_"] $dft_runname]
# Update target library
set target_library [list $target_library $scan_library]
set_scan_register_type -type ${scancell}
set_scan_configuration -create_dedicated_scan_out_ports true
create_test_protocol -infer_async -infer_clock
dft_drc -verbose >> "/home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/dft_drc_report.txt"
compile -scan
report_constraint -all_violators >> "/home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/constraint_report.txt"


insert_dft
set_drive 2 test_si
set_drive 2 test_se
set_scan_configuration -replace false
insert_dft
report_constraint -all_violators >> "/home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/post_dft_insert_constr_report.txt"
dft_drc -verbose -coverage_estimate >> "/home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/post_dft_insert_drc_report.txt"
report_scan_path -view existing -chain all >> "/home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/report_scan_path_results.txt"
report_cell


# report violators
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/ $filebase ".violators"]
redirect $filename { report_constraint -all_violators }
# report dft_drc
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/ $filebase ".dft_drc"]
redirect $filename { dft_drc -verbose -coverage_estimate }
# report scan path
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/ $filebase ".scan_path"]
redirect $filename { report_scan_path -view existing -chain all }
# report cells
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/reports/ $filebase ".cell"]
redirect $filename { report_cell }
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/src/ $filebase ".spf"]
write_test_protocol -output $filename
set filename [format "%s%s%s" /home/banturr/Desktop/VLSI_Test_Power/Lab3/src/ $filebase ".v"]
redirect change_names { change_names -rules verilog -hierarchy -verbose }
write -format verilog -hierarchy -output $filename
