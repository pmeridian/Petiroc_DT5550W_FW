
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    use IEEE.STD_LOGIC_MISC.ALL;

    use ieee.math_real.all;
    Library xpm;
    use xpm.vcomponents.all;

entity U79_custompacket is
  Generic (	wordWidth : integer := 32;
			memLength : integer := 4096);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    	IN_1 : STD_LOGIC_VECTOR(31 downto 0);
	IN_2 : STD_LOGIC_VECTOR(31 downto 0);
	IN_3 : STD_LOGIC_VECTOR(31 downto 0);
	IN_4 : STD_LOGIC_VECTOR(15 downto 0);
	IN_5 : STD_LOGIC_VECTOR(15 downto 0);

	
	TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	SYNC_TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
	READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
	READ_RD_INT: IN STD_LOGIC_VECTOR (0 downto 0);
	READ_STATUS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	READ_VALID_WORDS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	CONFIG : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                              
    RUN: OUT STD_LOGIC_VECTOR (0 downto 0);
	BUSY: OUT STD_LOGIC_VECTOR (0 downto 0);
	FIFO_FULL: OUT STD_LOGIC_VECTOR (0 downto 0)
	);
end;
    architecture Behavioral of  U79_custompacket  is
    constant MaxPacketSize : integer := 7;
	constant TotalWords : integer := memLength;
	
	constant busWidthWrite : integer := 32;
	constant busWidthRead : integer := 32;
	constant wBits : integer := integer(ceil(log2(real(TotalWords))));
	constant rBits : integer := integer(ceil(log2(real(TotalWords * busWidthWrite/busWidthRead))));

	constant MemLogLen : integer := integer(ceil(log2(real(memLength))));
	
    	signal lIN_1 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_2 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_3 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_4 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_5 : STD_LOGIC_VECTOR(15 downto 0);


	signal FIFO_PORT_IN : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FULL_IN : STD_LOGIC := '0';
	signal FIFO_EMPTY  : STD_LOGIC := '0';
	signal FIFO_RD  : STD_LOGIC := '0';
	signal FIFO_WE  : STD_LOGIC := '0';
	signal FIFO_PORT_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FLUSH : STD_LOGIC := '0';
	
	signal SMSI : integer range 0 to 7 + 10 := 0;
	signal COUNTER_IN : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBAL : std_logic_vector (31 downto 0);
	signal TIMESTAMP : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBALs : std_logic_vector (31 downto 0);
	signal TIMESTAMPs : std_logic_vector (31 downto 0);

	signal oExtSignal : std_logic;
	signal iExtSignal : std_logic;

	signal iTrig : std_logic;
	signal oTrig : std_logic;

    signal AVAL_WORD : std_logic_vector (rBits-1 downto 0) := (others => '0');
    begin

    
    xpm_fifo_async_inst : xpm_fifo_async
    generic map (
	    FIFO_MEMORY_TYPE => "auto", --string; "auto", "block", or "distributed";
	    ECC_MODE => "no_ecc", --string; "no_ecc" or "en_ecc";
	    RELATED_CLOCKS => 0, --positive integer; 0 or 1
	    FIFO_WRITE_DEPTH => TotalWords , --positive integer
	    WRITE_DATA_WIDTH => busWidthWrite, --positive integer
	    WR_DATA_COUNT_WIDTH => wBits, --positive integer
	    PROG_FULL_THRESH => TotalWords-MaxPacketSize, --positive integer
	    FULL_RESET_VALUE => 0, --positive integer; 0 or 1;
	    READ_MODE => "std", --string; "std" or "fwft";
	    FIFO_READ_LATENCY => 1, --positive integer;
	    READ_DATA_WIDTH => busWidthRead, --positive integer
	    RD_DATA_COUNT_WIDTH => rBits, --positive integer
	    PROG_EMPTY_THRESH => 3, --positive integer
	    DOUT_RESET_VALUE => "0", --string
	    CDC_SYNC_STAGES => 2, --positive integer
	    WAKEUP_TIME => 0 --positive integer; 0 or 2;
    )
    port map (
	    sleep => '0',
	    rst => FIFO_FLUSH,
	    wr_clk => CLK_WRITE(0),
	    wr_en => FIFO_WE,
	    din => FIFO_PORT_IN,
	    full => open,
	    overflow => open,
	    wr_rst_busy => open,
	    rd_clk => CLK_READ(0),
	    rd_en => FIFO_RD,
	    dout => FIFO_PORT_OUT,
	    empty => open,
	    underflow => open,
	    rd_rst_busy => open,
	    prog_full => FIFO_FULL_IN,
	    wr_data_count => open,
	    prog_empty => FIFO_EMPTY,
	    rd_data_count => AVAL_WORD,
	    injectsbiterr => '0',
	    injectdbiterr => '0',
	    sbiterr => open,
	    dbiterr => open
    );

    READ_VALID_WORDS <= ext(AVAL_WORD,32);

	READ_STATUS(1) <= CONFIG (0);
	READ_STATUS(0) <= FIFO_EMPTY;
	READ_STATUS(2) <= FIFO_FULL_IN;
    READ_STATUS(31 downto 8) <= ext(AVAL_WORD,24);

	READ_DATAVALID(0) <= not FIFO_EMPTY;
	READ_DATA <= FIFO_PORT_OUT;
	FIFO_RD <= READ_RD_INT(0);
	FIFO_FULL(0) <= FIFO_FULL_IN;
	
	timeStampProc : process(SYNC_CLK(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN_GLOBAL <= (others => '0');
			TIMESTAMP <= (others => '0');
		elsif rising_edge(SYNC_CLK(0)) then
			TIMESTAMP <= TIMESTAMP+1;
			iExtSignal <= SYNC_TRIG(0);
			oExtSignal <= iExtSignal;
			if iExtSignal = '1' and oExtSignal = '0' then
				COUNTER_IN_GLOBAL <= COUNTER_IN_GLOBAL +1;
			end if;
			
		end if;
	end process;
	
		
	xpm_RunTimer: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => TIMESTAMP,
		dest_clk => CLK_WRITE(0),
		dest_out => TIMESTAMPs
	  );

	xpm_GlobalCounter: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => COUNTER_IN_GLOBAL,
		dest_clk => CLK_WRITE(0),
		dest_out => COUNTER_IN_GLOBALs
	  );

	  
	
	TransferProcess : process(CLK_WRITE(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN <= (others => '0');
			FIFO_FLUSH <= '1';
			FIFO_WE <= '0';
            BUSY(0) <= '1';
            RUN(0) <= '0';
		elsif rising_edge(CLK_WRITE(0)) then
			FIFO_FLUSH <= CONFIG (2);
			FIFO_WE <= '0';
			iTrig <= TRIG(0);
			oTrig <= iTrig;
            
            RUN(0) <= CONFIG (0);

			case SMSI is
				when 0 =>
					BUSY(0) <= (not CONFIG (0)) or  FIFO_FULL_IN ;
					if iTrig = '1' and oTrig = '0' and CONFIG (0) = '1' and FIFO_FULL_IN = '0' then
						SMSI <= 1;
						COUNTER_IN <= COUNTER_IN +1;
						BUSY <= "1";
lIN_1 <= IN_1;
lIN_2 <= IN_2;
lIN_3 <= IN_3;
lIN_4 <= IN_4;
lIN_5 <= IN_5;

					end if;
						 when 1 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= x"08000000";
FIFO_WE <= '1';
SMSI <= 2;
		 when 2 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_1(31 downto 0);
FIFO_WE <= '1';
SMSI <= 3;
		 when 3 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_2(31 downto 0);
FIFO_WE <= '1';
SMSI <= 4;
		 when 4 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_3(31 downto 0);
FIFO_WE <= '1';
SMSI <= 5;
		 when 5 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_4(15 downto 0);
FIFO_WE <= '1';
SMSI <= 6;
		 FIFO_PORT_IN(15 downto 0) <= lIN_5(15 downto 0);
FIFO_WE <= '1';
SMSI <= 6;
		 when 6 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= conv_std_logic_vector(7,32);
FIFO_WE <= '1';
SMSI <= 7;
		 when 7 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= x"08000001";
FIFO_WE <= '1';
SMSI <= 0;

				
				when others =>
					SMSI <= 0;
			end case;
		end if;
	end process;
	
	

end Behavioral;

	
    