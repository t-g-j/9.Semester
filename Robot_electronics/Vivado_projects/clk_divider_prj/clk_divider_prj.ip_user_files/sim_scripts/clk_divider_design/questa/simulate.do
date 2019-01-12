onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk_divider_design_opt

do {wave.do}

view wave
view structure
view signals

do {clk_divider_design.udo}

run -all

quit -force
