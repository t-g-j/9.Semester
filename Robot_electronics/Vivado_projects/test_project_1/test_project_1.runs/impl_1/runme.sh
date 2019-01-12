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

HD_PWD='/home/tj/Documents/Xilinx/Projects/test_project_1/test_project_1.runs/impl_1'
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

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log delete_blk_design_1_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source delete_blk_design_1_wrapper.tcl -notrace


