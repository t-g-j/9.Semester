onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clk_divider_design -L xil_defaultlib -L secureip -O5 xil_defaultlib.clk_divider_design

do {wave.do}

view wave
view structure

do {clk_divider_design.udo}

run -all

endsim

quit -force
