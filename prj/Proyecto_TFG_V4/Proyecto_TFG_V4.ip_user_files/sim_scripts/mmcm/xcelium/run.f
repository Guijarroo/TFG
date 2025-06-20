-makelib xcelium_lib/xpm -sv \
  "C:/Universidad/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Universidad/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm_clk_wiz.v" \
  "../../../../Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

