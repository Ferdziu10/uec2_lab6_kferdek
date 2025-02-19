# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Description:
# Project detiles required for generate_bitstream.tcl
# Make sure that project_name, top_module and target are correct.
# Provide paths to all the files required for synthesis and implementation.
# Depending on the file type, it should be added in the corresponding section.
# If the project does not use files of some type, leave the corresponding section commented out.

#-----------------------------------------------------#
#                   Project details                   #
#-----------------------------------------------------#
# Project name                                  -- EDIT
set project_name uart_project

# Top module name                               -- EDIT
set top_module top_uart_basys3

# FPGA device
set target xc7a35tcpg236-1

#-----------------------------------------------------#
#                    Design sources                   #
#-----------------------------------------------------#
# Specify .xdc files location                   -- EDIT
set xdc_files {
    constraints/basys3.xdc
    constraints/clk_wiz_0.xdc 
}

# Specify SystemVerilog design files location   -- EDIT
set sv_files {
    ../rtl/top_uart.sv
    ../rtl/uart_ctr.sv
    ../rtl/adder.sv
    ../rtl/hex_chg.sv

    rtl/top_uart_basys3.sv
}

# Specify Verilog design files location         -- EDIT
 set verilog_files {
    rtl/clk_wiz_0_clk_wiz.v
    ../rtl/list_ch04_11_mod_m_counter.v
    ../rtl/list_ch04_15_disp_hex_mux.v
    ../rtl/list_ch04_20_fifo.v
    ../rtl/list_ch06_02_debounce.v
    ../rtl/list_ch08_01_uart_rx.v
    ../rtl/list_ch08_02_flag_buf.v
    ../rtl/list_ch08_03_uart_tx.v
    ../rtl/list_ch08_04_uart.v
 }

# Specify VHDL design files location            -- EDIT
#set vhdl_files {


#    path/to/file.vhd
# }

# Specify files for a memory initialization     -- EDIT
#set mem_files {
    
