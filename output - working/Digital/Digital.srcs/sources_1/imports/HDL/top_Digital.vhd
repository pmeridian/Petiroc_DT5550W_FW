----------------------------------------------------------------------------------
-- Company: 	Nuclear Instruments SRL
-- Engineer: 	Andrea Abba
-- 
-- Create Date: 05.05.2017 17:29:18
-- Design Name: Petiroc Readout System for DT5550W
-- Module Name: TOP_Digital
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
-- http://www.nuclearinstruments.eu
-- Nuclear Instruments SRL, via lecco 16, Lambrugo (CO), ITALY
-- info@nuclearinstruments.eu
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;
use ieee.math_real.all;
library UNISIM;
use UNISIM.VComponents.all;

Library xpm;
use xpm.vcomponents.all;
    
entity TOP_Digital is
    Port (  
		    
			  
			--security eeprom			  
			EEMOSI : out STD_LOGIC;
			EEMISO : in STD_LOGIC;
			EECLK : out STD_LOGIC;
			EECS : out STD_LOGIC;	

			--CDCE clock generator
			CK_SPI_LE : out  STD_LOGIC;
			CK_SPI_CLK : out  STD_LOGIC;
			CK_SPI_MOSI : out  STD_LOGIC;
			CK_SPI_NSYNC : out  STD_LOGIC;

			--FLASH Direct Access
			FLASH_SPI_CS : out std_logic;
			FLASH_SPI_DIN : in std_logic;
			FLASH_SPI_DOUT : out std_logic;	
			
			--AUX CLOCK OUT
			CLK_AUX_OUT_25 : out std_logic;	

			--LEMO IO
			LEMO0 : inout STD_LOGIC;
			LEMO1 : inout STD_LOGIC;
			LEMO2 : inout STD_LOGIC;
			LEMO3 : inout STD_LOGIC;
					 
			LEMO4 : inout STD_LOGIC;
			LEMO5 : inout STD_LOGIC;
			LEMO6 : inout STD_LOGIC;
			LEMO7 : inout STD_LOGIC;

			LEMO01_dir : out STD_LOGIC;
			LEMO23_dir : out STD_LOGIC;
			LEMO45_dir : out STD_LOGIC;
			LEMO67_dir : out STD_LOGIC;		
			
			--FTDI INTERFACE
			FTDI_CLK : in  STD_LOGIC;
			FTDI_ADBUS : inout  STD_LOGIC_VECTOR (31 downto 0);
			FTDI_BE : inout  STD_LOGIC_VECTOR (3 downto 0);
			FTDI_RXFN : in  STD_LOGIC;
			FTDI_TXEN : in  STD_LOGIC;
			FTDI_TXN : out  STD_LOGIC;
			FTDI_SIWU : out  STD_LOGIC;
			FTDI_RDN : out  STD_LOGIC;
			FTDI_OEN : out  STD_LOGIC;

			--petiroc A slow control
			PETIROC_A_CLK : out STD_LOGIC;
			PETIROC_A_MOSI : out STD_LOGIC;
			PETIROC_A_SLOAD : out STD_LOGIC;
			PETIROC_A_RESETB : out STD_LOGIC;
			PETIROC_A_SELECT : out STD_LOGIC;           

			--petiroc B slow control
			PETIROC_B_CLK : out STD_LOGIC;
			PETIROC_B_MOSI : out STD_LOGIC;
			PETIROC_B_SLOAD : out STD_LOGIC;
			PETIROC_B_RESETB : out STD_LOGIC;
			PETIROC_B_SELECT : out STD_LOGIC;           

			--petiroc C slow control
			PETIROC_C_CLK : out STD_LOGIC;
			PETIROC_C_MOSI : out STD_LOGIC;
			PETIROC_C_SLOAD : out STD_LOGIC;
			PETIROC_C_RESETB : out STD_LOGIC;
			PETIROC_C_SELECT : out STD_LOGIC;           

			--petiroc D slow control
			PETIROC_D_CLK : out STD_LOGIC;
			PETIROC_D_MOSI : out STD_LOGIC;
			PETIROC_D_SLOAD : out STD_LOGIC;
			PETIROC_D_RESETB : out STD_LOGIC;
			PETIROC_D_SELECT : out STD_LOGIC   ;

			--PETIROC EVENT VALIDATION
			A_VAL_EVT_P : out STD_LOGIC;
			A_VAL_EVT_N : out STD_LOGIC;
			B_VAL_EVT_P : out STD_LOGIC;
			B_VAL_EVT_N : out STD_LOGIC;
			C_VAL_EVT_P : out STD_LOGIC;
			C_VAL_EVT_N : out STD_LOGIC;
			D_VAL_EVT_P : out STD_LOGIC;
			D_VAL_EVT_N : out STD_LOGIC;

			--PETIROC LATCH RESET
			A_RAZ_CHN_P : out STD_LOGIC;
			A_RAZ_CHN_N : out STD_LOGIC;
			B_RAZ_CHN_P : out STD_LOGIC;
			B_RAZ_CHN_N : out STD_LOGIC;
			C_RAZ_CHN_P : out STD_LOGIC;
			C_RAZ_CHN_N : out STD_LOGIC;
			D_RAZ_CHN_P : out STD_LOGIC;
			D_RAZ_CHN_N : out STD_LOGIC;

			--PETIROC EXTERNAL TEST TRIGGER 
			A_TRIG_EXT : out STD_LOGIC;
			C_TRIG_EXT : out STD_LOGIC;
			B_TRIG_EXT : out STD_LOGIC;
			D_TRIG_EXT : out STD_LOGIC;

			--PETIROC RSTB
			PETIROC_A_RSTB : out STD_LOGIC;
			PETIROC_B_RSTB : out STD_LOGIC;
			PETIROC_C_RSTB : out STD_LOGIC;
			PETIROC_D_RSTB : out STD_LOGIC;

			--PETIROC START OF CONVERSION
			A_START_CONV : out STD_LOGIC;
			B_START_CONV : out STD_LOGIC;
			C_START_CONV : out STD_LOGIC;
			D_START_CONV : out STD_LOGIC;        

			--PETIROC EXTERNAL HOLD
			A_HOLD_EXT : out STD_LOGIC;
			B_HOLD_EXT : out STD_LOGIC;
			C_HOLD_EXT : out STD_LOGIC;
			D_HOLD_EXT : out STD_LOGIC;        

			--PETIROC EXTERNAL ADC START
			A_STARTB_ADC_EXT : out STD_LOGIC;
			B_STARTB_ADC_EXT : out STD_LOGIC;
			C_STARTB_ADC_EXT : out STD_LOGIC;
			D_STARTB_ADC_EXT : out STD_LOGIC;

			--PETIROC TRANSMIT_ON
			A_TRASMIT_ON : in STD_LOGIC;
			B_TRASMIT_ON : in STD_LOGIC;
			C_TRASMIT_ON : in STD_LOGIC;
			D_TRASMIT_ON : in STD_LOGIC;

			--PETIROC DATA IN
			A_LVDS_DOUT_P : in STD_LOGIC;
			A_LVDS_DOUT_N : in STD_LOGIC;      
			B_LVDS_DOUT_P : in STD_LOGIC;
			B_LVDS_DOUT_N : in STD_LOGIC;                           
			C_LVDS_DOUT_P : in STD_LOGIC;
			C_LVDS_DOUT_N : in STD_LOGIC;                    
			D_LVDS_DOUT_P : in STD_LOGIC;
			D_LVDS_DOUT_N : in STD_LOGIC;

			--160 MHz CLOCK
			D_LVDS_DCLK_P :  in STD_LOGIC;
			D_LVDS_DCLK_N :  in STD_LOGIC;

			--40 MHz CLOCK
			CLK_40_P : in STD_LOGIC;
			CLK_40_N : in STD_LOGIC;

			--PETIROC TRIGGER OUT
			A_TRG : in STD_LOGIC_VECTOR(31 downto 0);          
			B_TRG : in STD_LOGIC_VECTOR(31 downto 0);
			C_TRG : in STD_LOGIC_VECTOR(31 downto 0);          
			D_TRG : in STD_LOGIC_VECTOR(31 downto 0);

			--PETIROC SR_IN
			A_ANALOG_DIN : out STD_LOGIC;
			B_ANALOG_DIN : out STD_LOGIC;
			C_ANALOG_DIN : out STD_LOGIC;
			D_ANALOG_DIN : out STD_LOGIC;

			--PETIROC SR_CLK
			A_ANALOG_CLK : out STD_LOGIC;
			B_ANALOG_CLK : out STD_LOGIC;
			C_ANALOG_CLK : out STD_LOGIC;
			D_ANALOG_CLK : out STD_LOGIC;

			--PETIROC OR32_CHARGE
			OR_CHARGE_A : in STD_LOGIC;
			OR_CHARGE_B : in STD_LOGIC;
			OR_CHARGE_C : in STD_LOGIC;
			OR_CHARGE_D : in STD_LOGIC;

			-- --PETIROC OR32_TIME
			-- OR_TIME_A : in STD_LOGIC;
			-- OR_TIME_B : in STD_LOGIC;
			-- OR_TIME_C : in STD_LOGIC;
			-- OR_TIME_D : in STD_LOGIC;
			
			--PETIROC DIGITAL PROBE
			dig_probe_a : in STD_LOGIC;
			dig_probe_b : in STD_LOGIC;
			dig_probe_c : in STD_LOGIC;
			dig_probe_d : in STD_LOGIC;   

			--PETIROC TRIGB_MUX
			trigb_mux_a : in STD_LOGIC;
			trigb_mux_b : in STD_LOGIC;
			trigb_mux_c : in STD_LOGIC;
			trigb_mux_d : in STD_LOGIC;   


			--ANALOG INTERFACE
			SMADC_1_RESET : out STD_LOGIC;
			ADC_1_CLK_A_P : in STD_LOGIC;
			ADC_1_CLK_A_N : in STD_LOGIC;
			ADC_1_FRAME_A_P : in STD_LOGIC;
			ADC_1_FRAME_A_N : in STD_LOGIC;
			ADC_1_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
			ADC_1_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
			ADC_1_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
			ADC_1_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
			SMADC_1_CSA : out std_logic;
			SMADC_1_CLK : out std_logic;
			SMADC_1_MOSI : out std_logic;
			SMADC_1_PD : out std_logic;

			--i2c
			iic_scl : inout std_logic;
			iic_sda : inout std_logic;
			--SERVICE CLOCK
			clk_100 : std_logic
                              
			  ); 
end TOP_Digital;

architecture Behavioral of TOP_Digital is
	attribute keep : string;     
    
    component ft600_fifo245_wrapper is
    Port ( 
	
          --EEPROM SICUREZZE
          EEMOSI : out STD_LOGIC;
          EEMISO : in STD_LOGIC;
          EECLK : out STD_LOGIC;
          EECS : out STD_LOGIC;
          license_ok : out std_logic;
		  
          FTDI_ADBUS : inout STD_LOGIC_VECTOR (31 downto 0);
          FTDI_BE     : inout STD_LOGIC_VECTOR (3 downto 0);
          FTDI_RXFN : in STD_LOGIC;            --EMPTY
          FTDI_TXEN : in STD_LOGIC;         --FULL
          FTDI_RDN    : out STD_LOGIC;        --READ ENABLE
          FTDI_TXN    : out STD_LOGIC;        --WRITE ENABLE
          FTDI_CLK    : in STD_LOGIC;            --FTDI CLOCK
          FTDI_OEN    : out STD_LOGIC;        --OUTPUT ENABLE NEGATO LATO FTDI
          FTDI_SIWU : out STD_LOGIC;        --COMMIT A PACKET IMMEDIATLY
    
          
			-- Register interface          
					REG_c_tot_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_c_tot_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_c_tot_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_c_tot_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_run_time_lsb_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_run_time_lsb_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_run_time_lsb_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_run_time_lsb_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_run_time_msb_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_run_time_msb_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_run_time_msb_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_run_time_msb_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_run_start_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_run_start_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_run_start_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_run_start_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_sw_trig_freq_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_sw_trig_freq_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_sw_trig_freq_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_sw_trig_freq_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_tr_sel_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_tr_sel_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_tr_sel_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_tr_sel_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_e16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_e16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_e16_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_e16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_evt_ts_msb_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_evt_ts_msb_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_evt_ts_msb_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_evt_ts_msb_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_evt_ts_lsb_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_evt_ts_lsb_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_evt_ts_lsb_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_evt_ts_lsb_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_e15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_e15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_e15_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_e15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_tr_en_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_tr_en_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_tr_en_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_tr_en_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_fw_ver_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_fw_ver_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_fw_ver_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_fw_ver_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_PetirocCfg0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_PetirocCfg0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_PetirocCfg0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_PetirocCfg0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_PetirocCfg0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_PetirocCfg0_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_PetirocCfg0_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_dv_tot_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_dv_tot_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_dv_tot_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_dv_tot_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CP_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CP_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_READ_VALID_WORDS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_READ_VALID_WORDS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_i2chv_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_i2chv_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_i2chv_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_i2chv_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_i2chv_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_i2chv_CTRL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_i2chv_CTRL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_i2chv_MON_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_i2chv_MON_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_UNIQUE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_UNIQUE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
	

			REG_Fiforeset_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_Fiforeset_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_Fiforeset_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_Fiforeset_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 


			--FLASH CONTROLLER   
			BUS_Flash_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0);
			BUS_Flash_0_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
			BUS_Flash_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
			BUS_Flash_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Flash_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Flash_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 

			REG_FLASH_CNTR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_FLASH_CNTR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_FLASH_CNTR_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_FLASH_CNTR_WR : OUT STD_LOGIC_VECTOR(0 downto 0);               

			REG_FLASH_ADDRESS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_FLASH_ADDRESS_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_FLASH_ADDRESS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_FLASH_ADDRESS_WR : OUT STD_LOGIC_VECTOR(0 downto 0);     


			--test
			BUS_Test_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0);
			BUS_Test_0_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
			BUS_Test_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
			BUS_Test_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Test_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Test_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0);   			


			REG_FIRMWARE_BUILD : IN STD_LOGIC_VECTOR(31 downto 0);

			--LATO FPGA
			f_CLK : IN STD_LOGIC;
			f_RESET : IN STD_LOGIC
                        
                  
    );
    
    end component;
    
    
    component adcs_top is
       Generic (test_mode :  STD_LOGIC := '0');
       Port (  
             Reset : in std_logic;
             sCLK_100 : in std_logic;
             
             SMADC_1_RESET : out STD_LOGIC;
             
             ADC_1_CLK_A_P : in STD_LOGIC;
             ADC_1_CLK_A_N : in STD_LOGIC;
             
             ADC_1_FRAME_A_P : in STD_LOGIC;
             ADC_1_FRAME_A_N : in STD_LOGIC;
             
             ADC_1_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
             ADC_1_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
             
             ADC_1_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
             ADC_1_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
             
             SMADC_1_CSA : out std_logic;
             SMADC_1_CSB : out std_logic;
             SMADC_1_CLK : out std_logic;
             SMADC_1_MOSI : out std_logic;
             
             READOUT_CLK : in STD_LOGIC;
             ADC_CLK_OUT : out STD_LOGIC;
             
             CH0 : out std_logic_vector (15 downto 0);
             CH1 : out std_logic_vector (15 downto 0);
             CH2 : out std_logic_vector (15 downto 0);
             CH3 : out std_logic_vector (15 downto 0);                                            
             CH4 : out std_logic_vector (15 downto 0);
             CH5 : out std_logic_vector (15 downto 0);
             CH6 : out std_logic_vector (15 downto 0);
             CH7 : out std_logic_vector (15 downto 0);
             
             CHv0_7 : out STD_LOGIC;
            
             inversion : in std_logic_vector(7 downto 0);
             
             ADC_STATUS : out STD_LOGIC_VECTOR(11 downto 0);
             ADC_READY : out STD_LOGIC
                     
             );
    end component;    
    
	
    
    component init_clock_gen is
        Generic (ComponentBaseAddress : std_logic_vector(15 downto 0));
        Port ( clk : in  STD_LOGIC;
               CK_SPI_LE : out  STD_LOGIC;
               CK_SPI_CLK : out  STD_LOGIC;
               CK_SPI_MOSI : out  STD_LOGIC;
               CK_PD : out  STD_LOGIC;
               CK_LOCK : in  STD_LOGIC;
               CK_CONFIG_DONE : OUT  STD_LOGIC:='0';
               reset : in  STD_LOGIC;
               reset_out : out  STD_LOGIC;
               REG_addr : in STD_LOGIC_VECTOR (15 downto 0);
               REG_din : in STD_LOGIC_VECTOR (31 downto 0);
               REG_wrint : in STD_LOGIC
               );
    end component;
    

    
    component FlashController is
        Port (
                clk : in STD_LOGIC;
                BUS_Flash_0_READ_DATA : OUT STD_LOGIC_VECTOR(31 downto 0);
                BUS_Flash_0_ADDRESS : IN STD_LOGIC_VECTOR(15 downto 0); 
                BUS_Flash_0_WRITE_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
                BUS_Flash_0_W_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
                BUS_Flash_0_R_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
                BUS_Flash_0_VLD : OUT STD_LOGIC_VECTOR(0 downto 0); 
                
                REG_FLASH_CNTR_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
                REG_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
                INT_FLASH_CNTR_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
                INT_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(0 downto 0);  
                    
                REG_FLASH_ADDRESS_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
                REG_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
                INT_FLASH_ADDRESS_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
                INT_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(0 downto 0);                 
                
                
                SPI_CS : out  STD_LOGIC;
                SPI_DIN : in  STD_LOGIC;
                SPI_DOUT : out  STD_LOGIC;
                SPI_CLK : out  STD_LOGIC 
        );
    end component;    
	
	component TestBram IS
         PORT (
           clka : IN STD_LOGIC;
           wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
           dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
         );
       END component;
       	
        
    component DTClockGenerator
    port
    (  
     signal clk_out1 : out std_logic;
     signal clk_out2 : out std_logic;
     signal clk_out3 : out std_logic;
     signal clk_out4 : out std_logic;
	 signal clk_out5 : out std_logic;
     signal locked : out std_logic;
     signal clk_in1  :  in std_logic
    );
    end component;

	component fast_clock is
	port (
		clk_100 : out  STD_LOGIC;
		clk_200 : out  STD_LOGIC;
		clk_250 : out  STD_LOGIC;
		clk_250_90 : out  STD_LOGIC;
		clk_500 : out  STD_LOGIC;
		clk_500_90 : out  STD_LOGIC;
					
		reset : in  STD_LOGIC;
		locked : out  STD_LOGIC;
		clk_in1 : in  STD_LOGIC
	);
	end component;

	
	signal license_ok : std_logic;
    signal BUS_CLK     	 : STD_LOGIC_VECTOR(0 downto 0);								--CLOCK BUS
    signal CK_CONFIG_DONE :  STD_LOGIC:='0';
   
    signal sys_reset : std_LOGIC;
	
	signal D_LVDS_DCLK : STD_LOGIC;
    signal iD_LVDS_DCLK : STD_LOGIC;
     
    signal fifo_reset : std_logic_VECTOR(0 DOWNTO 0) := "0";
    signal cFiforeset : std_logic :='0';    
	signal REG_Fiforeset : std_logic_vector (31 downto 0) := (others => '0');
	
    signal CLK_80 : std_logic_vector(0 downto 0); 
    signal CLK_40 :  std_logic_vector(0 downto 0); 
    signal CLK_160 :  std_logic_vector(0 downto 0);   
    signal CLK_320 : std_logic_vector(0 downto 0); 
	signal CLK_125 : std_logic_vector(0 downto 0);
	signal FAST_CLK_100 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_200 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_250 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_250_90 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_500 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_500_90 : std_logic_vector (0 downto 0) := "0";
    
    signal async_clk : std_logic_vector (0 downto 0) := "0";
	signal GlobalClock : std_logic_vector (0 downto 0) := "0";
	
    signal GlobalReset : std_logic_vector (0 downto 0) := "0";
    signal GlobalDCMLock : std_logic; 
    signal CLK_ACQ : std_logic_vector (0 downto 0) := "0";
	
	signal itimecode_clock : std_logic;
	signal timecode_clock : std_logic;
    
    signal a_val_evt : std_logic := '0';
    signal a_val_evti : std_logic := '0';
    signal b_val_evt : std_logic := '0';
    signal c_val_evt : std_logic := '0'; 
    signal c_val_evti : std_logic := '0';
    signal d_val_evt : std_logic := '0';
        
    signal a_raz_chn : std_logic := '0';
    signal b_raz_chn : std_logic := '0';
    signal b_raz_chn_i : std_logic := '0';
    signal c_raz_chn : std_logic := '0';
    signal d_raz_chn : std_logic := '1';
    signal raz_chn_f : std_logic := '1';
    signal d_raz_chn_i : std_logic := '0';
    
    signal A_LVDS_DOUT : STD_LOGIC;
    signal B_LVDS_DOUT : STD_LOGIC;
    signal D_LVDS_DOUT : STD_LOGIC;
    signal D_LVDS_DOUTn : STD_LOGIC;        
    signal C_LVDS_DOUT : STD_LOGIC;
    signal C_LVDS_DOUTn : STD_LOGIC;
           
	signal A_HOLD_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal B_HOLD_EXT_s : std_logic_vector (0 downto 0) := "0";
	signal C_HOLD_EXT_s : std_logic_vector (0 downto 0) := "0";
	signal D_HOLD_EXT_s : std_logic_vector (0 downto 0) := "0";

	signal PETIROC_A_RSTB_s : std_logic_vector (0 downto 0) := "1"; 
	signal PETIROC_B_RSTB_s : std_logic_vector (0 downto 0) := "1"; 
	signal PETIROC_C_RSTB_s : std_logic_vector (0 downto 0) := "1"; 
	signal PETIROC_D_RSTB_s : std_logic_vector (0 downto 0) := "1"; 


	signal A_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal B_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal C_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal D_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 	

	signal A_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal B_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal C_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal D_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 	

	signal A_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal B_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal C_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal D_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 	
	
	signal A_START_CONV_s : std_logic_vector (0 downto 0) := "0";    
	signal B_START_CONV_s : std_logic_vector (0 downto 0) := "0";     
	signal C_START_CONV_s : std_logic_vector (0 downto 0) := "0";    
	signal D_START_CONV_s : std_logic_vector (0 downto 0) := "0";

    signal PETIROC_A_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal PETIROC_A_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal PETIROC_A_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";

    signal PETIROC_A_ADC_ENERGY : std_logic_vector(15 downto 0);
    signal PETIROC_B_ADC_ENERGY : std_logic_vector(15 downto 0);
    signal PETIROC_C_ADC_ENERGY : std_logic_vector(15 downto 0);
    signal PETIROC_D_ADC_ENERGY : std_logic_vector(15 downto 0);
    
	signal TRIGGER_EXT_A_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_B_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_C_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_D_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal A_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	signal B_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	
	signal C_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	
	signal D_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	
	signal A_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	signal A_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	
	signal PETIROC_A_DATA_IN_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_B_DATA_IN_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_C_DATA_IN_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_D_DATA_IN_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	signal PETIROC_A_TRANSMIT_ON_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_B_TRANSMIT_ON_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_C_TRANSMIT_ON_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal PETIROC_D_TRANSMIT_ON_s : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	signal LEMO_0_1_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_0_1_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_0_1_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_0_1_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_2_3_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_2_3_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_2_3_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_2_3_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_4_5_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_4_5_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_4_5_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_4_5_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_6_7_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_6_7_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_6_7_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_6_7_B_IN : std_logic_vector(0 downto 0);

    signal LEMO_0_1_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_2_3_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_4_5_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_6_7_DIRECTION : std_logic_vector(0 downto 0) := "0";	
     	          
    signal ADC_A0 : std_logic_vector(15 downto 0);
    signal ADC_A1 : std_logic_vector(15 downto 0);
    signal ADC_A2 : std_logic_vector(15 downto 0);
    signal ADC_A3 : std_logic_vector(15 downto 0);
    signal ADC_A4 : std_logic_vector(15 downto 0);
    signal ADC_A5 : std_logic_vector(15 downto 0);
    signal ADC_A6 : std_logic_vector(15 downto 0);
    signal ADC_A7 : std_logic_vector(15 downto 0);

    signal ANALOG_INPUT_INVERSION : std_logic_vector(7 downto 0) := x"00";
    
    signal ADCreset :  std_logic := '0';
    signal EXT_READY : std_logic;
    
    attribute keep of ADC_A0: signal is "true";
    attribute keep of ADC_A1: signal is "true";
    attribute keep of ADC_A2: signal is "true";
    attribute keep of ADC_A3: signal is "true";
    attribute keep of ADC_A4: signal is "true";
    attribute keep of ADC_A5: signal is "true";
    attribute keep of ADC_A6: signal is "true";
    attribute keep of ADC_A7: signal is "true";
    
    
    signal BUS_Flash_0_READ_DATA :  STD_LOGIC_VECTOR(31 downto 0);
    signal BUS_Flash_0_ADDRESS :  STD_LOGIC_VECTOR(15 downto 0); 
    signal BUS_Flash_0_WRITE_DATA :  STD_LOGIC_VECTOR(31 downto 0); 
    signal BUS_Flash_0_W_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Flash_0_R_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Flash_0_VLD :  STD_LOGIC_VECTOR(0 downto 0);   
    
    signal REG_FLASH_CNTR_RD :  STD_LOGIC_VECTOR(31 downto 0); 
    signal REG_FLASH_CNTR_WR :  STD_LOGIC_VECTOR(31 downto 0); 
    signal INT_FLASH_CNTR_RD :  STD_LOGIC_VECTOR(0 downto 0); 
    signal INT_FLASH_CNTR_WR :  STD_LOGIC_VECTOR(0 downto 0); 
    
    signal REG_FLASH_ADDRESS_RD :  STD_LOGIC_VECTOR(31 downto 0); 
    signal REG_FLASH_ADDRESS_WR :  STD_LOGIC_VECTOR(31 downto 0); 
    signal INT_FLASH_ADDRESS_RD :  STD_LOGIC_VECTOR(0 downto 0); 
    signal INT_FLASH_ADDRESS_WR :  STD_LOGIC_VECTOR(0 downto 0);         
    
	signal BUS_Test_0_READ_DATA :  STD_LOGIC_VECTOR(31 downto 0);
    signal BUS_Test_0_ADDRESS :  STD_LOGIC_VECTOR(15 downto 0); 
    signal BUS_Test_0_WRITE_DATA :  STD_LOGIC_VECTOR(31 downto 0); 
    signal BUS_Test_0_W_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_R_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_VLD :  STD_LOGIC_VECTOR(0 downto 0) := "1";  
	
    signal FLASH_SPI_CLK : std_logic;
               
    signal clock_prog_mux_out : std_logic;
    signal done_sig : std_logic;
    signal cfg_clk : std_logic;
    
  
    signal RESET_DCM2 : std_logic;
    signal LOCKED_DCM2 : std_logic;
	
	signal PETIROC_A_CLK_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_A_MOSI_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_A_SLOAD_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_A_RESETB_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_A_SELECT_s : STD_LOGIC_VECTOR(0 downto 0) := "0";	
	
	signal PETIROC_B_CLK_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_MOSI_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_SLOAD_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_RESETB_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_B_SELECT_s : STD_LOGIC_VECTOR(0 downto 0) := "0";

	signal PETIROC_C_CLK_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_MOSI_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_SLOAD_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_RESETB_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_C_SELECT_s : STD_LOGIC_VECTOR(0 downto 0) := "0";

	signal PETIROC_D_CLK_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_MOSI_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_SLOAD_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_RESETB_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal PETIROC_D_SELECT_s : STD_LOGIC_VECTOR(0 downto 0) := "0";	
	
	Component COUNTER_RISING Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        COUNTER: OUT STD_LOGIC_VECTOR (31 downto 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U0_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U1_hold : std_logic_vector(31 downto 0);
signal  U2_const_bin : std_logic_vector(0 downto 0) := "1";
signal U3_hold : std_logic_vector(31 downto 0);
signal U4_hold : std_logic_vector(31 downto 0);

COMPONENT SW_GATE_AND_DELAY
Generic (	maxDelay : integer := 16);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    DELAY: IN INTEGER; 
    GATE: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U5_out : std_logic_vector(0 downto 0) := (others => '0');
signal variable_run_start : std_logic_vector (0 downto 0); 
signal U7_CONST : INTEGER := 0;
signal U8_run_start : std_logic_vector (0 downto 0); 
signal U9_TIMESTAMP : STD_LOGIC_VECTOR (63 DOWNTO 0);
COMPONENT TimestampGenerator
  GENERIC( 
	nbits : INTEGER := 64 );
PORT( 
	TIMESTAMP : out STD_LOGIC_VECTOR(nbits-1 downto 0);
	T0 : in STD_LOGIC;
	CLK_READ : in STD_LOGIC;
	ClkCounter : in STD_LOGIC );
END COMPONENT;
signal variable_tr_ts : std_logic_vector (63 downto 0); 
signal variable_e16_adc : std_logic_vector (15 downto 0); 
signal variable_e16_chtrig : std_logic_vector (0 downto 0); 
signal U13_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U14_out_0 : std_logic_vector(31 downto 0);
signal U15_PULSE : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT PULSE_GENERATOR
PORT( 
	PULSE_OUT : out STD_LOGIC_VECTOR(0 downto 0);
	PULSE_PERIOD : in STD_LOGIC_VECTOR(31 downto 0);
	PULSE_WIDTH : in STD_LOGIC_VECTOR(31 downto 0);
	CE : in STD_LOGIC_VECTOR(0 downto 0);
	CLK : in STD_LOGIC_VECTOR(0 downto 0);
	RESET : in STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal U16_run_start : std_logic_vector (0 downto 0); 
signal U17_out_0 : std_logic_vector(0 downto 0);
signal U18_hold : std_logic_vector(31 downto 0);
signal U19_e16_adc : std_logic_vector (15 downto 0); 
signal U20_hold : std_logic_vector(31 downto 0);
signal U21_tr_ts : std_logic_vector (63 downto 0); 
signal U22_hold : std_logic_vector(31 downto 0);
signal U23_out : std_logic_vector(31 downto 0) := (others => '0');
signal U24_out : std_logic_vector(31 downto 0) := (others => '0');
signal  U25_const_bin : std_logic_vector(0 downto 0) := "0";
signal U26_out : std_logic_vector(0 downto 0) := (others => '0');
signal U27_CONST : INTEGER := 0;
signal variable_fifo_reset : std_logic_vector (0 downto 0); 
signal U30_out_0 : std_logic_vector(0 downto 0);
signal U30_int : std_logic_vector(0 downto 0);
signal U31_hold : std_logic_vector(31 downto 0);
Component FF_SR Is
   port(        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SET: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U32_out : std_logic_vector(0 downto 0) := (others => '0');
signal variable_trg_start : std_logic_vector (0 downto 0); 
signal variable_trg_dv : std_logic_vector (0 downto 0); 
signal U35_trg_dv : std_logic_vector (0 downto 0); 
signal U36_trg_start : std_logic_vector (0 downto 0); 
signal variable_trg_busy : std_logic_vector (0 downto 0); 
signal U38_out : std_logic_vector(0 downto 0) := (others => '0');
signal U39_out : std_logic_vector(0 downto 0) := (others => '0');
signal U40_CONST : INTEGER := 0;
signal U41_out : std_logic_vector(0 downto 0);
signal U42_out_0 : std_logic_vector(0 downto 0);
signal U43_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U44_run_start : std_logic_vector (0 downto 0); 
signal U45_CONST : INTEGER := 0;
signal U46_hold : std_logic_vector(31 downto 0);
signal U47_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U48_TRIG16 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_OR_TIME : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT PetirocSlowControl
  GENERIC( 
	CfgDefault : STD_LOGIC_VECTOR(639 downto 0) := "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100000110000010101110110011110000101011111111111111111010111111111001111111111111001001";
	CfgMonitorDefault : STD_LOGIC_VECTOR(199 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
	DoStartupSetup : STD_LOGIC_VECTOR(0 downto 0) := "1" );
PORT( 
	ASIC_CONFIGURATION : in STD_LOGIC_VECTOR(639 downto 0);
	ASIC_MONITOR_CONFIGURATION : in STD_LOGIC_VECTOR(199 downto 0);
	LOAD_CFG : in STD_LOGIC_VECTOR(0 downto 0);
	LOAD_MONITOR : in STD_LOGIC_VECTOR(0 downto 0);
	START_CFG : in STD_LOGIC_VECTOR(0 downto 0);
	START_MONITOR : in STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	PETIROC_CLK : out STD_LOGIC;
	PETIROC_MOSI : out STD_LOGIC;
	PETIROC_SLOAD : out STD_LOGIC;
	PETIROC_RESETB : out STD_LOGIC;
	PETIROC_SELECT : out STD_LOGIC;
	reset : in STD_LOGIC;
	clk : in STD_LOGIC;
	REG_CFG0 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG1 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG2 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG3 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG4 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG5 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG6 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG7 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG8 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG9 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG10 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG11 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG12 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG13 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG14 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG15 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG16 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG17 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG18 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG19 : in STD_LOGIC_VECTOR(31 downto 0);
	START_REG_CFG : in STD_LOGIC_VECTOR(31 downto 0) );
END COMPONENT;
signal U51_TIME_LSB : std_logic_vector(31 downto 0);
signal U51_TIME_MSB : std_logic_vector(31 downto 0);

COMPONENT SUBPAGE_Timer64
PORT(
	Enable : IN std_logic_vector(0 downto 0);
	Reset : IN std_logic_vector(0 downto 0);
	TIME_LSB : OUT std_logic_vector(31 downto 0);
	TIME_MSB : OUT std_logic_vector(31 downto 0);
    GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK_ACQ: in std_logic_vector (0 downto 0); 
    BUS_CLK: in std_logic_vector (0 downto 0); 
    CLK_40: in std_logic_vector (0 downto 0); 
    CLK_50: in std_logic_vector (0 downto 0); 
    CLK_80: in std_logic_vector (0 downto 0); 
    clk_160: in std_logic_vector (0 downto 0); 
    clk_125: in std_logic_vector (0 downto 0); 
    clk_320: in std_logic_vector (0 downto 0); 
    FAST_CLK_100: in std_logic_vector (0 downto 0); 
    FAST_CLK_200: in std_logic_vector (0 downto 0); 
    FAST_CLK_250: in std_logic_vector (0 downto 0); 
    FAST_CLK_250_90: in std_logic_vector (0 downto 0); 
    FAST_CLK_500: in std_logic_vector (0 downto 0); 
    FAST_CLK_500_90: in std_logic_vector (0 downto 0); 
    GlobalClock: in std_logic_vector (0 downto 0); 
    async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U52_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U53_hold : std_logic_vector(31 downto 0);
signal BUS_CP_0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_CP_0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_CP_0_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_CP_0_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT U55_custompacket
  GENERIC( 
	memLength : INTEGER := 1024;
	wordWidth : INTEGER := 32 );
PORT( 
	IN_1 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_2 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_3 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_4 : in STD_LOGIC_VECTOR(15 downto 0);
	TRIG : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_TRIG : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_RESET : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_CLK : in STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	FIFO_FULL : out STD_LOGIC_VECTOR(0 downto 0);
	RUN : out STD_LOGIC_VECTOR(0 downto 0);
	RESET : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
	READ_RD_INT : in STD_LOGIC_VECTOR(0 downto 0);
	READ_STATUS : out STD_LOGIC_VECTOR(31 downto 0);
	READ_VALID_WORDS : out STD_LOGIC_VECTOR(31 downto 0);
	CONFIG : in STD_LOGIC_VECTOR(31 downto 0) );
END COMPONENT;
signal REG_i2chv_MON_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT i2cmaster
  GENERIC( 
	CLK_FREQ : INTEGER := 160000;
	BAUD : INTEGER := 100 );
PORT( 
	scl : inout STD_LOGIC;
	sda : inout STD_LOGIC;
	INT_REG_CTRL_WR : in STD_LOGIC_VECTOR(0 downto 0);
	REG_CTRL_WR : in STD_LOGIC_VECTOR(31 downto 0);
	REG_MON_RD : out STD_LOGIC_VECTOR(31 downto 0);
	sys_clk : in STD_LOGIC;
	sys_rst : in STD_LOGIC );
END COMPONENT;
signal BUS_RateMeter_0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_RateMeter_0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT MCRateMeter
  GENERIC( 
	CHANNEL_COUNT : INTEGER := 5;
	CLK_FREQ : INTEGER := 160000000 );
PORT( 
	trigger : in STD_LOGIC_VECTOR(CHANNEL_COUNT-1 downto 0);
	VETO : in STD_LOGIC;
	START : in STD_LOGIC;
	CLK : in STD_LOGIC;
	CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
	READ_ADDRESS : in STD_LOGIC_VECTOR(15 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal U60_trg_dv : std_logic_vector (0 downto 0); 
signal variable_analogue_busy : std_logic_vector (0 downto 0); 
signal U62_analogue_busy : std_logic_vector (0 downto 0); 
signal U63_BUSY : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U63_P_E_15 : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U63_P_E_16 : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U63_P_H_16 : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U63_P_DV : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U63_TS_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
COMPONENT PetirocAnalogReadout
  GENERIC( 
	CLKDIV : INTEGER := 40 );
PORT( 
	TRIG : in STD_LOGIC;
	reject_data : in STD_LOGIC;
	BUSY : out STD_LOGIC;
	S_CHID : out STD_LOGIC_VECTOR(4 downto 0);
	S_ENERGY : out STD_LOGIC_VECTOR(15 downto 0);
	S_HIT : out STD_LOGIC;
	S_DV : out STD_LOGIC;
	P_ENERGY_0 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_0 : out STD_LOGIC;
	P_ENERGY_1 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_1 : out STD_LOGIC;
	P_ENERGY_2 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_2 : out STD_LOGIC;
	P_ENERGY_3 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_3 : out STD_LOGIC;
	P_ENERGY_4 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_4 : out STD_LOGIC;
	P_ENERGY_5 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_5 : out STD_LOGIC;
	P_ENERGY_6 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_6 : out STD_LOGIC;
	P_ENERGY_7 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_7 : out STD_LOGIC;
	P_ENERGY_8 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_8 : out STD_LOGIC;
	P_ENERGY_9 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_9 : out STD_LOGIC;
	P_ENERGY_10 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_10 : out STD_LOGIC;
	P_ENERGY_11 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_11 : out STD_LOGIC;
	P_ENERGY_12 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_12 : out STD_LOGIC;
	P_ENERGY_13 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_13 : out STD_LOGIC;
	P_ENERGY_14 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_14 : out STD_LOGIC;
	P_ENERGY_15 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_15 : out STD_LOGIC;
	P_ENERGY_16 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_16 : out STD_LOGIC;
	P_ENERGY_17 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_17 : out STD_LOGIC;
	P_ENERGY_18 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_18 : out STD_LOGIC;
	P_ENERGY_19 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_19 : out STD_LOGIC;
	P_ENERGY_20 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_20 : out STD_LOGIC;
	P_ENERGY_21 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_21 : out STD_LOGIC;
	P_ENERGY_22 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_22 : out STD_LOGIC;
	P_ENERGY_23 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_23 : out STD_LOGIC;
	P_ENERGY_24 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_24 : out STD_LOGIC;
	P_ENERGY_25 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_25 : out STD_LOGIC;
	P_ENERGY_26 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_26 : out STD_LOGIC;
	P_ENERGY_27 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_27 : out STD_LOGIC;
	P_ENERGY_28 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_28 : out STD_LOGIC;
	P_ENERGY_29 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_29 : out STD_LOGIC;
	P_ENERGY_30 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_30 : out STD_LOGIC;
	P_ENERGY_31 : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_31 : out STD_LOGIC;
	P_DV : out STD_LOGIC;
	M_ENERGY : out STD_LOGIC_VECTOR(15 downto 0);
	M_CLK : out STD_LOGIC_VECTOR(0 downto 0);
	M_DIN : out STD_LOGIC_VECTOR(0 downto 0);
	TS_IN : in STD_LOGIC_VECTOR(63 downto 0);
	TS_OUT : out STD_LOGIC_VECTOR(63 downto 0);
	TS0_IN : in STD_LOGIC_VECTOR(31 downto 0);
	TS0_OUT : out STD_LOGIC_VECTOR(31 downto 0);
	ADC_IN : in STD_LOGIC_VECTOR(15 downto 0);
	CHARGE_HIT_in : in STD_LOGIC;
	chrage_srin_a : out STD_LOGIC;
	chrage_clk_a : out STD_LOGIC;
	val_evnt : out STD_LOGIC;
	raz_chn : out STD_LOGIC;
	clk : in STD_LOGIC;
	reset : in STD_LOGIC );
END COMPONENT;
	signal BUS_PetirocCfg0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_PetirocCfg0_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_PetirocCfg0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_PetirocCfg0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_PetirocCfg0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_PetirocCfg0_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_PetirocCfg0_REG_CFG0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_REG_CFG19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_REG_CFG19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_PetirocCfg0_START_REG_CFG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_PetirocCfg0_START_REG_CFG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CP_0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CP_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CP_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CP_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_CP_0_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_CP_0_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CP_0_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CP_0_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_i2chv_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_i2chv_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_i2chv_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_i2chv_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_i2chv_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_i2chv_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_i2chv_CTRL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_i2chv_CTRL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_i2chv_MON_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_c_tot_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_c_tot_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_c_tot_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_c_tot_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_run_time_lsb_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_run_time_lsb_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_run_time_lsb_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_run_time_lsb_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_run_time_msb_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_run_time_msb_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_run_time_msb_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_run_time_msb_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_run_start_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_run_start_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_run_start_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_run_start_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_sw_trig_freq_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_sw_trig_freq_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_sw_trig_freq_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_sw_trig_freq_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_tr_sel_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_tr_sel_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_tr_sel_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_tr_sel_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_e16_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_e16_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_e16_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_e16_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_evt_ts_msb_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_evt_ts_msb_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_evt_ts_msb_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_evt_ts_msb_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_evt_ts_lsb_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_evt_ts_lsb_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_evt_ts_lsb_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_evt_ts_lsb_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_e15_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_e15_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_e15_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_e15_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_tr_en_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_tr_en_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_tr_en_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_tr_en_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_fw_ver_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_fw_ver_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_fw_ver_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_fw_ver_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_dv_tot_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_dv_tot_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_dv_tot_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_dv_tot_RD : STD_LOGIC_VECTOR(0 downto 0); 

	
begin

   D_CLK_LVDS : IBUFDS
   generic map (
      DIFF_TERM => TRUE, 
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD => "LVDS25")
   port map (
      O => iD_LVDS_DCLK, 
      I => D_LVDS_DCLK_P,
      IB => D_LVDS_DCLK_N
   );   
   D_LVDS_DCLK <= not iD_LVDS_DCLK;
   
   dcm_top: DTClockGenerator
    port map
     (
       clk_out1 => CLK_320(0),
       clk_out2 => CLK_160(0),
       clk_out3 => CLK_80(0),
       clk_out4 => CLK_40(0),
	   clk_out5 => CLK_AUX_OUT_25,
       locked => GlobalDCMLock,
       clk_in1  => D_LVDS_DCLK
     );
     
	RESET_DCM2 <= not GlobalDCMLock;
	  
	FASTCLOCKGEN : fast_clock 
        port Map(
            clk_100 => FAST_CLK_100(0),
            clk_200 => FAST_CLK_200(0),
            clk_250 => FAST_CLK_250(0),
            clk_250_90=> FAST_CLK_250_90(0),
            clk_500 => FAST_CLK_500(0),
            clk_500_90 => FAST_CLK_500_90(0),
                        
            reset => RESET_DCM2,
            locked => LOCKED_DCM2,
            clk_in1 => CLK_80(0)
        );		
		
	async_clk(0) <= D_LVDS_DCLK;
	CLK_ACQ(0) <= D_LVDS_DCLK;
	GlobalClock(0) <= D_LVDS_DCLK;
	BUS_CLK(0) <= D_LVDS_DCLK;
	
	GlobalReset(0) <= not LOCKED_DCM2;
	
	
	   BUFR_125MHZ : BUFR
   generic map (
      BUFR_DIVIDE => "2",   -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
      SIM_DEVICE => "7SERIES"  -- Must be set to "7SERIES" 
   )
   port map (
      O => CLK_125(0),    
      CE => '1', 
      CLR => '0',
      I => FAST_CLK_250(0)    
   );

	--LED_TEST <= license_ok and LOCKED_DCM2;		

   
   
    xpm_cdc_single_inst: xpm_cdc_single
      generic map (
         DEST_SYNC_FF   => 4, -- integer; range: 2-10
         INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
         SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
         SRC_INPUT_REG  => 1  -- integer; 0=do not register input, 1=register input
      )
      port map (
         src_clk  => BUS_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
         src_in   => REG_Fiforeset(0),
         dest_clk => GlobalClock(0),
         dest_out => cFiforeset
      );

	fifo_reset(0) <= cFiforeset;

	
	USBInterface: ft600_fifo245_wrapper PORT MAP(
	
	    EEMOSI => EEMOSI,
        EEMISO => EEMISO,
        EECLK => EECLK,
        EECS => EECS,    
        license_ok => license_ok,
        
		
		FTDI_ADBUS => FTDI_ADBUS,
        FTDI_RXFN => FTDI_RXFN,
        FTDI_TXEN => FTDI_TXEN,
        FTDI_RDN => FTDI_RDN,
        FTDI_TXN => FTDI_TXN,
        FTDI_CLK => FTDI_CLK,
        FTDI_OEN => FTDI_OEN,
        FTDI_SIWU => FTDI_SIWU,
        FTDI_BE => FTDI_BE,
        f_CLK => BUS_CLK(0),

        REG_Fiforeset_RD => REG_Fiforeset, 
        REG_Fiforeset_WR => REG_Fiforeset, 
        INT_Fiforeset_RD => open, 
        INT_Fiforeset_WR => open,
        
     
         
        REG_FIRMWARE_BUILD =>x"18100201",
        
      --FLASH CONTROLLER
        BUS_Flash_0_READ_DATA => BUS_Flash_0_READ_DATA,
        BUS_Flash_0_ADDRESS => BUS_Flash_0_ADDRESS, 
        BUS_Flash_0_WRITE_DATA => BUS_Flash_0_WRITE_DATA, 
        BUS_Flash_0_W_INT => BUS_Flash_0_W_INT, 
        BUS_Flash_0_R_INT => BUS_Flash_0_R_INT, 
        BUS_Flash_0_VLD => BUS_Flash_0_VLD, 
        
        REG_FLASH_CNTR_RD => REG_FLASH_CNTR_RD, 
        REG_FLASH_CNTR_WR => REG_FLASH_CNTR_WR, 
        INT_FLASH_CNTR_RD => INT_FLASH_CNTR_RD, 
        INT_FLASH_CNTR_WR => INT_FLASH_CNTR_WR, 
        
        REG_FLASH_ADDRESS_RD => REG_FLASH_ADDRESS_RD, 
        REG_FLASH_ADDRESS_WR => REG_FLASH_ADDRESS_WR, 
        INT_FLASH_ADDRESS_RD => INT_FLASH_ADDRESS_RD, 
        INT_FLASH_ADDRESS_WR => INT_FLASH_ADDRESS_WR,     
        
        -- Test 
        BUS_Test_0_READ_DATA => BUS_Test_0_READ_DATA,
        BUS_Test_0_ADDRESS => BUS_Test_0_ADDRESS, 
        BUS_Test_0_WRITE_DATA => BUS_Test_0_WRITE_DATA, 
        BUS_Test_0_W_INT => BUS_Test_0_W_INT, 
        BUS_Test_0_R_INT => BUS_Test_0_R_INT, 
        BUS_Test_0_VLD => BUS_Test_0_VLD,         
   	
		-- Register interface  
				REG_c_tot_RD => REG_c_tot_RD,
		REG_c_tot_WR => REG_c_tot_WR,
		INT_c_tot_RD => INT_c_tot_RD,
		INT_c_tot_WR => INT_c_tot_WR,
		REG_run_time_lsb_RD => REG_run_time_lsb_RD,
		REG_run_time_lsb_WR => REG_run_time_lsb_WR,
		INT_run_time_lsb_RD => INT_run_time_lsb_RD,
		INT_run_time_lsb_WR => INT_run_time_lsb_WR,
		REG_run_time_msb_RD => REG_run_time_msb_RD,
		REG_run_time_msb_WR => REG_run_time_msb_WR,
		INT_run_time_msb_RD => INT_run_time_msb_RD,
		INT_run_time_msb_WR => INT_run_time_msb_WR,
		REG_run_start_RD => REG_run_start_RD,
		REG_run_start_WR => REG_run_start_WR,
		INT_run_start_RD => INT_run_start_RD,
		INT_run_start_WR => INT_run_start_WR,
		REG_sw_trig_freq_RD => REG_sw_trig_freq_RD,
		REG_sw_trig_freq_WR => REG_sw_trig_freq_WR,
		INT_sw_trig_freq_RD => INT_sw_trig_freq_RD,
		INT_sw_trig_freq_WR => INT_sw_trig_freq_WR,
		REG_tr_sel_RD => REG_tr_sel_RD,
		REG_tr_sel_WR => REG_tr_sel_WR,
		INT_tr_sel_RD => INT_tr_sel_RD,
		INT_tr_sel_WR => INT_tr_sel_WR,
		REG_e16_RD => REG_e16_RD,
		REG_e16_WR => REG_e16_WR,
		INT_e16_RD => INT_e16_RD,
		INT_e16_WR => INT_e16_WR,
		REG_evt_ts_msb_RD => REG_evt_ts_msb_RD,
		REG_evt_ts_msb_WR => REG_evt_ts_msb_WR,
		INT_evt_ts_msb_RD => INT_evt_ts_msb_RD,
		INT_evt_ts_msb_WR => INT_evt_ts_msb_WR,
		REG_evt_ts_lsb_RD => REG_evt_ts_lsb_RD,
		REG_evt_ts_lsb_WR => REG_evt_ts_lsb_WR,
		INT_evt_ts_lsb_RD => INT_evt_ts_lsb_RD,
		INT_evt_ts_lsb_WR => INT_evt_ts_lsb_WR,
		REG_e15_RD => REG_e15_RD,
		REG_e15_WR => REG_e15_WR,
		INT_e15_RD => INT_e15_RD,
		INT_e15_WR => INT_e15_WR,
		REG_tr_en_RD => REG_tr_en_RD,
		REG_tr_en_WR => REG_tr_en_WR,
		INT_tr_en_RD => INT_tr_en_RD,
		INT_tr_en_WR => INT_tr_en_WR,
		REG_fw_ver_RD => REG_fw_ver_RD,
		REG_fw_ver_WR => REG_fw_ver_WR,
		INT_fw_ver_RD => INT_fw_ver_RD,
		INT_fw_ver_WR => INT_fw_ver_WR,
	BUS_PetirocCfg0_READ_DATA => BUS_PetirocCfg0_READ_DATA,
	BUS_PetirocCfg0_WRITE_DATA => BUS_PetirocCfg0_WRITE_DATA,
	BUS_PetirocCfg0_W_INT => BUS_PetirocCfg0_W_INT,
	BUS_PetirocCfg0_R_INT => BUS_PetirocCfg0_R_INT,
	BUS_PetirocCfg0_VLD => BUS_PetirocCfg0_VLD,
		REG_PetirocCfg0_REG_CFG0_WR => REG_PetirocCfg0_REG_CFG0_WR,
		INT_PetirocCfg0_REG_CFG0_WR => INT_PetirocCfg0_REG_CFG0_WR,
		REG_PetirocCfg0_REG_CFG1_WR => REG_PetirocCfg0_REG_CFG1_WR,
		INT_PetirocCfg0_REG_CFG1_WR => INT_PetirocCfg0_REG_CFG1_WR,
		REG_PetirocCfg0_REG_CFG2_WR => REG_PetirocCfg0_REG_CFG2_WR,
		INT_PetirocCfg0_REG_CFG2_WR => INT_PetirocCfg0_REG_CFG2_WR,
		REG_PetirocCfg0_REG_CFG3_WR => REG_PetirocCfg0_REG_CFG3_WR,
		INT_PetirocCfg0_REG_CFG3_WR => INT_PetirocCfg0_REG_CFG3_WR,
		REG_PetirocCfg0_REG_CFG4_WR => REG_PetirocCfg0_REG_CFG4_WR,
		INT_PetirocCfg0_REG_CFG4_WR => INT_PetirocCfg0_REG_CFG4_WR,
		REG_PetirocCfg0_REG_CFG5_WR => REG_PetirocCfg0_REG_CFG5_WR,
		INT_PetirocCfg0_REG_CFG5_WR => INT_PetirocCfg0_REG_CFG5_WR,
		REG_PetirocCfg0_REG_CFG6_WR => REG_PetirocCfg0_REG_CFG6_WR,
		INT_PetirocCfg0_REG_CFG6_WR => INT_PetirocCfg0_REG_CFG6_WR,
		REG_PetirocCfg0_REG_CFG7_WR => REG_PetirocCfg0_REG_CFG7_WR,
		INT_PetirocCfg0_REG_CFG7_WR => INT_PetirocCfg0_REG_CFG7_WR,
		REG_PetirocCfg0_REG_CFG8_WR => REG_PetirocCfg0_REG_CFG8_WR,
		INT_PetirocCfg0_REG_CFG8_WR => INT_PetirocCfg0_REG_CFG8_WR,
		REG_PetirocCfg0_REG_CFG9_WR => REG_PetirocCfg0_REG_CFG9_WR,
		INT_PetirocCfg0_REG_CFG9_WR => INT_PetirocCfg0_REG_CFG9_WR,
		REG_PetirocCfg0_REG_CFG10_WR => REG_PetirocCfg0_REG_CFG10_WR,
		INT_PetirocCfg0_REG_CFG10_WR => INT_PetirocCfg0_REG_CFG10_WR,
		REG_PetirocCfg0_REG_CFG11_WR => REG_PetirocCfg0_REG_CFG11_WR,
		INT_PetirocCfg0_REG_CFG11_WR => INT_PetirocCfg0_REG_CFG11_WR,
		REG_PetirocCfg0_REG_CFG12_WR => REG_PetirocCfg0_REG_CFG12_WR,
		INT_PetirocCfg0_REG_CFG12_WR => INT_PetirocCfg0_REG_CFG12_WR,
		REG_PetirocCfg0_REG_CFG13_WR => REG_PetirocCfg0_REG_CFG13_WR,
		INT_PetirocCfg0_REG_CFG13_WR => INT_PetirocCfg0_REG_CFG13_WR,
		REG_PetirocCfg0_REG_CFG14_WR => REG_PetirocCfg0_REG_CFG14_WR,
		INT_PetirocCfg0_REG_CFG14_WR => INT_PetirocCfg0_REG_CFG14_WR,
		REG_PetirocCfg0_REG_CFG15_WR => REG_PetirocCfg0_REG_CFG15_WR,
		INT_PetirocCfg0_REG_CFG15_WR => INT_PetirocCfg0_REG_CFG15_WR,
		REG_PetirocCfg0_REG_CFG16_WR => REG_PetirocCfg0_REG_CFG16_WR,
		INT_PetirocCfg0_REG_CFG16_WR => INT_PetirocCfg0_REG_CFG16_WR,
		REG_PetirocCfg0_REG_CFG17_WR => REG_PetirocCfg0_REG_CFG17_WR,
		INT_PetirocCfg0_REG_CFG17_WR => INT_PetirocCfg0_REG_CFG17_WR,
		REG_PetirocCfg0_REG_CFG18_WR => REG_PetirocCfg0_REG_CFG18_WR,
		INT_PetirocCfg0_REG_CFG18_WR => INT_PetirocCfg0_REG_CFG18_WR,
		REG_PetirocCfg0_REG_CFG19_WR => REG_PetirocCfg0_REG_CFG19_WR,
		INT_PetirocCfg0_REG_CFG19_WR => INT_PetirocCfg0_REG_CFG19_WR,
		REG_PetirocCfg0_START_REG_CFG_WR => REG_PetirocCfg0_START_REG_CFG_WR,
		INT_PetirocCfg0_START_REG_CFG_WR => INT_PetirocCfg0_START_REG_CFG_WR,
		REG_dv_tot_RD => REG_dv_tot_RD,
		REG_dv_tot_WR => REG_dv_tot_WR,
		INT_dv_tot_RD => INT_dv_tot_RD,
		INT_dv_tot_WR => INT_dv_tot_WR,
	BUS_CP_0_READ_DATA => BUS_CP_0_READ_DATA,
	BUS_CP_0_WRITE_DATA => BUS_CP_0_WRITE_DATA,
	BUS_CP_0_W_INT => BUS_CP_0_W_INT,
	BUS_CP_0_R_INT => BUS_CP_0_R_INT,
	BUS_CP_0_VLD => BUS_CP_0_VLD,
		REG_CP_0_READ_STATUS_RD => REG_CP_0_READ_STATUS_RD,
		INT_CP_0_READ_STATUS_RD => INT_CP_0_READ_STATUS_RD,
		REG_CP_0_READ_VALID_WORDS_RD => REG_CP_0_READ_VALID_WORDS_RD,
		INT_CP_0_READ_VALID_WORDS_RD => INT_CP_0_READ_VALID_WORDS_RD,
		REG_CP_0_CONFIG_WR => REG_CP_0_CONFIG_WR,
		INT_CP_0_CONFIG_WR => INT_CP_0_CONFIG_WR,
	BUS_i2chv_READ_DATA => BUS_i2chv_READ_DATA,
	BUS_i2chv_WRITE_DATA => BUS_i2chv_WRITE_DATA,
	BUS_i2chv_W_INT => BUS_i2chv_W_INT,
	BUS_i2chv_R_INT => BUS_i2chv_R_INT,
	BUS_i2chv_VLD => BUS_i2chv_VLD,
		REG_i2chv_CTRL_WR => REG_i2chv_CTRL_WR,
		INT_i2chv_CTRL_WR => INT_i2chv_CTRL_WR,
		REG_i2chv_MON_RD => REG_i2chv_MON_RD,
		INT_i2chv_MON_RD => INT_i2chv_MON_RD,
	BUS_RateMeter_0_READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
	BUS_RateMeter_0_READ_DATA => BUS_RateMeter_0_READ_DATA,
	BUS_RateMeter_0_WRITE_DATA => BUS_RateMeter_0_WRITE_DATA,
	BUS_RateMeter_0_W_INT => BUS_RateMeter_0_W_INT,
	BUS_RateMeter_0_R_INT => BUS_RateMeter_0_R_INT,
	BUS_RateMeter_0_VLD => BUS_RateMeter_0_VLD,
		REG_UNIQUE_RD => x"00112244",
		REG_UNIQUE_WR => open,
   
        
        --LATO FPGA
        
        f_RESET => '0'

                            
                      
        );
       
	   

    TBR : TestBram 
         PORT MAP(
           clka => BUS_CLK(0),
           wea => BUS_Test_0_W_INT,
           addra => BUS_Test_0_ADDRESS(9 DOWNTO 0),
           dina => BUS_Test_0_WRITE_DATA,
           douta => BUS_Test_0_READ_DATA
         );
       	   
             
    --ANALOG READOUT SIGNALs
             
	A_ANALOG_CLK <= PETIROC_A_SCLK_s(0);
    A_ANALOG_DIN <= PETIROC_A_SRIN_s(0);
	PETIROC_A_CHARGE_HIT_s(0) <= trigb_mux_a;
	PETIROC_A_ADC_ENERGY <= ADC_A1;
	
    B_ANALOG_CLK <= PETIROC_B_SCLK_s(0);
    B_ANALOG_DIN <= PETIROC_B_SRIN_s(0);
	PETIROC_B_CHARGE_HIT_s(0) <= trigb_mux_b;
	PETIROC_B_ADC_ENERGY <= ADC_A3;

    C_ANALOG_CLK <= PETIROC_C_SCLK_s(0);
    C_ANALOG_DIN <= PETIROC_C_SRIN_s(0);
	PETIROC_C_CHARGE_HIT_s(0) <= trigb_mux_c;
	PETIROC_C_ADC_ENERGY <= ADC_A5;

    D_ANALOG_CLK <= PETIROC_D_SCLK_s(0);
    D_ANALOG_DIN <= PETIROC_D_SRIN_s(0);
    PETIROC_D_CHARGE_HIT_s(0) <= trigb_mux_d;
	PETIROC_D_ADC_ENERGY <= ADC_A7;
                  
	--EXTERNAL TRIGGER
	D_TRIG_EXT <= TRIGGER_EXT_A_s(0);
    C_TRIG_EXT <= TRIGGER_EXT_B_s(0);
    B_TRIG_EXT <= TRIGGER_EXT_C_s(0);
    A_TRIG_EXT <= TRIGGER_EXT_D_s(0);
   
   	--HOLD EXT BUFFERS
	A_HOLD_EXT <= A_HOLD_EXT_s(0);
	B_HOLD_EXT <= B_HOLD_EXT_s(0);
	C_HOLD_EXT <= C_HOLD_EXT_s(0);
	D_HOLD_EXT <= D_HOLD_EXT_s(0);

	--PETIROC RSTB
	PETIROC_A_RSTB <= PETIROC_A_RSTB_s(0) and (not fifo_reset(0));
	PETIROC_B_RSTB <= PETIROC_B_RSTB_s(0) and (not fifo_reset(0));
	PETIROC_C_RSTB <= PETIROC_C_RSTB_s(0) and (not fifo_reset(0));
	PETIROC_D_RSTB <= PETIROC_D_RSTB_s(0) and (not fifo_reset(0)); 
	
	--PETIROC ADC START EXT       
	A_STARTB_ADC_EXT <= A_STARTB_ADC_EXT_s(0);
	B_STARTB_ADC_EXT <= B_STARTB_ADC_EXT_s(0);
	C_STARTB_ADC_EXT <= C_STARTB_ADC_EXT_s(0);
	D_STARTB_ADC_EXT <= D_STARTB_ADC_EXT_s(0);
	
	--VAL_EVT
	a_val_evt <= A_VAL_EVT_s(0);
	b_val_evt <= B_VAL_EVT_s(0);
	c_val_evt <= C_VAL_EVT_s(0);
	d_val_evt <= D_VAL_EVT_s(0);
	
	--RAZ_CHN
	a_raz_chn <= A_RAZ_CHN_s(0);
	b_raz_chn <= B_RAZ_CHN_s(0);
	c_raz_chn <= C_RAZ_CHN_s(0);
	d_raz_chn <= D_RAZ_CHN_s(0);
	
	--START_CONV 
	A_START_CONV <= A_START_CONV_s(0); 
	B_START_CONV <= B_START_CONV_s(0); 
	C_START_CONV <= C_START_CONV_s(0); 
	D_START_CONV <= D_START_CONV_s(0);
	
	--SLOW CONTROL
    PETIROC_A_CLK <=    PETIROC_A_CLK_s(0); 
    PETIROC_A_MOSI <=   PETIROC_A_MOSI_s(0);
    PETIROC_A_SLOAD <=  PETIROC_A_SLOAD_s(0);
    PETIROC_A_RESETB <= PETIROC_A_RESETB_s(0);
    PETIROC_A_SELECT <= PETIROC_A_SELECT_s(0);

    PETIROC_B_CLK <=    PETIROC_B_CLK_s(0); 
    PETIROC_B_MOSI <=   PETIROC_B_MOSI_s(0);
    PETIROC_B_SLOAD <=  PETIROC_B_SLOAD_s(0);
    PETIROC_B_RESETB <= PETIROC_B_RESETB_s(0);
    PETIROC_B_SELECT <= PETIROC_B_SELECT_s(0);

    PETIROC_C_CLK <=    PETIROC_C_CLK_s(0); 
    PETIROC_C_MOSI <=   PETIROC_C_MOSI_s(0);
    PETIROC_C_SLOAD <=  PETIROC_C_SLOAD_s(0);
    PETIROC_C_RESETB <= PETIROC_C_RESETB_s(0);
    PETIROC_C_SELECT <= PETIROC_C_SELECT_s(0);

    PETIROC_D_CLK <=    PETIROC_D_CLK_s(0); 
    PETIROC_D_MOSI <=   PETIROC_D_MOSI_s(0);
    PETIROC_D_SLOAD <=  PETIROC_D_SLOAD_s(0);
    PETIROC_D_RESETB <= PETIROC_D_RESETB_s(0);
    PETIROC_D_SELECT <= PETIROC_D_SELECT_s(0);
	
	
	--VAL EVENT BUFFERS
	A_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => A_VAL_EVT_P,
	  OB => A_VAL_EVT_N,
	  I => a_val_evt 
	);
		   
	B_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => B_VAL_EVT_P,
	  OB => B_VAL_EVT_N,
	  I => b_val_evt 
	);

	c_val_evti <= not c_val_evt;
	C_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => C_VAL_EVT_P,
	  OB => C_VAL_EVT_N,
	  I => c_val_evti 
	);  

	D_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => D_VAL_EVT_P,
	  OB => D_VAL_EVT_N,
	  I => d_val_evt 
	);   



	--RAZ BUFFERS
	A_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => A_RAZ_CHN_P,
	  OB => A_RAZ_CHN_N,
	  I => a_raz_chn 
	);

	b_raz_chn_i <= not b_raz_chn;
	B_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => B_RAZ_CHN_P,
	  OB => B_RAZ_CHN_N,
	  I => b_raz_chn_i 
	);
	  
	C_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => C_RAZ_CHN_P,
	  OB => C_RAZ_CHN_N,
	  I => c_raz_chn 
	);     

	d_raz_chn_i <= not d_raz_chn;   
	D_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "LVDS",
	  SLEW => "SLOW")  
	port map (
	  O => D_RAZ_CHN_P,
	  OB => D_RAZ_CHN_N,
	  I => d_raz_chn_i 
	);      


	--DATA IN BUFFERS
	D_DOUT_LVDS : IBUFDS
	generic map (
	  DIFF_TERM => TRUE, 
	  IBUF_LOW_PWR => TRUE,
	  IOSTANDARD => "LVDS25")
	port map (
	  O => D_LVDS_DOUTn, 
	  I => D_LVDS_DOUT_P,
	  IB => D_LVDS_DOUT_N
	);
	D_LVDS_DOUT <= not D_LVDS_DOUTn;

	C_DOUT_LVDS : IBUFDS
	generic map (
	  DIFF_TERM => TRUE, 
	  IBUF_LOW_PWR => TRUE,
	  IOSTANDARD => "LVDS25")
	port map (
	  O => C_LVDS_DOUTn, 
	  I => C_LVDS_DOUT_P,
	  IB => C_LVDS_DOUT_N
	);
	C_LVDS_DOUT <= not C_LVDS_DOUTn;
	 
	B_DOUT_LVDS : IBUFDS
	generic map (
	 DIFF_TERM => TRUE, 
	 IBUF_LOW_PWR => TRUE,
	 IOSTANDARD => "LVDS25")
	port map (
	 O => B_LVDS_DOUT, 
	 I => B_LVDS_DOUT_P,
	 IB => B_LVDS_DOUT_N
	);
                
	A_DOUT_LVDS : IBUFDS
	generic map (
	 DIFF_TERM => TRUE, 
	 IBUF_LOW_PWR => TRUE,
	 IOSTANDARD => "LVDS25")
	port map (
	 O => A_LVDS_DOUT, 
	 I => A_LVDS_DOUT_P,
	 IB => A_LVDS_DOUT_N
	);
     
	 
	--ASIC Timecode CLOCK
	CLK_40_LVDS : IBUFDS
	generic map (
	 DIFF_TERM => TRUE, 
	 IBUF_LOW_PWR => TRUE,
	 IOSTANDARD => "LVDS25")
	port map (
	 O => itimecode_clock, 
	 I => CLK_40_P,
	 IB => CLK_40_N
	);      
	timecode_clock <= not itimecode_clock;         
      
   
   
	CK_SPI_NSYNC <= '1';	
	EXT_ready <= CK_CONFIG_DONE;
 
	CDCE0 : init_clock_gen 
   Generic map (ComponentBaseAddress => x"0000")
   Port Map( clk => clk_100,
		  CK_SPI_LE => CK_SPI_LE,
		  CK_SPI_CLK => CK_SPI_CLK,
		  CK_SPI_MOSI => CK_SPI_MOSI,
		  CK_PD => open,
		  CK_LOCK => '1',
		  CK_CONFIG_DONE => CK_CONFIG_DONE,
		  reset => '0',
		  reset_out => sys_reset,
		  REG_addr => x"0000",
		  REG_din => x"00000000",
		  REG_wrint => '0'
		  );   


         
	ADCreset <=not EXT_READY;
	adcs:   adcs_top 
       Port map(
           
           reset => ADCreset,
           sCLK_100 => clk_100,
           ADC_1_CLK_A_P => ADC_1_CLK_A_P,
           ADC_1_CLK_A_N => ADC_1_CLK_A_N,
           ADC_1_FRAME_A_P => ADC_1_FRAME_A_P,
           ADC_1_FRAME_A_N => ADC_1_FRAME_A_N,
           ADC_1_DATA_A_P => ADC_1_DATA_A_P,
           ADC_1_DATA_A_N => ADC_1_DATA_A_N,
           ADC_1_DATA_B_P => ADC_1_DATA_B_P,
           ADC_1_DATA_B_N => ADC_1_DATA_B_N,
           SMADC_1_CSA => SMADC_1_CSA,
           SMADC_1_CSB => open,
           SMADC_1_CLK => SMADC_1_CLK,
           SMADC_1_MOSI => SMADC_1_MOSI,
           SMADC_1_RESET => SMADC_1_RESET,
           READOUT_CLK => CLK_ACQ(0),
           ADC_CLK_OUT => open,
           CH0 => ADC_A0,		
           CH1 => ADC_A1,		--CHARGE
           CH2 => ADC_A2,	
           CH3 => ADC_A3, 		--CHARGE
           CH4 => ADC_A4,	
           CH5 => ADC_A5,		--CHARGE
           CH6 => ADC_A6,
           CH7 => ADC_A7,		--CHARGE
           CHv0_7 => open,
           inversion => ANALOG_INPUT_INVERSION,
           ADC_STATUS => open,
           ADC_READY => open
    );         
	SMADC_1_PD <= '0';
   
   
    
FC : FlashController 
    Port Map(
            clk => BUS_CLK(0),
            BUS_Flash_0_READ_DATA => BUS_Flash_0_READ_DATA,
            BUS_Flash_0_ADDRESS => BUS_Flash_0_ADDRESS, 
            BUS_Flash_0_WRITE_DATA => BUS_Flash_0_WRITE_DATA, 
            BUS_Flash_0_W_INT => BUS_Flash_0_W_INT, 
            BUS_Flash_0_R_INT => BUS_Flash_0_R_INT, 
            BUS_Flash_0_VLD => BUS_Flash_0_VLD, 
            
            REG_FLASH_CNTR_RD => REG_FLASH_CNTR_RD, 
            REG_FLASH_CNTR_WR => REG_FLASH_CNTR_WR, 
            INT_FLASH_CNTR_RD => INT_FLASH_CNTR_RD, 
            INT_FLASH_CNTR_WR => INT_FLASH_CNTR_WR,  
            
            REG_FLASH_ADDRESS_RD => REG_FLASH_ADDRESS_RD, 
            REG_FLASH_ADDRESS_WR => REG_FLASH_ADDRESS_WR, 
            INT_FLASH_ADDRESS_RD => INT_FLASH_ADDRESS_RD, 
            INT_FLASH_ADDRESS_WR => INT_FLASH_ADDRESS_WR,             
            
            SPI_CS => FLASH_SPI_CS,
            SPI_DIN => FLASH_SPI_DIN,
            SPI_DOUT => FLASH_SPI_DOUT,
            SPI_CLK => FLASH_SPI_CLK 
    );
    
    
   STARTUPE2_inst : STARTUPE2
    generic map (
       PROG_USR => "FALSE",  -- Activate program event security feature. Requires encrypted bitstreams.
       SIM_CCLK_FREQ => 0.0  -- Set the Configuration Clock Frequency(ns) for simulation.
    )
    port map (
       CFGCLK => OPEN,       -- 1-bit output: Configuration main clock output
       CFGMCLK => cfg_clk,     -- 1-bit output: Configuration internal oscillator clock output
       EOS => done_sig,             -- 1-bit output: Active high output signal indicating the End Of Startup.
       PREQ => OPEN,           -- 1-bit output: PROGRAM request to fabric output
       CLK => cfg_clk,             -- 1-bit input: User start-up clock input
       GSR => '0',             -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
       GTS => '0',             -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
       KEYCLEARB => '0', -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
       PACK => '0',           -- 1-bit input: PROGRAM acknowledge input
       USRCCLKO => clock_prog_mux_out,   -- 1-bit input: User CCLK input
       USRCCLKTS => '0', -- 1-bit input: User CCLK 3-state enable input
       USRDONEO => '1',   -- 1-bit input: User DONE pin output control
       USRDONETS => '0'  -- 1-bit input: User DONE 3-state enable output
    );
         
     clock_prog_mux_out <= cfg_clk when done_sig = '0' else FLASH_SPI_CLK;

	 

	LEMO01_dir <= not LEMO_0_1_DIRECTION(0);
	LEMO23_dir <= not LEMO_2_3_DIRECTION(0);
	LEMO45_dir <= not LEMO_4_5_DIRECTION(0);
	LEMO67_dir <= not LEMO_6_7_DIRECTION(0);

	LEMO0_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_0_1_A_OUT(0),     
	  IO => LEMO0,   
	  I =>  LEMO_0_1_A_IN(0),
	  T =>  LEMO_0_1_DIRECTION(0) 
	); 

	LEMO1_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_0_1_B_OUT(0),     
	  IO => LEMO1,   
	  I =>  LEMO_0_1_B_IN(0),
	  T =>  LEMO_0_1_DIRECTION(0) 
	);            

	LEMO2_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_2_3_A_OUT(0),     
	  IO => LEMO2,   
	  I =>  LEMO_2_3_A_IN(0),
	  T =>  LEMO_2_3_DIRECTION(0) 
	); 

	LEMO3_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_2_3_B_OUT(0),     
	  IO => LEMO3,   
	  I =>  LEMO_2_3_B_IN(0),
	  T =>  LEMO_2_3_DIRECTION(0) 
	);                  

	LEMO4_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_4_5_A_OUT(0),     
	  IO => LEMO4,   
	  I =>  LEMO_4_5_A_IN(0),
	  T =>  LEMO_4_5_DIRECTION(0) 
	);   

	LEMO5_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_4_5_B_OUT(0),     
	  IO => LEMO5,   
	  I =>  LEMO_4_5_B_IN(0),
	  T =>  LEMO_4_5_DIRECTION(0) 
	);     

	LEMO6_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_6_7_A_OUT(0),     
	  IO => LEMO6,   
	  I =>  LEMO_6_7_A_IN(0),
	  T =>  LEMO_6_7_DIRECTION(0) 
	); 

	LEMO7_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_6_7_B_OUT(0),     
	  IO => LEMO7,   
	  I =>  LEMO_6_7_B_IN(0),
	  T =>  LEMO_6_7_DIRECTION(0) 
	);      	
		 

	A_TRIG0 (0) <= not A_TRG(0);
	A_TRIG1 (0) <= not A_TRG(1);
	A_TRIG2 (0) <= not A_TRG(2);
	A_TRIG3 (0) <= not A_TRG(3);
	A_TRIG4 (0) <= not A_TRG(4);
	A_TRIG5 (0) <= not A_TRG(5);
	A_TRIG6 (0) <= not A_TRG(6);
	A_TRIG7 (0) <= not A_TRG(7);
	A_TRIG8 (0) <= not A_TRG(8);
	A_TRIG9 (0) <= not A_TRG(9);
	A_TRIG10(0) <= not A_TRG(10);
	A_TRIG11(0) <= not A_TRG(11);
	A_TRIG12(0) <= not A_TRG(12);
	A_TRIG13(0) <= not A_TRG(13);
	A_TRIG14(0) <= not A_TRG(14);
	A_TRIG15(0) <= not A_TRG(15);
	A_TRIG16(0) <= not A_TRG(16);
	A_TRIG17(0) <= not A_TRG(17);
	A_TRIG18(0) <= not A_TRG(18);
	A_TRIG19(0) <= not A_TRG(19);
	A_TRIG20(0) <= not A_TRG(20);
	A_TRIG21(0) <= not A_TRG(21);
	A_TRIG22(0) <= not A_TRG(22);
	A_TRIG23(0) <= not A_TRG(23);
	A_TRIG24(0) <= not A_TRG(24);
	A_TRIG25(0) <= not A_TRG(25);
	A_TRIG26(0) <= not A_TRG(26);
	A_TRIG27(0) <= not A_TRG(27);
	A_TRIG28(0) <= not A_TRG(28);
	A_TRIG29(0) <= not A_TRG(29);
	A_TRIG30(0) <= not A_TRG(30);
	A_TRIG31(0) <= not A_TRG(31);	
	
	B_TRIG0 (0) <= not B_TRG(0);
	B_TRIG1 (0) <= not B_TRG(1);
	B_TRIG2 (0) <= not B_TRG(2);
	B_TRIG3 (0) <= not B_TRG(3);
	B_TRIG4 (0) <= not B_TRG(4);
	B_TRIG5 (0) <= not B_TRG(5);
	B_TRIG6 (0) <= not B_TRG(6);
	B_TRIG7 (0) <= not B_TRG(7);
	B_TRIG8 (0) <= not B_TRG(8);
	B_TRIG9 (0) <= not B_TRG(9);
	B_TRIG10(0) <= not B_TRG(10);
	B_TRIG11(0) <= not B_TRG(11);
	B_TRIG12(0) <= not B_TRG(12);
	B_TRIG13(0) <= not B_TRG(13);
	B_TRIG14(0) <= not B_TRG(14);
	B_TRIG15(0) <= not B_TRG(15);
	B_TRIG16(0) <= not B_TRG(16);
	B_TRIG17(0) <= not B_TRG(17);
	B_TRIG18(0) <= not B_TRG(18);
	B_TRIG19(0) <= not B_TRG(19);
	B_TRIG20(0) <= not B_TRG(20);
	B_TRIG21(0) <= not B_TRG(21);
	B_TRIG22(0) <= not B_TRG(22);
	B_TRIG23(0) <= not B_TRG(23);
	B_TRIG24(0) <= not B_TRG(24);
	B_TRIG25(0) <= not B_TRG(25);
	B_TRIG26(0) <= not B_TRG(26);
	B_TRIG27(0) <= not B_TRG(27);
	B_TRIG28(0) <= not B_TRG(28);
	B_TRIG29(0) <= not B_TRG(29);
	B_TRIG30(0) <= not B_TRG(30);
	B_TRIG31(0) <= not B_TRG(31);	

	C_TRIG0 (0) <= not C_TRG(0);
	C_TRIG1 (0) <= not C_TRG(1);
	C_TRIG2 (0) <= not C_TRG(2);
	C_TRIG3 (0) <= not C_TRG(3);
	C_TRIG4 (0) <= not C_TRG(4);
	C_TRIG5 (0) <= not C_TRG(5);
	C_TRIG6 (0) <= not C_TRG(6);
	C_TRIG7 (0) <= not C_TRG(7);
	C_TRIG8 (0) <= not C_TRG(8);
	C_TRIG9 (0) <= not C_TRG(9);
	C_TRIG10(0) <= not C_TRG(10);
	C_TRIG11(0) <= not C_TRG(11);
	C_TRIG12(0) <= not C_TRG(12);
	C_TRIG13(0) <= not C_TRG(13);
	C_TRIG14(0) <= not C_TRG(14);
	C_TRIG15(0) <= not C_TRG(15);
	C_TRIG16(0) <= not C_TRG(16);
	C_TRIG17(0) <= not C_TRG(17);
	C_TRIG18(0) <= not C_TRG(18);
	C_TRIG19(0) <= not C_TRG(19);
	C_TRIG20(0) <= not C_TRG(20);
	C_TRIG21(0) <= not C_TRG(21);
	C_TRIG22(0) <= not C_TRG(22);
	C_TRIG23(0) <= not C_TRG(23);
	C_TRIG24(0) <= not C_TRG(24);
	C_TRIG25(0) <= not C_TRG(25);
	C_TRIG26(0) <= not C_TRG(26);
	C_TRIG27(0) <= not C_TRG(27);
	C_TRIG28(0) <= not C_TRG(28);
	C_TRIG29(0) <= not C_TRG(29);
	C_TRIG30(0) <= not C_TRG(30);
	C_TRIG31(0) <= not C_TRG(31);	

	D_TRIG0 (0) <= not D_TRG(0);
	D_TRIG1 (0) <= not D_TRG(1);
	D_TRIG2 (0) <= not D_TRG(2);
	D_TRIG3 (0) <= not D_TRG(3);
	D_TRIG4 (0) <= not D_TRG(4);
	D_TRIG5 (0) <= not D_TRG(5);
	D_TRIG6 (0) <= not D_TRG(6);
	D_TRIG7 (0) <= not D_TRG(7);
	D_TRIG8 (0) <= not D_TRG(8);
	D_TRIG9 (0) <= not D_TRG(9);
	D_TRIG10(0) <= not D_TRG(10);
	D_TRIG11(0) <= not D_TRG(11);
	D_TRIG12(0) <= not D_TRG(12);
	D_TRIG13(0) <= not D_TRG(13);
	D_TRIG14(0) <= not D_TRG(14);
	D_TRIG15(0) <= not D_TRG(15);
	D_TRIG16(0) <= not D_TRG(16);
	D_TRIG17(0) <= not D_TRG(17);
	D_TRIG18(0) <= not D_TRG(18);
	D_TRIG19(0) <= not D_TRG(19);
	D_TRIG20(0) <= not D_TRG(20);
	D_TRIG21(0) <= not D_TRG(21);
	D_TRIG22(0) <= not D_TRG(22);
	D_TRIG23(0) <= not D_TRG(23);
	D_TRIG24(0) <= not D_TRG(24);
	D_TRIG25(0) <= not D_TRG(25);
	D_TRIG26(0) <= not D_TRG(26);
	D_TRIG27(0) <= not D_TRG(27);
	D_TRIG28(0) <= not D_TRG(28);
	D_TRIG29(0) <= not D_TRG(29);
	D_TRIG30(0) <= not D_TRG(30);
	D_TRIG31(0) <= not D_TRG(31);	

	A_OR_CHARGE(0)	<= not OR_CHARGE_A;
	B_OR_CHARGE(0)	<= not OR_CHARGE_B;
	C_OR_CHARGE(0)	<= not OR_CHARGE_C;
	D_OR_CHARGE(0)	<= not OR_CHARGE_D;
	
	A_OR_TIME(0) <= not and_reduce(A_TRG);
	B_OR_TIME(0) <= not and_reduce(B_TRG);
	C_OR_TIME(0) <= not and_reduce(C_TRG);
	D_OR_TIME(0) <= not and_reduce(D_TRG);

	A_TRIGs <= not A_TRG; 
	B_TRIGs <= not B_TRG; 
	C_TRIGs <= not C_TRG; 
	D_TRIGs <= not D_TRG; 
	
	PETIROC_A_DATA_IN_s(0) <= A_LVDS_DOUT;
	PETIROC_B_DATA_IN_s(0) <= B_LVDS_DOUT;
	PETIROC_C_DATA_IN_s(0) <= C_LVDS_DOUT;
	PETIROC_D_DATA_IN_s(0) <= D_LVDS_DOUT;
	
	PETIROC_A_TRANSMIT_ON_s(0) <= A_TRASMIT_ON;
	PETIROC_B_TRANSMIT_ON_s(0) <= B_TRASMIT_ON;
	PETIROC_C_TRANSMIT_ON_s(0) <= C_TRASMIT_ON;
	PETIROC_D_TRANSMIT_ON_s(0) <= D_TRASMIT_ON;

	
	U0 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U8_run_start, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U43_OUT,
        ENABLE => "1",
        COUNTER => U0_counts,
        OVERFLOW => open
    );
PROCESS_REG_U1 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U1_hold <= EXT(U0_counts,32);
    end if;
end process;
REG_c_tot_RD <= EXT(U0_counts,32);
PROCESS_REG_U3 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U3_hold <= EXT(U51_TIME_LSB,32);
    end if;
end process;
REG_run_time_lsb_RD <= EXT(U51_TIME_LSB,32);
PROCESS_REG_U4 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U4_hold <= EXT(U51_TIME_MSB,32);
    end if;
end process;
REG_run_time_msb_RD <= EXT(U51_TIME_MSB,32);

U5:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U30_int,
    DELAY => 1,
    GATE => U7_CONST,
    PORT_OUT => U5_out
);
variable_run_start <= U5_out;
U7_CONST <= 16;
U8_run_start <= variable_run_start;
U9 : TimestampGenerator
  Generic map(
	nbits => 	64)
PORT MAP(
	TIMESTAMP => U9_TIMESTAMP,
	T0 => U16_run_start(0),
	CLK_READ => GlobalClock(0),
	ClkCounter => GlobalClock(0) );
variable_tr_ts <= U63_TS_OUT;
variable_e16_adc <= U63_P_E_16;
variable_e16_chtrig <= U63_P_H_16;
U13_CONST <= conv_std_logic_vector(8,32);
U14_out_0 <= REG_sw_trig_freq_WR(31 downto 0);
U15 : PULSE_GENERATOR
PORT MAP(
	PULSE_OUT => U15_PULSE,
	PULSE_PERIOD => U14_out_0,
	PULSE_WIDTH => U13_CONST,
	CE => "1",
	CLK => GlobalClock,
	RESET => "0" );
U16_run_start <= variable_run_start;
U17_out_0 <= REG_tr_sel_WR(0 downto 0);
PROCESS_REG_U18 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U18_hold <= EXT(U23_out,32);
    end if;
end process;
REG_evt_ts_lsb_RD <= EXT(U23_out,32);
U19_e16_adc <= variable_e16_adc;
PROCESS_REG_U20 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U20_hold <= EXT(U19_e16_adc,32);
    end if;
end process;
REG_e16_RD <= EXT(U19_e16_adc,32);
U21_tr_ts <= variable_tr_ts;
PROCESS_REG_U22 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U22_hold <= EXT(U24_out,32);
    end if;
end process;
REG_evt_ts_msb_RD <= EXT(U24_out,32);
U23_out <= U21_tr_ts(31 downto 0);
U24_out <= U21_tr_ts(63 downto 32);

U26:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U43_OUT,
    DELAY => 1,
    GATE => U27_CONST,
    PORT_OUT => U26_out
);
U27_CONST <= 8;
LEMO_0_1_A_IN <= U26_out;
LEMO_0_1_B_IN <= U62_analogue_busy;
LEMO_0_1_DIRECTION <= U25_const_bin;
variable_fifo_reset <= U30_out_0;
U30_int <= INT_run_start_WR;
U30_out_0 <= REG_run_start_WR(0 downto 0);
PROCESS_REG_U31 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U31_hold <= EXT(U63_P_E_15,32);
    end if;
end process;
REG_e15_RD <= EXT(U63_P_E_15,32);
U32 : FF_SR
    port map( 
        CE => "1",
        RESET => U39_out, 
        SET => U38_out,
        PORT_OUT => U32_out
    );
variable_trg_start <= U43_OUT;
variable_trg_dv <= U63_P_DV;
U35_trg_dv <= variable_trg_dv;
U36_trg_start <= variable_trg_start;
variable_trg_busy <= U32_out;

U38:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U36_trg_start,
    DELAY => 1,
    GATE => U40_CONST,
    PORT_OUT => U38_out
);

U39:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U35_trg_dv,
    DELAY => 1,
    GATE => U45_CONST,
    PORT_OUT => U39_out
);
U40_CONST <= 1;

U41 : block
begin
U41_out <= U48_OR_TIME when U17_out_0 = "0" else U15_PULSE when U17_out_0 = "1"  else (others=>'0');

end block;
U42_out_0 <= REG_tr_en_WR(0 downto 0);
U43_OUT <= U41_out AND U42_out_0;
U44_run_start <= variable_run_start;
U45_CONST <= 1;
PROCESS_REG_U46 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U46_hold <= EXT(U47_CONST,32);
    end if;
end process;
REG_fw_ver_RD <= EXT(U47_CONST,32);
U47_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"00010001"),32));
U48_TRIG16 <= A_TRIG16;
U48_OR_TIME <= A_OR_TIME;
TRIGGER_EXT_A_s <= U15_PULSE;

U50 : PetirocSlowControl
  Generic map(
	CfgDefault => 	"0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100000110000010101110110011110000101011111111111111111010111111111001111111111111001001",
	CfgMonitorDefault => 	"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
	DoStartupSetup => 	"1")
PORT MAP(
	ASIC_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	ASIC_MONITOR_CONFIGURATION => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	LOAD_CFG => "0",
	LOAD_MONITOR => "0",
	START_CFG => "0",
	START_MONITOR => "0",
	BUSY => open,
	PETIROC_CLK => PETIROC_A_CLK_s(0),
	PETIROC_MOSI => PETIROC_A_MOSI_s(0),
	PETIROC_SLOAD => PETIROC_A_SLOAD_s(0),
	PETIROC_RESETB => PETIROC_A_RESETB_s(0),
	PETIROC_SELECT => PETIROC_A_SELECT_s(0),
	reset => '0',
	clk => GlobalClock(0),
	REG_CFG0 => REG_PetirocCfg0_REG_CFG0_WR,
	REG_CFG1 => REG_PetirocCfg0_REG_CFG1_WR,
	REG_CFG2 => REG_PetirocCfg0_REG_CFG2_WR,
	REG_CFG3 => REG_PetirocCfg0_REG_CFG3_WR,
	REG_CFG4 => REG_PetirocCfg0_REG_CFG4_WR,
	REG_CFG5 => REG_PetirocCfg0_REG_CFG5_WR,
	REG_CFG6 => REG_PetirocCfg0_REG_CFG6_WR,
	REG_CFG7 => REG_PetirocCfg0_REG_CFG7_WR,
	REG_CFG8 => REG_PetirocCfg0_REG_CFG8_WR,
	REG_CFG9 => REG_PetirocCfg0_REG_CFG9_WR,
	REG_CFG10 => REG_PetirocCfg0_REG_CFG10_WR,
	REG_CFG11 => REG_PetirocCfg0_REG_CFG11_WR,
	REG_CFG12 => REG_PetirocCfg0_REG_CFG12_WR,
	REG_CFG13 => REG_PetirocCfg0_REG_CFG13_WR,
	REG_CFG14 => REG_PetirocCfg0_REG_CFG14_WR,
	REG_CFG15 => REG_PetirocCfg0_REG_CFG15_WR,
	REG_CFG16 => REG_PetirocCfg0_REG_CFG16_WR,
	REG_CFG17 => REG_PetirocCfg0_REG_CFG17_WR,
	REG_CFG18 => REG_PetirocCfg0_REG_CFG18_WR,
	REG_CFG19 => REG_PetirocCfg0_REG_CFG19_WR,
	START_REG_CFG => REG_PetirocCfg0_START_REG_CFG_WR );

U51:SUBPAGE_Timer64
PORT MAP(
	Enable => U2_const_bin,
	Reset => U16_run_start,
	TIME_LSB => U51_TIME_LSB,
	TIME_MSB => U51_TIME_MSB,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_50 => "0" ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    clk_125=>clk_125 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);
U52 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U8_run_start, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U63_P_DV,
        ENABLE => "1",
        COUNTER => U52_counts,
        OVERFLOW => open
    );
PROCESS_REG_U53 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U53_hold <= EXT(U52_counts,32);
    end if;
end process;
REG_dv_tot_RD <= EXT(U52_counts,32);
U55 : U55_custompacket
  Generic map(
	memLength => 	1024,
	wordWidth => 	32)
PORT MAP(
	IN_1 => U0_counts,
	IN_2 => U24_out,
	IN_3 => U23_out,
	IN_4 => U19_e16_adc,
	TRIG => U63_P_DV,
	CLK_WRITE => CLK_ACQ,
	SYNC_TRIG => "0",
	SYNC_RESET => "0",
	SYNC_CLK => "0",
	BUSY => open,
	FIFO_FULL => open,
	RUN => open,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_DATA => BUS_CP_0_READ_DATA,
	READ_DATAVALID => BUS_CP_0_VLD,
	READ_RD_INT => BUS_CP_0_R_INT,
	READ_STATUS => REG_CP_0_READ_STATUS_RD,
	READ_VALID_WORDS => REG_CP_0_READ_VALID_WORDS_RD,
	CONFIG => REG_CP_0_CONFIG_WR );
U57 : i2cmaster
  Generic map(
	CLK_FREQ => 	160000,
	BAUD => 	100)
PORT MAP(
	scl => IIC_SCL,
	sda => IIC_SDA,
	INT_REG_CTRL_WR => INT_i2chv_CTRL_WR,
	REG_CTRL_WR => REG_i2chv_CTRL_WR,
	REG_MON_RD => REG_i2chv_MON_RD,
	sys_clk => CLK_ACQ(0),
	sys_rst => '0' );
U59 : MCRateMeter
  Generic map(
	CHANNEL_COUNT => 	5,
	CLK_FREQ => 	160000000)
PORT MAP(
	trigger => U60_trg_dv & U15_PULSE & U48_TRIG16 & U48_OR_TIME & U43_OUT,
	VETO => '0',
	START => U44_run_start(0),
	CLK => CLK_ACQ(0),
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
	READ_DATA => BUS_RateMeter_0_READ_DATA,
	READ_DATAVALID => BUS_RateMeter_0_VLD );
U60_trg_dv <= variable_trg_dv;
variable_analogue_busy <= U63_BUSY;
U62_analogue_busy <= variable_analogue_busy;
U63 : PetirocAnalogReadout
  Generic map(
	CLKDIV => 	40)
PORT MAP(
	TRIG => U43_OUT(0),
	reject_data => '0',
	BUSY => U63_BUSY(0),
	S_CHID => open,
	S_ENERGY => open,
	S_HIT => open,
	S_DV => open,
	P_ENERGY_0 => open,
	P_HIT_0 => open,
	P_ENERGY_1 => open,
	P_HIT_1 => open,
	P_ENERGY_2 => open,
	P_HIT_2 => open,
	P_ENERGY_3 => open,
	P_HIT_3 => open,
	P_ENERGY_4 => open,
	P_HIT_4 => open,
	P_ENERGY_5 => open,
	P_HIT_5 => open,
	P_ENERGY_6 => open,
	P_HIT_6 => open,
	P_ENERGY_7 => open,
	P_HIT_7 => open,
	P_ENERGY_8 => open,
	P_HIT_8 => open,
	P_ENERGY_9 => open,
	P_HIT_9 => open,
	P_ENERGY_10 => open,
	P_HIT_10 => open,
	P_ENERGY_11 => open,
	P_HIT_11 => open,
	P_ENERGY_12 => open,
	P_HIT_12 => open,
	P_ENERGY_13 => open,
	P_HIT_13 => open,
	P_ENERGY_14 => open,
	P_HIT_14 => open,
	P_ENERGY_15 => U63_P_E_15,
	P_HIT_15 => open,
	P_ENERGY_16 => U63_P_E_16,
	P_HIT_16 => U63_P_H_16(0),
	P_ENERGY_17 => open,
	P_HIT_17 => open,
	P_ENERGY_18 => open,
	P_HIT_18 => open,
	P_ENERGY_19 => open,
	P_HIT_19 => open,
	P_ENERGY_20 => open,
	P_HIT_20 => open,
	P_ENERGY_21 => open,
	P_HIT_21 => open,
	P_ENERGY_22 => open,
	P_HIT_22 => open,
	P_ENERGY_23 => open,
	P_HIT_23 => open,
	P_ENERGY_24 => open,
	P_HIT_24 => open,
	P_ENERGY_25 => open,
	P_HIT_25 => open,
	P_ENERGY_26 => open,
	P_HIT_26 => open,
	P_ENERGY_27 => open,
	P_HIT_27 => open,
	P_ENERGY_28 => open,
	P_HIT_28 => open,
	P_ENERGY_29 => open,
	P_HIT_29 => open,
	P_ENERGY_30 => open,
	P_HIT_30 => open,
	P_ENERGY_31 => open,
	P_HIT_31 => open,
	P_DV => U63_P_DV(0),
	M_ENERGY => open,
	M_CLK => open,
	M_DIN => open,
	TS_IN => U9_TIMESTAMP,
	TS_OUT => U63_TS_OUT,
	TS0_IN => "00000000000000000000000000000000",
	TS0_OUT => open,
	ADC_IN => PETIROC_A_ADC_ENERGY,
	CHARGE_HIT_in => PETIROC_A_CHARGE_HIT_s(0),
	chrage_srin_a => PETIROC_A_SRIN_s(0),
	chrage_clk_a => PETIROC_A_SCLK_s(0),
	val_evnt => A_VAL_EVT_s(0),
	raz_chn => A_RAZ_CHN_s(0),
	clk => GlobalClock(0),
	reset => '0' );

		 
end Behavioral;

 