
c
Command: %s
53*	vivadotcl22
write_bitstream -force top.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px� 
�
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px� 
�
YReport rule limit reached: REQP-1840 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2�
 "l
*soc_inst/cpu_inst/FSM_sequential_sr_reg[1]	*soc_inst/cpu_inst/FSM_sequential_sr_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2x
 "b
%soc_inst/cpu_inst/instr_reg[iimm][10]	%soc_inst/cpu_inst/instr_reg[iimm][10]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][1]	$soc_inst/cpu_inst/instr_reg[iimm][1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2x
 "b
%soc_inst/cpu_inst/instr_reg[iimm][30]	%soc_inst/cpu_inst/instr_reg[iimm][30]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][4]	$soc_inst/cpu_inst/instr_reg[iimm][4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][5]	$soc_inst/cpu_inst/instr_reg[iimm][5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][6]	$soc_inst/cpu_inst/instr_reg[iimm][6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][7]	$soc_inst/cpu_inst/instr_reg[iimm][7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][8]	$soc_inst/cpu_inst/instr_reg[iimm][8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][9]	$soc_inst/cpu_inst/instr_reg[iimm][9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][0]	$soc_inst/cpu_inst/instr_reg[inst][0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][1]	$soc_inst/cpu_inst/instr_reg[inst][1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][2]	$soc_inst/cpu_inst/instr_reg[inst][2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][3]	$soc_inst/cpu_inst/instr_reg[inst][3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][0]	$soc_inst/cpu_inst/instr_reg[simm][0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][1]	$soc_inst/cpu_inst/instr_reg[simm][1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][2]	$soc_inst/cpu_inst/instr_reg[simm][2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][3]	$soc_inst/cpu_inst/instr_reg[simm][3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][4]	$soc_inst/cpu_inst/instr_reg[simm][4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2d
 "N
soc_inst/mem_inst/mem_reg_0	soc_inst/mem_inst/mem_reg_02default:default2default:default2�
 "n
+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]+soc_inst/mem_inst/mem_reg_0/ADDRARDADDR[14]2default:default2default:default2p
 "Z
!soc_inst/mem_inst/mem_reg_3_0[11]!soc_inst/mem_inst/mem_reg_3_0[11]2default:default2default:default2h
 "R
soc_inst/cpu_inst/pcr_reg[13]	soc_inst/cpu_inst/pcr_reg[13]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2x
 "b
%soc_inst/cpu_inst/instr_reg[iimm][30]	%soc_inst/cpu_inst/instr_reg[iimm][30]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][4]	$soc_inst/cpu_inst/instr_reg[iimm][4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][5]	$soc_inst/cpu_inst/instr_reg[iimm][5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][6]	$soc_inst/cpu_inst/instr_reg[iimm][6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][7]	$soc_inst/cpu_inst/instr_reg[iimm][7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][8]	$soc_inst/cpu_inst/instr_reg[iimm][8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[iimm][9]	$soc_inst/cpu_inst/instr_reg[iimm][9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][0]	$soc_inst/cpu_inst/instr_reg[inst][0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][1]	$soc_inst/cpu_inst/instr_reg[inst][1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][2]	$soc_inst/cpu_inst/instr_reg[inst][2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[inst][3]	$soc_inst/cpu_inst/instr_reg[inst][3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2t
 "^
#soc_inst/cpu_inst/instr_reg[rs2][4]	#soc_inst/cpu_inst/instr_reg[rs2][4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][0]	$soc_inst/cpu_inst/instr_reg[simm][0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][1]	$soc_inst/cpu_inst/instr_reg[simm][1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][2]	$soc_inst/cpu_inst/instr_reg[simm][2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][3]	$soc_inst/cpu_inst/instr_reg[simm][3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2v
 "`
$soc_inst/cpu_inst/instr_reg[simm][4]	$soc_inst/cpu_inst/instr_reg[simm][4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2h
 "R
soc_inst/cpu_inst/pcr_reg[11]	soc_inst/cpu_inst/pcr_reg[11]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2h
 "R
soc_inst/cpu_inst/pcr_reg[14]	soc_inst/cpu_inst/pcr_reg[14]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2f
 "P
soc_inst/cpu_inst/regf_reg_1	soc_inst/cpu_inst/regf_reg_12default:default2default:default2�
 "n
+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]+soc_inst/cpu_inst/regf_reg_1/ADDRARDADDR[9]2default:default2default:default2l
 "V
soc_inst/cpu_inst/instn[rs2][4]soc_inst/cpu_inst/instn[rs2][4]2default:default2default:default2h
 "R
soc_inst/cpu_inst/pcr_reg[16]	soc_inst/cpu_inst/pcr_reg[16]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 43 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
Z
Writing bitstream %s...
11*	bitstream2
	./top.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
122default:default2
432default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:142default:default2
00:00:132default:default2
2534.0782default:default2
462.1642default:defaultZ17-268h px� 


End Record