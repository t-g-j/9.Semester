vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_protocol_checker_v2_0_3
vlib modelsim_lib/msim/axi_vip_v1_1_3
vlib modelsim_lib/msim/processing_system7_vip_v1_0_5
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_21
vlib modelsim_lib/msim/proc_sys_reset_v5_0_12
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_2
vlib modelsim_lib/msim/axi_data_fifo_v2_1_16
vlib modelsim_lib/msim/axi_register_slice_v2_1_17
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_17

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 modelsim_lib/msim/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 modelsim_lib/msim/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 modelsim_lib/msim/processing_system7_vip_v1_0_5
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_21 modelsim_lib/msim/axi_uartlite_v2_0_21
vmap proc_sys_reset_v5_0_12 modelsim_lib/msim/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_2 modelsim_lib/msim/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_16 modelsim_lib/msim/axi_data_fifo_v2_1_16
vmap axi_register_slice_v2_1_17 modelsim_lib/msim/axi_register_slice_v2_1_17
vmap axi_protocol_converter_v2_1_17 modelsim_lib/msim/axi_protocol_converter_v2_1_17

vlog -work xilinx_vip -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5 -64 -incr -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/unity_excercise_design_1/ip/unity_excercise_design_1_processing_system7_0_0/sim/unity_excercise_design_1_processing_system7_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/unity_excercise_design_1/ip/unity_excercise_design_1_pl_top_0_0/sim/unity_excercise_design_1_pl_top_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_21 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/a15e/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/unity_excercise_design_1/ip/unity_excercise_design_1_axi_uartlite_0_1/sim/unity_excercise_design_1_axi_uartlite_0_1.vhd" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/unity_excercise_design_1/ip/unity_excercise_design_1_rst_ps7_0_50M_1/sim/unity_excercise_design_1_rst_ps7_0_50M_1.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -64 -93 \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_16 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_17 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_17 -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/ec67/hdl" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../unity_exercise.srcs/sources_1/bd/unity_excercise_design_1/ipshared/70fd/hdl" "+incdir+/home/tj/Documents/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/unity_excercise_design_1/ip/unity_excercise_design_1_auto_pc_0/sim/unity_excercise_design_1_auto_pc_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/unity_excercise_design_1/sim/unity_excercise_design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

