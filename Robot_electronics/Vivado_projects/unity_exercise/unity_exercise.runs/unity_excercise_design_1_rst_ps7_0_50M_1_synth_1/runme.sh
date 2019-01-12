#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/tj/Documents/Xilinx/SDK/2018.2/bin:/home/tj/Documents/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/lin64:/home/tj/Documents/Xilinx/Vivado/2018.2/bin
else
  PATH=/home/tj/Documents/Xilinx/SDK/2018.2/bin:/home/tj/Documents/Xilinx/Vivado/2018.2/ids_lite/ISE/bin/lin64:/home/tj/Documents/Xilinx/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/tj/Documents/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/tj/Documents/Xilinx/Vivado/2018.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/tj/Documents/Xilinx/Projects/unity_exercise/unity_exercise.runs/unity_excercise_design_1_rst_ps7_0_50M_1_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log unity_excercise_design_1_rst_ps7_0_50M_1.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source unity_excercise_design_1_rst_ps7_0_50M_1.tcl
