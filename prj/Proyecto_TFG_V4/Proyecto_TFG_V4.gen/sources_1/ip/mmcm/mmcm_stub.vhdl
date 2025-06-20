-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Wed Jun 18 15:39:51 2025
-- Host        : DESKTOP-VKHET3S running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Proyecto_TFG/TFG/prj/Proyecto_TFG_V4/Proyecto_TFG_V4.gen/sources_1/ip/mmcm/mmcm_stub.vhdl
-- Design      : mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mmcm is
  Port ( 
    clkout : out STD_LOGIC;
    resetn : in STD_LOGIC;
    clkin : in STD_LOGIC
  );

end mmcm;

architecture stub of mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkout,resetn,clkin";
begin
end;
