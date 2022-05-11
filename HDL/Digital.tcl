set outputDir C:/Users/pccmsdaq02/Petiroc/Digital/output/Digital
file mkdir $outputDir
create_project Digital C:/Users/pccmsdaq02/Petiroc/Digital/output/Digital -part XC7K160TFFG676-2 -force
set_property source_mgmt_mode None [current_project]
set_property target_language VHDL [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/clk_wiz_0.xcix
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/clk_wiz_0.xcix
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/DTClockGenerator.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/fast_clock.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/fifo_generator_0.xcix
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/fifo_generator_0.xcix
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/FlashPageMemory.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/FTDI_FIFOs.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/FTDI_FIFO_AW.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/TestBram.xci
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/subpage_Timer64.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/subpage_ToT_And_TS.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/top_Digital.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ADC1.v
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adcs_top.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adcs_top.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ADC_FRAME_S.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ADC_FRAME_S.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adc_interface.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adc_interface.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adc_sync.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/adc_sync.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/chronoenable.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/chronoenable.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/chronostartstop.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/chronostartstop.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/counter_rising.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/counter_rising.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/delay_fix.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/delay_fix.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/d_latch.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/d_latch.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/edge_neg.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/edge_neg.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/edge_pos.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/edge_pos.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ff_sr.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ff_sr.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/FlashController.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/FlashController.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/flash_prog.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/flash_prog.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ft600_fifo245_core.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ft600_fifo245_core.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ft600_fifo245_wrapper.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/ft600_fifo245_wrapper.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/i2cmaster.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/i2cmaster.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/init_clock_gen.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/init_clock_gen.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/MCRateMeter.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/MCRateMeter.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PetirocAnalogReadout.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PetirocAnalogReadout.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PetirocSlowControl.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PetirocSlowControl.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PULSE_GENERATOR.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/PULSE_GENERATOR.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/security.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/security.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi32bit_master_write.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi32bit_master_write.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi93lc56_16bit.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi93lc56_16bit.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi_timing_module.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/spi_timing_module.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/TimestampGenerator.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/TimestampGenerator.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/U86_custompacket.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/U86_custompacket.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/xlx_soft_gd.vhd
add_files -force C:/Users/pccmsdaq02/Petiroc/Digital/HDL/pcores/xlx_soft_gd.vhd
add_files -force -fileset constrs_1 C:/Users/pccmsdaq02/Petiroc/Digital/HDL/dt555w_constraints.xdc
import_files -force -norecurse
import_files -fileset constrs_1 -force -norecurse C:/Users/pccmsdaq02/Petiroc/Digital/HDL/dt555w_constraints.xdc
foreach ip [get_ips] {
upgrade_ip [get_ips $ip]
set ip_filename [get_property IP_FILE $ip]
set ip_dcp [file rootname $ip_filename]
append ip_dcp ".dcp"
set ip_xml [file rootname $ip_filename]
append ip_xml ".xml"
if {([file exists $ip_dcp] == 0) || [expr {[file mtime $ip_filename ] > [file mtime $ip_dcp ]}]} {
reset_target all $ip
file delete $ip_xml
generate_target all $ip
synth_ip $ip
}
}
update_ip_catalog -rebuild
set_property Top top_Digital [current_fileset]
set obj [get_runs impl_1]
set obj_s [get_runs synth_1]
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
if {[catch {
launch_runs synth_1 -jobs 32
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 32
wait_on_run impl_1
} errorstring]} {
Error "ABBA: $errorstring "
exit
}
exit
