onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+unity_excercise_design_1 -L xilinx_vip -L axi_infrastructure_v1_1_0 -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L lib_cdc_v1_0_2 -L axi_uartlite_v2_0_21 -L proc_sys_reset_v5_0_12 -L generic_baseblocks_v2_1_0 -L fifo_generator_v13_2_2 -L axi_data_fifo_v2_1_16 -L axi_register_slice_v2_1_17 -L axi_protocol_converter_v2_1_17 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.unity_excercise_design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {unity_excercise_design_1.udo}

run -all

endsim

quit -force
