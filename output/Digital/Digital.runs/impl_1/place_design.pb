
?
?No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px? 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
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
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?CONFIG_VOLTAGE with Config Bank VCCO: The CONFIG_MODE property of current_design specifies a configuration mode (SPIx4) that uses pins in bank %s.  I/O standards used in this bank have a voltage requirement of 2.50.  However, the CONFIG_VOLTAGE for current_design is set to 1.8.  Ensure that your configuration voltage is compatible with the I/O standards in banks used by your configuration mode.  Refer to device configuration user guide for more information.    Pins used by config mode: B24 (IO_L1P_T0_D00_MOSI_14), A25 (IO_L1N_T0_D01_DIN_14), B22 (IO_L2P_T0_D02_14), A22 (IO_L2N_T0_D03_14), B25 (IO_L3P_T0_DQS_PUDC_B_14), and C23 (IO_L6P_T0_FCS_B_14)%s*DRC2.
 "
142default:default2default:default2(
 DRC|Pin Planning2default:default8ZCFGBVS-7h px? 
?
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
YReport rule limit reached: REQP-1840 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram	?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[0]?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[0]2default:default2default:default2?
 "?
vFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]sFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram	?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[1]?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[1]2default:default2default:default2?
 "?
vFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]sFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram	?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[2]?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[2]2default:default2default:default2?
 "?
vFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]sFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram	?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[3]?FC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/WEA[3]2default:default2default:default2?
 "?
vFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]sFC/PAGEMEM/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram	?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[0]?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[0]2default:default2default:default2?
 "?
oTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]lTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram	?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[1]?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[1]2default:default2default:default2?
 "?
oTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]lTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram	?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[2]?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[2]2default:default2default:default2?
 "?
oTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]lTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram	?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram2default:default2default:default2?
 "?
?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[3]?TBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram/WEA[3]2default:default2default:default2?
 "?
oTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea[0]lTBR/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/wea2default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENARDEN?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENARDEN2default:default2default:default2?
 "?
`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena2default:default2default:default2L
 "6
U79/FIFO_WE_reg	U79/FIFO_WE_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENBWREN?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENBWREN2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_i_1_n_0?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_i_1_n_02default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i_reg	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENBWREN?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ENBWREN2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_i_1_n_0?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_i_1_n_02default:default2default:default2?
 "?
|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg	|USBInterface/DATA_READ_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.gpf.wrpf/gpf1.prog_full_i_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[0]?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[0]2default:default2default:default2?
 "?
`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena2default:default2default:default2L
 "6
U79/FIFO_WE_reg	U79/FIFO_WE_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[1]?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[1]2default:default2default:default2?
 "?
`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena2default:default2default:default2L
 "6
U79/FIFO_WE_reg	U79/FIFO_WE_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[2]?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[2]2default:default2default:default2?
 "?
`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena2default:default2default:default2L
 "6
U79/FIFO_WE_reg	U79/FIFO_WE_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	}U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[3]?U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/WEA[3]2default:default2default:default2?
 "?
`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena`U79/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/ena2default:default2default:default2L
 "6
U79/FIFO_WE_reg	U79/FIFO_WE_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram	?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[10]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[10]2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[4]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[4]2default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[4]	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram	?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[11]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[11]2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[5]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[5]2default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[5]	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram	?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[7]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[7]2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[1]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[1]2default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[1]	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram	?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[8]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[8]2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[2]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[2]2default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[2]	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?
?RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram	?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[9]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.WIDE_PRIM36_NO_ECC.ram/ADDRARDADDR[9]2default:default2default:default2?
 "?
?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[3]?USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.mem/gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/Q[3]2default:default2default:default2?
 "?
qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[3]	qUSBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/gc0.count_d1_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[10]`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[10]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[6]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[6]2default:default2default:default2H
 "2
U33/WP_reg[6]	U33/WP_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[11]`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[11]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[7]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[7]2default:default2default:default2H
 "2
U33/WP_reg[7]	U33/WP_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[12]`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[12]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[8]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[8]2default:default2default:default2H
 "2
U33/WP_reg[8]	U33/WP_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[13]`U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[13]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[9]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[9]2default:default2default:default2H
 "2
U33/WP_reg[9]	U33/WP_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[4]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[4]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[0]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[0]2default:default2default:default2H
 "2
U33/WP_reg[0]	U33/WP_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[5]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[5]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[1]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[1]2default:default2default:default2H
 "2
U33/WP_reg[1]	U33/WP_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[6]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[6]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[2]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[2]2default:default2default:default2H
 "2
U33/WP_reg[2]	U33/WP_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[7]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[7]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[3]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[3]2default:default2default:default2H
 "2
U33/WP_reg[3]	U33/WP_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[8]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[8]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[4]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[4]2default:default2default:default2H
 "2
U33/WP_reg[4]	U33/WP_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[9]_U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[9]2default:default2default:default2?
 "?
8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[5]8U33/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[5]2default:default2default:default2H
 "2
U33/WP_reg[5]	U33/WP_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[10]`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[10]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[6]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[6]2default:default2default:default2H
 "2
U34/WP_reg[6]	U34/WP_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[11]`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[11]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[7]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[7]2default:default2default:default2H
 "2
U34/WP_reg[7]	U34/WP_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[12]`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[12]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[8]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[8]2default:default2default:default2H
 "2
U34/WP_reg[8]	U34/WP_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[13]`U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[13]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[9]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[9]2default:default2default:default2H
 "2
U34/WP_reg[9]	U34/WP_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[4]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[4]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[0]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[0]2default:default2default:default2H
 "2
U34/WP_reg[0]	U34/WP_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[5]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[5]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[1]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[1]2default:default2default:default2H
 "2
U34/WP_reg[1]	U34/WP_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[6]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[6]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[2]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[2]2default:default2default:default2H
 "2
U34/WP_reg[2]	U34/WP_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[7]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[7]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[3]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[3]2default:default2default:default2H
 "2
U34/WP_reg[3]	U34/WP_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[8]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[8]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[4]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[4]2default:default2default:default2H
 "2
U34/WP_reg[4]	U34/WP_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?

?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	PU34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2?
 "?
_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[9]_U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg/ADDRARDADDR[9]2default:default2default:default2?
 "?
8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[5]8U34/xpm_memory_sdpram_inst/xpm_memory_base_inst/addra[5]2default:default2default:default2H
 "2
U34/WP_reg[5]	U34/WP_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
yIO port buffering is incomplete: Device port %s expects both input and output buffering but the buffers are incomplete.%s*DRC2<
 "&
iic_scliic_scl2default:default2default:default2A
 )DRC|Netlist|Port|Required Buf|IO Instance2default:default8ZRPBF-3h px? 
c
DRC finished with %s
79*	vivadotcl2)
0 Errors, 44 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0332default:default2
1585.7342default:default2
0.0002default:defaultZ17-268h px? 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 13b8deebc
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.044 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0292default:default2
1585.7342default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2+
xpm_cdc_single_inst_i_12default:default2
352default:default2?
?	USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i_reg {FDPE}
	USBInterface/ADDRESS_FIFO/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_fb_i_reg {FDPE}
	adcs/adc_interface1/ADC_OUTFIFO1/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst/src_gray_ff_reg[3] {FDRE}
	adcs/adc_interface1/ADC_OUTFIFO1/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst/src_gray_ff_reg[5] {FDRE}
	adcs/adc_interface1/ADC_OUTFIFO1/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst/src_gray_ff_reg[9] {FDRE}
2default:defaultZ30-568h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 19e8b75e1
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:22 ; elapsed = 00:00:15 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 26a4c5b20
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:29 ; elapsed = 00:00:20 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 26a4c5b20
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:29 ; elapsed = 00:00:20 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 26a4c5b20
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:29 ; elapsed = 00:00:20 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
D
/Phase 2 Global Placement | Checksum: 13bd0c47b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:38 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 13bd0c47b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:04 ; elapsed = 00:00:38 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1f7f63180
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:08 ; elapsed = 00:00:41 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 1dbb563f7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:08 ; elapsed = 00:00:41 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 14ae6853b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:08 ; elapsed = 00:00:41 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px? 
K
6Phase 3.5 Timing Path Optimizer | Checksum: 14ae6853b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:08 ; elapsed = 00:00:41 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.6 Fast Optimization | Checksum: 200e8be89
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:09 ; elapsed = 00:00:41 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.7 Small Shape Detail Placement | Checksum: 14a77c325
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:16 ; elapsed = 00:00:49 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.8 Re-assign LUT pins | Checksum: 15fac8a01
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:17 ; elapsed = 00:00:50 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.9 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.9 Pipeline Register Optimization | Checksum: 15fac8a01
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:17 ; elapsed = 00:00:50 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.10 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
H
3Phase 3.10 Fast Optimization | Checksum: 250e03c1a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:20 ; elapsed = 00:00:52 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 250e03c1a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:21 ; elapsed = 00:00:52 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 193bb01cd
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
22default:defaultZ32-721h px? 
?
?BUFG insertion identified %s candidate nets, %s success, %s skipped for placement/routing, %s skipped for timing, %s skipped for netlist change reason.30*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-31h px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 193bb01cd
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:28 ; elapsed = 00:00:57 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-0.2702default:defaultZ30-746h px? 
R
=Phase 4.1.1 Post Placement Optimization | Checksum: 9a39aa1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:12 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
M
8Phase 4.1 Post Commit Optimization | Checksum: 9a39aa1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:12 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
K
6Phase 4.2 Post Placement Cleanup | Checksum: 9a39aa1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:13 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
E
0Phase 4.3 Placer Reporting | Checksum: 9a39aa1d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:13 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.4 Final Placement Cleanup | Checksum: ba0c7f65
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:01:13 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
[
FPhase 4 Post Placement Optimization and Clean-Up | Checksum: ba0c7f65
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:47 ; elapsed = 00:01:13 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
=
(Ending Placer Task | Checksum: 9bf8b46f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:47 ; elapsed = 00:01:13 . Memory (MB): peak = 1585.734 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1722default:default2
1642default:default2
42default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:01:542default:default2
00:01:182default:default2
1585.7342default:default2
0.0002default:defaultZ17-268h px? 
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
00:00:072default:default2
00:00:032default:default2
1585.7342default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2q
]C:/Users/pccmsdaq02/Petiroc/Digital/output/Digital/Digital.runs/impl_1/top_Digital_placed.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:112default:default2
00:00:062default:default2
1585.7342default:default2
0.0002default:defaultZ17-268h px? 
f
%s4*runtcl2J
6Executing : report_io -file top_Digital_io_placed.rpt
2default:defaulth px? 
?
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.341 . Memory (MB): peak = 1585.734 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2?
nExecuting : report_utilization -file top_Digital_utilization_placed.rpt -pb top_Digital_utilization_placed.pb
2default:defaulth px? 
?
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.414 . Memory (MB): peak = 1585.734 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2g
SExecuting : report_control_sets -verbose -file top_Digital_control_sets_placed.rpt
2default:defaulth px? 
?
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.079 . Memory (MB): peak = 1585.734 ; gain = 0.000
*commonh px? 


End Record