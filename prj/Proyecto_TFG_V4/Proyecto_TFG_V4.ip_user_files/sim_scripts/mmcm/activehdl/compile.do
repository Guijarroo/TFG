vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic" \
"C:/Universidad/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Universidad/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm_clk_wiz.v" \
"../../../../Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm.v" \

vlog -work xil_defaultlib \
"glbl.v"

