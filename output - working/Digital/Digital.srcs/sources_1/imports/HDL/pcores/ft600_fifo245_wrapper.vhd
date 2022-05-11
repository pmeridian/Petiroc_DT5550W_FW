
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Library xpm;
use xpm.vcomponents.all;

entity ft600_fifo245_wrapper is
Port ( 

          --EEPROM SICUREZZE
          EEMOSI : out STD_LOGIC;
          EEMISO : in STD_LOGIC;
          EECLK : out STD_LOGIC;
          EECS : out STD_LOGIC;
          license_ok : out std_logic;
          
          FTDI_ADBUS : inout STD_LOGIC_VECTOR (31 downto 0);
          FTDI_BE	 : inout STD_LOGIC_VECTOR (3 downto 0);
          FTDI_RXFN : in STD_LOGIC;			--EMPTY
          FTDI_TXEN : in STD_LOGIC; 		--FULL
          FTDI_RDN	: out STD_LOGIC;		--READ ENABLE
          FTDI_TXN	: out STD_LOGIC;		--WRITE ENABLE
          FTDI_CLK	: in STD_LOGIC;			--FTDI CLOCK
          FTDI_OEN	: out STD_LOGIC;		--OUTPUT ENABLE NEGATO LATO FTDI
          FTDI_SIWU : out STD_LOGIC;		--COMMIT A PACKET IMMEDIATLY

		  
		REG_Fiforeset_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Fiforeset_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Fiforeset_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_Fiforeset_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
        
       --Flash controller 
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
	

		--LATO FPGA
	  f_CLK : IN STD_LOGIC;
	  f_RESET : IN STD_LOGIC
			  	  
			  
);
end ft600_fifo245_wrapper;

architecture Behavioral of ft600_fifo245_wrapper is



	component FTDI_FIFOs
		port (
		rst: IN std_logic;
		wr_clk: IN std_logic;
		rd_clk: IN std_logic;
		din: IN std_logic_VECTOR(33 downto 0);
		wr_en: IN std_logic;
		rd_en: IN std_logic;
		dout: OUT std_logic_VECTOR(33 downto 0);
		full: OUT std_logic;
		empty: OUT std_logic;
		valid: OUT std_logic;
		prog_empty: OUT std_logic;
		prog_full: OUT std_logic
		);
	end component;
	
	component FTDI_FIFO_AW
        port (
        rst: IN std_logic;
        wr_clk: IN std_logic;
        rd_clk: IN std_logic;
        din: IN std_logic_VECTOR(65 downto 0);
        wr_en: IN std_logic;
        rd_en: IN std_logic;
        dout: OUT std_logic_VECTOR(65 downto 0);
        full: OUT std_logic;
        empty: OUT std_logic;
        valid: OUT std_logic;
        prog_empty: OUT std_logic;
        prog_full: OUT std_logic
        );
    end component;	


	COMPONENT ft600_fifo245_core
	PORT(
        --EEPROM SICUREZZE
        EEMOSI : out STD_LOGIC;
        EEMISO : in STD_LOGIC;
        EECLK : out STD_LOGIC;
        EECS : out STD_LOGIC;
        license_ok : out std_logic;
            
		reset : IN std_logic;
		FTDI_RXFN : IN std_logic;
		FTDI_TXEN : IN std_logic;
		FTDI_CLK : IN std_logic;   
		FTDI_ADBUS : INOUT std_logic_vector(31 downto 0);      
		FTDI_RDN : OUT std_logic;
		FTDI_TXN : OUT std_logic;
		FTDI_OEN : OUT std_logic;
		FTDI_SIWU : OUT std_logic;
		FTDI_BE : inout std_logic_vector(3 downto 0);
		int_rd : OUT std_logic;
		int_wr : OUT std_logic;
		data_wr : OUT std_logic_vector(31 downto 0);
		data_rd : IN std_logic_vector(31 downto 0);		
		addr : OUT std_logic_vector(31 downto 0);
		req_read_data : OUT std_logic;
		input_fifo_empty : IN std_logic;
		input_fifo_valid : IN STD_LOGIC;
		fifo_address_full : IN std_logic; 
		send_shit : OUT STD_LOGIC;
		fifo_reset : OUT std_logic
		);
	END COMPONENT;
	

	
	-- SEGNALI INTERNI
			  
	signal  int_rd 	: STD_LOGIC;
	signal  int_wr 	: STD_LOGIC;
	signal  data_rd 	: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal  data_wr 	: STD_LOGIC_VECTOR(31 downto 0);
	signal  core_addr 		: STD_LOGIC_VECTOR(31 downto 0);
	
	signal  addr_wrt		: STD_LOGIC;
	signal  addr_empty 	: STD_LOGIC;
	
	signal  BUS_ADDR 		: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal  BUS_DATA_WR 	: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal  BUS_DATA_RD 	: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
	signal  BUS_INT_RD 	: STD_LOGIC:='0';
	signal  BUS_INT_WR 	: STD_LOGIC:='0';
	signal  BUS_DATASTROBE: STD_LOGIC:='0';
	signal  i_BUS_DATASTROBE: STD_LOGIC:='0';
	
	signal  req_read_data : STD_LOGIC; 

	signal  SYNC_INT_RD 	: STD_LOGIC:='0';
	signal  SYNC_INT_WR 	: STD_LOGIC:='0';
	
	signal CLK : STD_LOGIC;
	
	signal reset : std_logic;
	
	signal invFTDI_CLK : STD_LOGIC := '0';
	
	signal fifo_reset : std_logic;
	signal fifo_reset2 : std_logic;
	
	signal input_fifo_empty :  STD_LOGIC :='0';
	
	signal fifo_address_full : STD_LOGIC := '0';
	
	signal data_read_full : STD_LOGIC := '0';
	
	signal not_full_and_pending : STD_LOGIC := '0';
	signal pending : STD_LOGIC := '0';
	
	signal i_f_MODE : STD_LOGIC := '0';
	
    signal addr_empty_d : std_logic := '1';
    

			
	signal add_fifo_rd : std_logic := '0';
	
	signal f_BUS_ADDR 		 :  STD_LOGIC_VECTOR(31 downto 0);	--INDIRIZZO DI LETTURA/SCRITTURA
	
	signal f_ENDIAN			 :  STD_LOGIC:='0';					--ENDIAN DEL PC (0: BIG 1:LITTLE)
	
	--DA FPGA A PC
	signal f_BUS_INT_RD 	 :  STD_LOGIC;						--INTERRUPT DI LETTURA
	signal f_BUS_DATASTROBE  :  STD_LOGIC;						--CONFERMA CHE I DATI RICHIESTI SONO DISPONIBILI
	signal f_BUS_DATASTROBE_REG  :  STD_LOGIC;						--CONFERMA CHE I DATI RICHIESTI SONO DISPONIBILI (REGISTRI)
	signal f_BUS_DATA_RD	 :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIARE AL PC
	signal f_BUS_DATA_RD_REG :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIARE AL PC (REGISTRI)
	signal f_MODE		     :  STD_LOGIC := '0';					--0 IL SEGNALE DATASROBE E' ABILITAO, 1 DATI CAMPIONATI UN CICLO DOPO INT_RD
	
	--DA PC A FPGA
	signal f_BUS_INT_WR 	 :  STD_LOGIC;						--INTERRUPT DI SCRITTURA
	signal f_BUS_DATA_WR	 :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIATI DAL PC
	signal wreg				 :  STD_LOGIC_VECTOR(31 downto 0);
	signal addr 			 : STD_LOGIC_VECTOR(31 downto 0);
	
	
	attribute keep : string; 
	attribute keep of int_rd: signal is "true";	
	attribute keep of int_wr: signal is "true";	
	attribute keep of data_rd: signal is "true";	
	attribute keep of data_wr: signal is "true";	
	attribute keep of addr: signal is "true";	

	attribute keep of BUS_ADDR: signal is "true";
	attribute keep of f_BUS_ADDR: signal is "true";		
	attribute keep of BUS_DATA_WR: signal is "true";	
	attribute keep of f_BUS_DATA_WR: signal is "true";
	attribute keep of BUS_DATA_RD: signal is "true";	
	attribute keep of BUS_INT_RD: signal is "true";	
	attribute keep of BUS_INT_WR: signal is "true";	
	attribute keep of BUS_DATASTROBE: signal is "true";	
	
	attribute keep of SYNC_INT_WR: signal is "true";	
	attribute keep of addr_empty: signal is "true";
				
	signal data_fifo_full :std_logic;
	signal input_fifo_valid : std_logic;
	signal send_sheet :  STD_LOGIC;
	signal send_sheet_sync :  STD_LOGIC;
	
	attribute keep of send_sheet: signal is "true";
	attribute keep of send_sheet_sync: signal is "true";
begin



xpm_cdc_single_inst: xpm_cdc_single
generic map (
DEST_SYNC_FF => 4, -- integer; range: 2-10
SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
SRC_INPUT_REG => 1 -- integer; 0=do not register input, 1=register input
)
port map (
src_clk => invFTDI_CLK, -- optional; required when SRC_INPUT_REG = 1
src_in => send_sheet,
dest_clk => clk,
dest_out => send_sheet_sync
);
	
	
--FT232H
	invFTDI_CLK <=  FTDI_CLK;
	--FT2232H
	--invFTDI_CLK <= not FTDI_CLK;

	Inst_ft600_fifo245_core: ft600_fifo245_core PORT MAP(
        EEMOSI => EEMOSI,
        EEMISO => EEMISO,
        EECLK => EECLK,
        EECS => EECS,	
        license_ok => license_ok,
		reset => reset,
		FTDI_ADBUS => FTDI_ADBUS,
		FTDI_RXFN => FTDI_RXFN,
		FTDI_TXEN => FTDI_TXEN,
		FTDI_RDN => FTDI_RDN,
		FTDI_TXN => FTDI_TXN,
		FTDI_CLK => FTDI_CLK,
		FTDI_OEN => FTDI_OEN,
		FTDI_SIWU => FTDI_SIWU,
		FTDI_BE => FTDI_BE,
		int_rd => int_rd ,
		int_wr => int_wr,
		data_rd => data_rd,
		data_wr => data_wr,
		addr => core_addr,
		req_read_data => req_read_data,
		fifo_reset => fifo_reset,
		input_fifo_empty => input_fifo_empty,
		input_fifo_valid => input_fifo_valid,
		send_shit => send_sheet,
		fifo_address_full =>  fifo_address_full
	);



	addr_wrt <= int_rd or int_wr;
	
	fifo_reset2 <= reset or fifo_reset;
	
	ADDRESS_FIFO : FTDI_FIFO_AW
		port map (
			rst => fifo_reset2,
			wr_clk => invFTDI_CLK,
			rd_clk => clk,
			din(65 downto 34) => data_wr,
			din(33) => int_rd,
			din(32) => int_wr,
			din(31 downto 0) => core_addr,
			wr_en => addr_wrt,
			rd_en => add_fifo_rd,
			dout(65 downto 34) => BUS_DATA_WR,
			dout(33) => SYNC_INT_RD,
			dout(32) => SYNC_INT_WR,
			dout(31 downto 0) => BUS_ADDR,
			full => open,
			empty => addr_empty,
			prog_empty => open,
			prog_full => fifo_address_full
			);
    
    add_fifo_rd <= not_full_and_pending and (not addr_empty) ;
	not_full_and_pending <= (not data_read_full) and (not pending);
	BUS_INT_RD <= SYNC_INT_RD and (not addr_empty) and (not_full_and_pending);
	BUS_INT_WR <= SYNC_INT_WR and (not addr_empty_d) and (not_full_and_pending);
	
	--led <= BUS_INT_RD or BUS_INT_WR;

--	DATAWRITE_FIFO : FTDI_FIFOs
--		port map (
--			rst => reset,
--			wr_clk => invFTDI_CLK,
--			rd_clk => clk,
--			din(33 downto 32) => "00",
--			din(31 downto 0) => data_wr,
--			wr_en => int_wr,
--			rd_en => add_fifo_rd,
--			dout(31 downto 0) => BUS_DATA_WR,
--			dout(33 downto 32) => open,
--			full => open,
--			empty => open);


	DATA_READ_FIFO : FTDI_FIFOs
		port map (
			rst => fifo_reset2,
			wr_clk => clk,
			rd_clk => invFTDI_CLK,
		--	din(65 downto 34) => X"00000000",
			din(33 downto 32) => "00",
			din(31 downto 0) => BUS_DATA_RD,
			wr_en => BUS_DATASTROBE,
			rd_en => req_read_data,
		--	dout(65 downto 34) => OPEN,
			dout(31 downto 0) => data_rd,
			dout(33 downto 32) => open,
			full => open,
			prog_full => data_read_full,
			prog_empty => open,
			empty => input_fifo_empty,
			valid => input_fifo_valid);


	CLK <= f_CLK;
	reset <= f_RESET;


BUS_CP_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00003000" And addr < x"00003001") else '0';BUS_RateMeter_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00005000" And addr < x"00015000") else '0';
BUS_RateMeter_0_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00005000" And addr < x"00015000") else (others => '0');
f_BUS_DATA_RD <= BUS_Test_0_READ_DATA when  (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else 
 BUS_FLASH_0_READ_DATA when (addr >= x"FFFE0000" And addr < x"FFFEE000") else 
 BUS_CP_0_READ_DATA when (addr >= x"00003000" And addr < x"00003001") else BUS_RateMeter_0_READ_DATA  when  addr >= x"00005000" and addr < x"00015000" else 
 f_BUS_DATA_RD_REG;
 f_BUS_DATASTROBE <=BUS_Test_0_VLD(0) when  (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else 
BUS_FLASH_0_VLD(0) when (addr >= x"FFFE0000" And addr < x"FFFEE000") else 
  BUS_CP_0_VLD(0) when (addr >= x"00003000" And addr < x"00003001") else  BUS_RateMeter_0_VLD(0) when  addr >= x"00005000" and addr < x"00015000" else 
 f_BUS_DATASTROBE_REG;

	
    --f_BUS_DATA_RD    <=     BUS_Test_0_READ_DATA when  (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else 
    --                        BUS_FLASH_0_READ_DATA when (addr >= x"FFFE0000" And addr < x"FFFEE000") else f_BUS_DATA_RD_REG;
                            
    --f_BUS_DATASTROBE <=     BUS_Test_0_VLD(0) when  (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else
    --                        BUS_FLASH_0_VLD(0) when (addr >= x"FFFE0000" And addr < x"FFFEE000") else f_BUS_DATASTROBE_REG;

    BUS_FLASH_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"FFFE0000" And addr < x"FFFEE000") else '0';
    BUS_Test_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else '0';
                            
    
    BUS_Test_0_ADDRESS  <=  BUS_ADDR(15 downto 0) when (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else (others => '0');
    BUS_FLASH_0_ADDRESS  <= BUS_ADDR(15 downto 0) when (addr >= x"FFFE0000" And addr < x"FFFEE000") else (others => '0');
    
    BUS_Test_0_WRITE_DATA  <= f_BUS_DATA_WR;
    BUS_FLASH_0_WRITE_DATA  <= f_BUS_DATA_WR;
    
    
    BUS_Test_0_W_INT (0) <=  f_BUS_INT_WR when (addr >= x"FFFD0000" And addr < x"FFFDFFFF") else '0';
    BUS_FLASH_0_W_INT (0) <=  f_BUS_INT_WR when (addr >= x"FFFE0000" And addr < x"FFFEE000") else '0';
    
	i_f_MODE <= f_MODE;
	
	f_BUS_ADDR <= BUS_ADDR;
	
	f_BUS_INT_RD <= BUS_INT_RD and( not send_sheet_sync);
		
	BUS_DATASTROBE <=i_BUS_DATASTROBE;-- f_BUS_DATASTROBE when i_f_MODE = '0' else i_BUS_DATASTROBE;
	BUS_DATA_RD <= f_BUS_DATA_RD when f_ENDIAN = '0' else f_BUS_DATA_RD(7 downto 0) & f_BUS_DATA_RD(15 downto 8) & f_BUS_DATA_RD(23 downto 16) & f_BUS_DATA_RD(31 downto 24);
	
	f_BUS_INT_WR <= BUS_INT_WR;
	f_BUS_DATA_WR <= BUS_DATA_WR when f_ENDIAN = '0' else BUS_DATA_WR(7 downto 0) & BUS_DATA_WR(15 downto 8) & BUS_DATA_WR(23 downto 16) & BUS_DATA_WR(31 downto 24);
	addr <= f_BUS_ADDR;
	

	
	-- intDS : process(clk)
	-- begin
		-- if reset='1' then
			-- i_BUS_DATASTROBE <= '0';
		-- elsif rising_edge(clk) then
	    -- addr_empty_d <= addr_empty;
		  
			-- i_BUS_DATASTROBE <= '0';
			
			-- if BUS_INT_RD = '1' then
			----	i_BUS_DATASTROBE <= '1';--(i_f_MODE  or f_BUS_DATASTROBE ) ;
				-- if i_f_MODE = '0' then
					-- pending <= '1';
				-- end if;
			-- end if;		
			
			-- if i_f_MODE = '0' and ((f_BUS_DATASTROBE = '1' and pending ='1') or (send_sheet_sync = '1')) then
				-- pending <= '0';
				-- i_BUS_DATASTROBE <= '1';
			-- end if;

		-- end if;
	
	-- end process;
	
	
	
	intDS : process(clk)
	begin
		if reset='1' then
			i_BUS_DATASTROBE <= '0';
		elsif rising_edge(clk) then
		
		    addr_empty_d <= addr_empty;
		  
			i_BUS_DATASTROBE <= '0';
			
			if BUS_INT_RD = '1' then
				i_BUS_DATASTROBE <= '1';--(i_f_MODE  or f_BUS_DATASTROBE ) ;
				if i_f_MODE = '0' then
					pending <= '1';
				end if;
			end if;		
			
			if i_f_MODE = '0' and ((f_BUS_DATASTROBE = '1') or (send_sheet_sync = '1')) then
				pending <= '0';
			end if;

		end if;
	
	end process;	
	
	
	--SCICOMPILER COSTUMIZABLE REGISTER FILE
	
	
	wreg <= f_BUS_DATA_WR;
	
	register_manager : process(clk)
		variable rreg	:  STD_LOGIC_VECTOR(31 downto 0);
	begin
		if reset='1' then
					REG_c_tot_WR <= (others => '0');
		INT_c_tot_WR <= "0";
		INT_c_tot_RD <= "0";
		REG_run_time_lsb_WR <= (others => '0');
		INT_run_time_lsb_WR <= "0";
		INT_run_time_lsb_RD <= "0";
		REG_run_time_msb_WR <= (others => '0');
		INT_run_time_msb_WR <= "0";
		INT_run_time_msb_RD <= "0";
		REG_run_start_WR <= (others => '0');
		INT_run_start_WR <= "0";
		INT_run_start_RD <= "0";
		REG_sw_trig_freq_WR <= (others => '0');
		INT_sw_trig_freq_WR <= "0";
		INT_sw_trig_freq_RD <= "0";
		REG_tr_sel_WR <= (others => '0');
		INT_tr_sel_WR <= "0";
		INT_tr_sel_RD <= "0";
		REG_e16_WR <= (others => '0');
		INT_e16_WR <= "0";
		INT_e16_RD <= "0";
		REG_evt_ts_msb_WR <= (others => '0');
		INT_evt_ts_msb_WR <= "0";
		INT_evt_ts_msb_RD <= "0";
		REG_evt_ts_lsb_WR <= (others => '0');
		INT_evt_ts_lsb_WR <= "0";
		INT_evt_ts_lsb_RD <= "0";
		REG_e15_WR <= (others => '0');
		INT_e15_WR <= "0";
		INT_e15_RD <= "0";
		REG_tr_en_WR <= (others => '0');
		INT_tr_en_WR <= "0";
		INT_tr_en_RD <= "0";
		REG_fw_ver_WR <= (others => '0');
		INT_fw_ver_WR <= "0";
		INT_fw_ver_RD <= "0";
	BUS_PetirocCfg0_W_INT <= "0";
		REG_PetirocCfg0_REG_CFG0_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG0_WR <= "0";
		REG_PetirocCfg0_REG_CFG1_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG1_WR <= "0";
		REG_PetirocCfg0_REG_CFG2_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG2_WR <= "0";
		REG_PetirocCfg0_REG_CFG3_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG3_WR <= "0";
		REG_PetirocCfg0_REG_CFG4_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG4_WR <= "0";
		REG_PetirocCfg0_REG_CFG5_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG5_WR <= "0";
		REG_PetirocCfg0_REG_CFG6_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG6_WR <= "0";
		REG_PetirocCfg0_REG_CFG7_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG7_WR <= "0";
		REG_PetirocCfg0_REG_CFG8_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG8_WR <= "0";
		REG_PetirocCfg0_REG_CFG9_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG9_WR <= "0";
		REG_PetirocCfg0_REG_CFG10_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG10_WR <= "0";
		REG_PetirocCfg0_REG_CFG11_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG11_WR <= "0";
		REG_PetirocCfg0_REG_CFG12_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG12_WR <= "0";
		REG_PetirocCfg0_REG_CFG13_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG13_WR <= "0";
		REG_PetirocCfg0_REG_CFG14_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG14_WR <= "0";
		REG_PetirocCfg0_REG_CFG15_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG15_WR <= "0";
		REG_PetirocCfg0_REG_CFG16_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG16_WR <= "0";
		REG_PetirocCfg0_REG_CFG17_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG17_WR <= "0";
		REG_PetirocCfg0_REG_CFG18_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG18_WR <= "0";
		REG_PetirocCfg0_REG_CFG19_WR <= (others => '0');
		INT_PetirocCfg0_REG_CFG19_WR <= "0";
		REG_PetirocCfg0_START_REG_CFG_WR <= (others => '0');
		INT_PetirocCfg0_START_REG_CFG_WR <= "0";
		REG_dv_tot_WR <= (others => '0');
		INT_dv_tot_WR <= "0";
		INT_dv_tot_RD <= "0";
	BUS_CP_0_W_INT <= "0";
		INT_CP_0_READ_STATUS_RD <= "0";
		INT_CP_0_READ_VALID_WORDS_RD <= "0";
		REG_CP_0_CONFIG_WR <= (others => '0');
		INT_CP_0_CONFIG_WR <= "0";
	BUS_i2chv_W_INT <= "0";
		REG_i2chv_CTRL_WR <= (others => '0');
		INT_i2chv_CTRL_WR <= "0";
		INT_i2chv_MON_RD <= "0";
	BUS_RateMeter_0_W_INT <= "0";
			
			f_BUS_DATASTROBE_REG <= '0';
            INT_FLASH_CNTR_RD <= "0";
            INT_FLASH_CNTR_RD <= "0";
            INT_FLASH_ADDRESS_WR <= "0";
            INT_FLASH_ADDRESS_RD <= "0";
            INT_Fiforeset_WR <= "0";
            INT_Fiforeset_RD <= "0";
			
			
		elsif rising_edge(clk) then
		INT_c_tot_WR <= "0";
		INT_c_tot_RD <= "0";
		INT_run_time_lsb_WR <= "0";
		INT_run_time_lsb_RD <= "0";
		INT_run_time_msb_WR <= "0";
		INT_run_time_msb_RD <= "0";
		INT_run_start_WR <= "0";
		INT_run_start_RD <= "0";
		INT_sw_trig_freq_WR <= "0";
		INT_sw_trig_freq_RD <= "0";
		INT_tr_sel_WR <= "0";
		INT_tr_sel_RD <= "0";
		INT_e16_WR <= "0";
		INT_e16_RD <= "0";
		INT_evt_ts_msb_WR <= "0";
		INT_evt_ts_msb_RD <= "0";
		INT_evt_ts_lsb_WR <= "0";
		INT_evt_ts_lsb_RD <= "0";
		INT_e15_WR <= "0";
		INT_e15_RD <= "0";
		INT_tr_en_WR <= "0";
		INT_tr_en_RD <= "0";
		INT_fw_ver_WR <= "0";
		INT_fw_ver_RD <= "0";
	BUS_PetirocCfg0_W_INT <= "0";
		INT_PetirocCfg0_REG_CFG0_WR <= "0";
		INT_PetirocCfg0_REG_CFG1_WR <= "0";
		INT_PetirocCfg0_REG_CFG2_WR <= "0";
		INT_PetirocCfg0_REG_CFG3_WR <= "0";
		INT_PetirocCfg0_REG_CFG4_WR <= "0";
		INT_PetirocCfg0_REG_CFG5_WR <= "0";
		INT_PetirocCfg0_REG_CFG6_WR <= "0";
		INT_PetirocCfg0_REG_CFG7_WR <= "0";
		INT_PetirocCfg0_REG_CFG8_WR <= "0";
		INT_PetirocCfg0_REG_CFG9_WR <= "0";
		INT_PetirocCfg0_REG_CFG10_WR <= "0";
		INT_PetirocCfg0_REG_CFG11_WR <= "0";
		INT_PetirocCfg0_REG_CFG12_WR <= "0";
		INT_PetirocCfg0_REG_CFG13_WR <= "0";
		INT_PetirocCfg0_REG_CFG14_WR <= "0";
		INT_PetirocCfg0_REG_CFG15_WR <= "0";
		INT_PetirocCfg0_REG_CFG16_WR <= "0";
		INT_PetirocCfg0_REG_CFG17_WR <= "0";
		INT_PetirocCfg0_REG_CFG18_WR <= "0";
		INT_PetirocCfg0_REG_CFG19_WR <= "0";
		INT_PetirocCfg0_START_REG_CFG_WR <= "0";
		INT_dv_tot_WR <= "0";
		INT_dv_tot_RD <= "0";
	BUS_CP_0_W_INT <= "0";
		INT_CP_0_READ_STATUS_RD <= "0";
		INT_CP_0_READ_VALID_WORDS_RD <= "0";
		INT_CP_0_CONFIG_WR <= "0";
	BUS_i2chv_W_INT <= "0";
		INT_i2chv_CTRL_WR <= "0";
		INT_i2chv_MON_RD <= "0";
	BUS_RateMeter_0_W_INT <= "0";
  
            f_BUS_DATASTROBE_REG <= '0';
            INT_FLASH_CNTR_RD <= "0";
            INT_FLASH_CNTR_RD <= "0";
            INT_FLASH_ADDRESS_WR <= "0";
            INT_FLASH_ADDRESS_RD <= "0";
            INT_Fiforeset_WR <= "0";
            INT_Fiforeset_RD <= "0";
			
            
           if f_BUS_INT_WR = '1' then
    
	           if addr = x"FFFFF908"  then
                REG_Fiforeset_WR    <= wreg; 
                INT_Fiforeset_WR <= "1"; 
				end if;		
			
               if addr = x"FFFEF000"  then
                   REG_FLASH_CNTR_WR     <= wreg; 
                   INT_FLASH_CNTR_WR <= "1"; 
               end if; 
    
               if addr = x"FFFEF001"  then
                   REG_FLASH_ADDRESS_WR     <= wreg; 
                   INT_FLASH_ADDRESS_WR <= "1"; 
               end if;                           
    
		if addr = x"00000102" then
			REG_c_tot_WR <= wreg; 
			INT_c_tot_WR <= "1"; 
		end if;
		if addr = x"00000101" then
			REG_run_time_lsb_WR <= wreg; 
			INT_run_time_lsb_WR <= "1"; 
		end if;
		if addr = x"00000100" then
			REG_run_time_msb_WR <= wreg; 
			INT_run_time_msb_WR <= "1"; 
		end if;
		if addr = x"00000000" then
			REG_run_start_WR <= wreg; 
			INT_run_start_WR <= "1"; 
		end if;
		if addr = x"00000003" then
			REG_sw_trig_freq_WR <= wreg; 
			INT_sw_trig_freq_WR <= "1"; 
		end if;
		if addr = x"00000001" then
			REG_tr_sel_WR <= wreg; 
			INT_tr_sel_WR <= "1"; 
		end if;
		if addr = x"00000106" then
			REG_e16_WR <= wreg; 
			INT_e16_WR <= "1"; 
		end if;
		if addr = x"00000104" then
			REG_evt_ts_msb_WR <= wreg; 
			INT_evt_ts_msb_WR <= "1"; 
		end if;
		if addr = x"00000105" then
			REG_evt_ts_lsb_WR <= wreg; 
			INT_evt_ts_lsb_WR <= "1"; 
		end if;
		if addr = x"00000107" then
			REG_e15_WR <= wreg; 
			INT_e15_WR <= "1"; 
		end if;
		if addr = x"00000002" then
			REG_tr_en_WR <= wreg; 
			INT_tr_en_WR <= "1"; 
		end if;
		if addr = x"00000400" then
			REG_fw_ver_WR <= wreg; 
			INT_fw_ver_WR <= "1"; 
		end if;
		If addr >= x"00002000" And addr < x"00002001" Then
			BUS_PetirocCfg0_WRITE_DATA <= wreg; 
			BUS_PetirocCfg0_W_INT <= "1"; 
		End If;
		if addr = x"00002001" then
			REG_PetirocCfg0_REG_CFG0_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG0_WR <= "1"; 
		end if;
		if addr = x"00002002" then
			REG_PetirocCfg0_REG_CFG1_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG1_WR <= "1"; 
		end if;
		if addr = x"00002003" then
			REG_PetirocCfg0_REG_CFG2_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG2_WR <= "1"; 
		end if;
		if addr = x"00002004" then
			REG_PetirocCfg0_REG_CFG3_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG3_WR <= "1"; 
		end if;
		if addr = x"00002005" then
			REG_PetirocCfg0_REG_CFG4_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG4_WR <= "1"; 
		end if;
		if addr = x"00002006" then
			REG_PetirocCfg0_REG_CFG5_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG5_WR <= "1"; 
		end if;
		if addr = x"00002007" then
			REG_PetirocCfg0_REG_CFG6_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG6_WR <= "1"; 
		end if;
		if addr = x"00002008" then
			REG_PetirocCfg0_REG_CFG7_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG7_WR <= "1"; 
		end if;
		if addr = x"00002009" then
			REG_PetirocCfg0_REG_CFG8_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG8_WR <= "1"; 
		end if;
		if addr = x"0000200A" then
			REG_PetirocCfg0_REG_CFG9_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG9_WR <= "1"; 
		end if;
		if addr = x"0000200B" then
			REG_PetirocCfg0_REG_CFG10_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG10_WR <= "1"; 
		end if;
		if addr = x"0000200C" then
			REG_PetirocCfg0_REG_CFG11_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG11_WR <= "1"; 
		end if;
		if addr = x"0000200D" then
			REG_PetirocCfg0_REG_CFG12_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG12_WR <= "1"; 
		end if;
		if addr = x"0000200E" then
			REG_PetirocCfg0_REG_CFG13_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG13_WR <= "1"; 
		end if;
		if addr = x"0000200F" then
			REG_PetirocCfg0_REG_CFG14_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG14_WR <= "1"; 
		end if;
		if addr = x"00002010" then
			REG_PetirocCfg0_REG_CFG15_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG15_WR <= "1"; 
		end if;
		if addr = x"00002011" then
			REG_PetirocCfg0_REG_CFG16_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG16_WR <= "1"; 
		end if;
		if addr = x"00002012" then
			REG_PetirocCfg0_REG_CFG17_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG17_WR <= "1"; 
		end if;
		if addr = x"00002013" then
			REG_PetirocCfg0_REG_CFG18_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG18_WR <= "1"; 
		end if;
		if addr = x"00002014" then
			REG_PetirocCfg0_REG_CFG19_WR <= wreg; 
			INT_PetirocCfg0_REG_CFG19_WR <= "1"; 
		end if;
		if addr = x"00002015" then
			REG_PetirocCfg0_START_REG_CFG_WR <= wreg; 
			INT_PetirocCfg0_START_REG_CFG_WR <= "1"; 
		end if;
		if addr = x"00000103" then
			REG_dv_tot_WR <= wreg; 
			INT_dv_tot_WR <= "1"; 
		end if;
		If addr >= x"00003000" And addr < x"00003001" Then
			BUS_CP_0_WRITE_DATA <= wreg; 
			BUS_CP_0_W_INT <= "1"; 
		End If;
		if addr = x"00003003" then
			REG_CP_0_CONFIG_WR <= wreg; 
			INT_CP_0_CONFIG_WR <= "1"; 
		end if;
		If addr >= x"00001000" And addr < x"00001001" Then
			BUS_i2chv_WRITE_DATA <= wreg; 
			BUS_i2chv_W_INT <= "1"; 
		End If;
		if addr = x"00001001" then
			REG_i2chv_CTRL_WR <= wreg; 
			INT_i2chv_CTRL_WR <= "1"; 
		end if;
		If addr >= x"00005000" And addr < x"00015000" Then
			BUS_RateMeter_0_WRITE_DATA <= wreg; 
			BUS_RateMeter_0_W_INT <= "1"; 
		End If;

            end if;
    
    
            if f_BUS_INT_RD = '1' then
                f_BUS_DATASTROBE_REG <= '1';
                rreg := x"DEADBEEF";

		if addr = x"00000102" then
			rreg := REG_c_tot_RD; 
		End If;
		if addr = x"00000101" then
			rreg := REG_run_time_lsb_RD; 
		End If;
		if addr = x"00000100" then
			rreg := REG_run_time_msb_RD; 
		End If;
		if addr = x"00000000" then
			rreg := REG_run_start_RD; 
		End If;
		if addr = x"00000003" then
			rreg := REG_sw_trig_freq_RD; 
		End If;
		if addr = x"00000001" then
			rreg := REG_tr_sel_RD; 
		End If;
		if addr = x"00000106" then
			rreg := REG_e16_RD; 
		End If;
		if addr = x"00000104" then
			rreg := REG_evt_ts_msb_RD; 
		End If;
		if addr = x"00000105" then
			rreg := REG_evt_ts_lsb_RD; 
		End If;
		if addr = x"00000107" then
			rreg := REG_e15_RD; 
		End If;
		if addr = x"00000002" then
			rreg := REG_tr_en_RD; 
		End If;
		if addr = x"00000400" then
			rreg := REG_fw_ver_RD; 
		End If;
		if addr = x"00000103" then
			rreg := REG_dv_tot_RD; 
		End If;
		if addr = x"00003001" then
			rreg := REG_CP_0_READ_STATUS_RD; 
		End If;
		if addr = x"00003002" then
			rreg := REG_CP_0_READ_VALID_WORDS_RD; 
		End If;
		if addr = x"00001002" then
			rreg := REG_i2chv_MON_RD; 
		End If;
	
               
                if addr = x"FFFFF908" then
                    rreg := REG_Fiforeset_RD;
                    INT_Fiforeset_RD <= "1"; 
                End If;

				
                if addr = x"FFFFFFFF" then
                    rreg := x"00555000"; 
                End If;    
                if addr = x"FFFFFFFE" then
                    rreg := x"18070300"; 
                End If; 
                
                if addr = x"FFFEF000" then
                    rreg := REG_FLASH_CNTR_RD;
                    INT_FLASH_CNTR_RD <= "1"; 
                End If;    
                if addr = x"FFFEF001" then
                    rreg := REG_FLASH_ADDRESS_RD;
                    INT_FLASH_CNTR_RD <= "1"; 
                End If;                   
                if addr = x"FFFEFFFF" then
                    rreg := x"1234ABBA";
                    INT_FLASH_CNTR_RD <= "1"; 
                End If;                
            
                if addr = x"FFFFFFFA" then
                    rreg := REG_FIRMWARE_BUILD;
                End If;                  
           
                if addr = x"FFFEFFFC" then
                    rreg := x"20180925";
                End If;

                if addr = x"FFFFFFFB" then
                    rreg := x"AAAA5550";
                End If;				
                
				if addr = x"FFFFFFFC" then
                    rreg := REG_UNIQUE_RD;
                End If;				
				
                f_BUS_DATA_RD_REG <= rreg;
            end if;

		end if;
	end process;
	

end Behavioral;

