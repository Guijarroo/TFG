set_property SRC_FILE_INFO {cfile:c:/Proyecto_TFG/TFG/prj/Proyecto_TFG_V4/Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm.xdc rfile:../../../Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clkin]] 0.100
