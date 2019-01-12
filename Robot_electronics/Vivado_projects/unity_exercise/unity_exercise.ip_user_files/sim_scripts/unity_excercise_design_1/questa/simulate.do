onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib unity_excercise_design_1_opt

do {wave.do}

view wave
view structure
view signals

do {unity_excercise_design_1.udo}

run -all

quit -force
