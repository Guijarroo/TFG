
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:052default:default2
00:00:052default:default2
393.9962default:default2
75.0782default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/utils_1/imports/synth_1/Serial_Communications.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2|
hC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/utils_1/imports/synth_1/Serial_Communications.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
y
Command: %s
53*	vivadotcl2H
4synth_design -top Full_system -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
315802default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2`
JC:/Universidad/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1222.699 ; gain = 409.410
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
Full_system2default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Full_system.vhd2default:default2
522default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Address2default:default2c
OC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Adress.vhd2default:default2
342default:default2
addr2default:default2
Address2default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Full_system.vhd2default:default2
882default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Address2default:default2e
OC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Adress.vhd2default:default2
432default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Address2default:default2
02default:default2
12default:default2e
OC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Adress.vhd2default:default2
432default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Instruction2default:default2h
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Instruction.vhd2default:default2
342default:default2
instr2default:default2
Instruction2default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Full_system.vhd2default:default2
972default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Instruction2default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Instruction.vhd2default:default2
422default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Instruction2default:default2
02default:default2
12default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Instruction.vhd2default:default2
422default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
Serial_Communications2default:default2D
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
362default:default2
coms2default:default2)
Serial_Communications2default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Full_system.vhd2default:default2
1042default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2)
Serial_Communications2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
532default:default8@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2!
sclk_prev_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1142default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	state_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
instruction2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2(
last_instruction_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
address2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2$
last_address_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2#
bit_counter_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	shift_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
	data_down2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
data_up_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
miso2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1432default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2)
Serial_Communications2default:default2
02default:default2
12default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
532default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Full_system2default:default2
02default:default2
12default:default2j
TC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.srcs/sources_1/new/Full_system.vhd2default:default2
522default:default8@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2

fe_reg_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
922default:default8@Z8-6014h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1312.871 ; gain = 499.582
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1312.871 ; gain = 499.582
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1312.871 ; gain = 499.582
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1312.8712default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2H
2C:/Proyecto_TFG/TFG/const/Nexys-A7-100T-Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2H
2C:/Proyecto_TFG/TFG/const/Nexys-A7-100T-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2F
2C:/Proyecto_TFG/TFG/const/Nexys-A7-100T-Master.xdc2default:default21
.Xil/Full_system_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1374.6132default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1374.6132default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2`
JC:/Universidad/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2!
state_reg_reg2default:default2)
Serial_Communications2default:defaultZ8-802h px� 
�
!inferring latch for variable '%s'327*oasys2
cs_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1012default:default8@Z8-327h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                    idle |                                0 |                              000
2default:defaulth p
x
� 
�
%s
*synth2s
_                send_cmd |                                1 |                              001
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
state_reg_reg2default:default2

sequential2default:default2)
Serial_Communications2default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys21
FSM_sequential_state_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
982default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
mosi_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1022default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2$
data_up_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1042default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2)
last_address_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1092default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2-
last_instruction_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1082default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2(
bit_counter_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
992default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2"
shift_next_reg2default:default2F
0C:/Proyecto_TFG/TFG/src/Serial_Comunications.vhd2default:default2
1002default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 5     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[6]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[5]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[4]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[3]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[2]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[1]2default:default2
Full_system2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
data_down[0]2default:default2
Full_system2default:defaultZ8-7129h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[1] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[1] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[6] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[6] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[7] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[7] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[7] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[7] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[7] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[7] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[0] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
~
%enable of latch %s is always disabled264*oasys27
#\coms/last_instruction_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[0] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[1] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[2] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[3] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[4] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
z
%enable of latch %s is always disabled264*oasys23
\coms/last_address_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[0] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[1] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[2] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[3] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[4] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[5] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
u
%enable of latch %s is always disabled264*oasys2.
\coms/data_up_next_reg[6] 2default:defaultZ8-264h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-2642default:default2
1002default:defaultZ17-14h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[7]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[6]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[5]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[4]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[2]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
coms/bit_counter_next_reg[2]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
coms/bit_counter_next_reg[1]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
coms/bit_counter_next_reg[0]2default:default2
Full_system2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[7]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[6]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[5]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[4]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[3]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[2]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[1]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
coms/data_up_next_reg[0]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[5]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[4]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[3]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[2]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[1]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys21
coms/last_address_next_reg[0]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[3]2default:default2
Full_system2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys25
!coms/last_instruction_next_reg[0]2default:default2
Full_system2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:22 ; elapsed = 00:00:24 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
B
%s*synth2*
+------+-----+------+
2default:defaulth px� 
B
%s*synth2*
|      |Cell |Count |
2default:defaulth px� 
B
%s*synth2*
+------+-----+------+
2default:defaulth px� 
B
%s*synth2*
|1     |BUFG |     1|
2default:defaulth px� 
B
%s*synth2*
|2     |LUT1 |     2|
2default:defaulth px� 
B
%s*synth2*
|3     |LUT2 |    10|
2default:defaulth px� 
B
%s*synth2*
|4     |LUT3 |     2|
2default:defaulth px� 
B
%s*synth2*
|5     |LUT4 |     5|
2default:defaulth px� 
B
%s*synth2*
|6     |FDCE |    17|
2default:defaulth px� 
B
%s*synth2*
|7     |FDPE |     1|
2default:defaulth px� 
B
%s*synth2*
|8     |LD   |    11|
2default:defaulth px� 
B
%s*synth2*
|9     |IBUF |     4|
2default:defaulth px� 
B
%s*synth2*
|10    |OBUF |    11|
2default:defaulth px� 
B
%s*synth2*
+------+-----+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
t
%s
*synth2\
HSynthesis finished with 0 errors, 0 critical warnings and 270 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 1374.613 ; gain = 499.582
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.613 ; gain = 561.324
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1374.6132default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
112default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1374.6132default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2[
G  A total of 11 instances were transformed.
  LD => LDCE: 11 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
c00f61402default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
372default:default2
1522default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:322default:default2
00:00:342default:default2
1374.6132default:default2
955.7542default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2b
NC:/Proyecto_TFG/TFG/prj/Proyecto_TFG/Proyecto_TFG.runs/synth_1/Full_system.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
lExecuting : report_utilization -file Full_system_utilization_synth.rpt -pb Full_system_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Mar 13 13:49:04 20252default:defaultZ17-206h px� 


End Record