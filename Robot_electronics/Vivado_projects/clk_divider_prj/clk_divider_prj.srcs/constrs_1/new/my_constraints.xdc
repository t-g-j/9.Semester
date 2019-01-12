set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports {divider_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {divider_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {divider_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {divider_o[0]}]
set_property SLEW SLOW [get_ports {divider_o[3]}]
set_property SLEW SLOW [get_ports {divider_o[2]}]
set_property SLEW SLOW [get_ports {divider_o[1]}]
set_property SLEW SLOW [get_ports {divider_o[0]}]
set_property PACKAGE_PIN N7 [get_ports clk_in]

set_property PACKAGE_PIN E13 [get_ports {divider_o[2]}]
set_property PACKAGE_PIN E11 [get_ports {divider_o[1]}]
set_property PACKAGE_PIN E12 [get_ports {divider_o[0]}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_IBUF]


set_property PACKAGE_PIN F12 [get_ports {divider_o[3]}]
set_property PULLDOWN true [get_ports clk_in]
set_property PULLDOWN true [get_ports {divider_o[3]}]
set_property PULLDOWN true [get_ports {divider_o[2]}]
set_property PULLDOWN true [get_ports {divider_o[1]}]
set_property PULLDOWN true [get_ports {divider_o[0]}]
