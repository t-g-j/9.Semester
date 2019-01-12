vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../bd/clk_divider_design/ip/clk_divider_design_clk_divider_0_0/sim/clk_divider_design_clk_divider_0_0.vhd" \
"../../../bd/clk_divider_design/sim/clk_divider_design.vhd" \


