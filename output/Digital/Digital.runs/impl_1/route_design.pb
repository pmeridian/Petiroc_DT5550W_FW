
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k160t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k160t2default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?CONFIG_VOLTAGE with Config Bank VCCO: The CONFIG_MODE property of current_design specifies a configuration mode (SPIx4) that uses pins in bank %s.  I/O standards used in this bank have a voltage requirement of 2.50.  However, the CONFIG_VOLTAGE for current_design is set to 1.8.  Ensure that your configuration voltage is compatible with the I/O standards in banks used by your configuration mode.  Refer to device configuration user guide for more information.    Pins used by config mode: B24 (IO_L1P_T0_D00_MOSI_14), A25 (IO_L1N_T0_D01_DIN_14), B22 (IO_L2P_T0_D02_14), A22 (IO_L2N_T0_D03_14), B25 (IO_L3P_T0_DQS_PUDC_B_14), and C23 (IO_L6P_T0_FCS_B_14)%s*DRC2.
 "
142default:default2default:default2(
 DRC|Pin Planning2default:default8ZCFGBVS-7h px? 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
C
.Phase 1 Build RT Design | Checksum: 11d9a1231
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:45 ; elapsed = 00:00:33 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
B
-Phase 2.1 Create Timer | Checksum: 11d9a1231
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:46 ; elapsed = 00:00:34 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 11d9a1231
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:46 ; elapsed = 00:00:34 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 11d9a1231
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:46 ; elapsed = 00:00:34 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 16ab67f5a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:57 ; elapsed = 00:00:41 . Memory (MB): peak = 1587.859 ; gain = 2.1252default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.253 | TNS=-0.433 | WHS=-1.676 | THS=-960.468|
2default:defaultZ35-416h px? 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 2.5.1 Update Timing | Checksum: 17a0777f2
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:02 ; elapsed = 00:00:45 . Memory (MB): peak = 1587.859 ; gain = 2.1252default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.253 | TNS=-0.251 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
P
;Phase 2.5 Update Timing for Bus Skew | Checksum: 1be26ba18
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:03 ; elapsed = 00:00:45 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
I
4Phase 2 Router Initialization | Checksum: 1678a1ff0
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:03 ; elapsed = 00:00:45 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 21ca74aa8
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:09 ; elapsed = 00:00:48 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.261 | TNS=-0.326 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 224d693a4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:29 ; elapsed = 00:01:00 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 224d693a4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:29 ; elapsed = 00:01:00 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 19d51b8bf
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:30 ; elapsed = 00:01:01 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.171 | TNS=-0.171 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
B
-Phase 5.1 Delay CleanUp | Checksum: cf7a5dd1
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:31 ; elapsed = 00:01:01 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
L
7Phase 5.2 Clock Skew Optimization | Checksum: cf7a5dd1
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:31 ; elapsed = 00:01:01 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
N
9Phase 5 Delay and Skew Optimization | Checksum: cf7a5dd1
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:31 ; elapsed = 00:01:01 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 1966af8a7
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:32 ; elapsed = 00:01:02 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.169 | TNS=-0.169 | WHS=-0.406 | THS=-2.028 |
2default:defaultZ35-416h px? 
B
-Phase 6.1 Hold Fix Iter | Checksum: 7e58e203
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:33 ; elapsed = 00:01:02 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 147d1a8fe
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:33 ; elapsed = 00:01:02 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1103ba45a
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:33 ; elapsed = 00:01:03 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1103ba45a
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:34 ; elapsed = 00:01:03 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 18b5118e4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:35 ; elapsed = 00:01:04 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 10.1 Update Timing | Checksum: 1c01a9a37
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:37 ; elapsed = 00:01:05 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=-0.169 | TNS=-0.169 | WHS=0.066  | THS=0.000  |
2default:defaultZ35-57h px? 
B
!Router estimated timing not met.
128*routeZ35-328h px? 
G
2Phase 10 Post Router Timing | Checksum: 1c01a9a37
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:37 ; elapsed = 00:01:05 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:37 ; elapsed = 00:01:05 . Memory (MB): peak = 1598.035 ; gain = 12.3012default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1892default:default2
1662default:default2
42default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:472default:default2
00:01:102default:default2
1598.0352default:default2
12.3012default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:102default:default2
00:00:042default:default2
1598.0352default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2q
]C:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_routed.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:122default:default2
00:00:062default:default2
1598.0352default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
vExecuting : report_drc -file top_Digital_drc_routed.rpt -pb top_Digital_drc_routed.pb -rpx top_Digital_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2}
ireport_drc -file top_Digital_drc_routed.rpt -pb top_Digital_drc_routed.pb -rpx top_Digital_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
aC:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_drc_routed.rptaC:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:152default:default2
00:00:082default:default2
1598.0352default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file top_Digital_methodology_drc_routed.rpt -pb top_Digital_methodology_drc_routed.pb -rpx top_Digital_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file top_Digital_methodology_drc_routed.rpt -pb top_Digital_methodology_drc_routed.pb -rpx top_Digital_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
mC:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_methodology_drc_routed.rptmC:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:202default:default2
00:00:122default:default2
1621.1292default:default2
23.0942default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_power -file top_Digital_power_routed.rpt -pb top_Digital_power_summary_routed.pb -rpx top_Digital_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
yreport_power -file top_Digital_power_routed.rpt -pb top_Digital_power_summary_routed.pb -rpx top_Digital_power_routed.rpx2default:defaultZ4-113h px? 
{
$Power model is not available for %s
23*power24
STARTUPE2_inst	STARTUPE2_inst2default:default8Z33-23h px? 
?
$Power model is not available for %s
23*power2_
DNA_PORT_inst	:USBInterface/Inst_ft600_fifo245_core/SEC_SYS/DNA_PORT_inst2default:default8Z33-23h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
?Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2032default:default2
1672default:default2
42default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:182default:default2
00:00:112default:default2
1674.5592default:default2
53.4302default:defaultZ17-268h px? 
?
%s4*runtcl2w
cExecuting : report_route_status -file top_Digital_route_status.rpt -pb top_Digital_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file top_Digital_timing_summary_routed.rpt -rpx top_Digital_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px? 
?
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px? 
?
%s4*runtcl2h
TExecuting : report_incremental_reuse -file top_Digital_incremental_reuse_routed.rpt
2default:defaulth px? 
x
TNo incremental reuse to report, no incremental placement and routing data was found.278*	vivadotclZ4-545h px? 
?
%s4*runtcl2h
TExecuting : report_clock_utilization -file top_Digital_clock_utilization_routed.rpt
2default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
report_clock_utilization: 2default:default2
00:00:132default:default2
00:00:122default:default2
1676.5162default:default2
0.8952default:defaultZ17-268h px? 


End Record