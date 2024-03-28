###################################################################

# Created by write_sdc on Tue Mar 7 20:38:58 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_max_area 0
set_fanout_load 8 [get_ports ready]
set_fanout_load 8 [get_ports {result[3]}]
set_fanout_load 8 [get_ports {result[2]}]
set_fanout_load 8 [get_ports {result[1]}]
set_fanout_load 8 [get_ports {result[0]}]
set_load -pin_load 0.1 [get_ports ready]
set_load -pin_load 0.1 [get_ports {result[3]}]
set_load -pin_load 0.1 [get_ports {result[2]}]
set_load -pin_load 0.1 [get_ports {result[1]}]
set_load -pin_load 0.1 [get_ports {result[0]}]
set_max_fanout 1 [get_ports start]
set_max_fanout 1 [get_ports clk]
set_max_fanout 1 [get_ports clear]
set_max_fanout 1 [get_ports {num[6]}]
set_max_fanout 1 [get_ports {num[5]}]
set_max_fanout 1 [get_ports {num[4]}]
set_max_fanout 1 [get_ports {num[3]}]
set_max_fanout 1 [get_ports {num[2]}]
set_max_fanout 1 [get_ports {num[1]}]
set_max_fanout 1 [get_ports {num[0]}]
create_clock [get_ports clk]  -period 40  -waveform {0 20}
set_clock_latency 0.3  [get_clocks clk]
set_input_delay -clock clk  2  [get_ports clk]
set_input_delay -clock clk  2  [get_ports start]
set_input_delay -clock clk  2  [get_ports clear]
set_input_delay -clock clk  2  [get_ports {num[6]}]
set_input_delay -clock clk  2  [get_ports {num[5]}]
set_input_delay -clock clk  2  [get_ports {num[4]}]
set_input_delay -clock clk  2  [get_ports {num[3]}]
set_input_delay -clock clk  2  [get_ports {num[2]}]
set_input_delay -clock clk  2  [get_ports {num[1]}]
set_input_delay -clock clk  2  [get_ports {num[0]}]
set_output_delay -clock clk  1.65  [get_ports ready]
set_output_delay -clock clk  1.65  [get_ports {result[3]}]
set_output_delay -clock clk  1.65  [get_ports {result[2]}]
set_output_delay -clock clk  1.65  [get_ports {result[1]}]
set_output_delay -clock clk  1.65  [get_ports {result[0]}]
