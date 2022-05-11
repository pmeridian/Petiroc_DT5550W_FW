
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.

Library UNISIM;
use UNISIM.vcomponents.all;
entity PetirocSlowControl is
    Generic (   
				CfgDefault : std_logic_vector(639 downto 0);
				CfgMonitorDefault : std_logic_vector(199 downto 0);
				DoStartupSetup : std_logic_vector(0 downto 0) := "0";
                Halfbit : integer := 10000);
    Port (    
            reset : in  STD_LOGIC;
		    clk : in STD_LOGIC;
		    PETIROC_CLK : out STD_LOGIC;
		    PETIROC_MOSI : out STD_LOGIC;
		    PETIROC_SLOAD : out STD_LOGIC;
		    PETIROC_RESETB : out STD_LOGIC;
		    PETIROC_SELECT : out STD_LOGIC;
			
			ASIC_CONFIGURATION : in std_logic_vector(639 downto 0);
			ASIC_MONITOR_CONFIGURATION : in std_logic_vector(199 downto 0);
			LOAD_CFG : in std_logic_vector(0 downto 0);
			LOAD_MONITOR : in std_logic_vector(0 downto 0);
			START_CFG : in std_logic_vector(0 downto 0);
			START_MONITOR : in std_logic_vector(0 downto 0);
			
			BUSY : out STD_LOGIC;
            REG_CFG0 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG1 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG2 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG3 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG4 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG5 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG6 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG7 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG8 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG9 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG10 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG11 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG12 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG13 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG14 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG15 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG16 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG17 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG18 : in STD_LOGIC_VECTOR (31 downto 0);
			REG_CFG19 : in STD_LOGIC_VECTOR (31 downto 0);
			START_REG_CFG : in STD_LOGIC_VECTOR (31 downto 0)
			
            
			  );
end PetirocSlowControl;


  
	

architecture Behavioral of PetirocSlowControl is
    signal ASIC_BITSTREAM : std_logic_vector (639 downto 0) := "1101101101101010111000101010100100110101100101100110000010010100010010111110001101001001100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000100000111111111111111111111111111111110000100011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000011000000001000000011111111111000000011111111101000000011111111111111111111111111111111";--(others => '0');
	signal ASIC_BITSTREAM_CFG : std_logic_vector (639 downto 0) := CfgDefault;
	signal ASIC_BITSTREAM_MONITOR : std_logic_vector (199 downto 0) := CfgMonitorDefault;
    signal ASIC_BIT_COUNT : integer := 0;
    signal startProg : std_logic := '0';
    signal startProgMonitor : std_logic := '0';
    signal ostartProg : std_logic := '0';
    signal ProgSM : std_logic_vector (3 downto 0) := X"0";
    signal ProgSMp : std_logic_vector (3 downto 0) := X"0";
    signal TimeCounter : integer;
	signal oSTART_CFG :  STD_LOGIC_VECTOR (1 downto 0) := "00";
	signal iSTART_CFG :  STD_LOGIC_VECTOR (1 downto 0) := "00";


	signal olSTART_CFG :  STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal ilSTART_CFG :  STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal olSTART_MON :  STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal ilSTART_MON :  STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	signal delayStartup :  STD_LOGIC_VECTOR (23 downto 0) := x"FFFFFF";
	signal startUpProg : std_logic := '0';
	signal startUpProg_done : std_logic := '0';
begin

    prog_asic : process (clk)
    begin
		if reset = '1'  then
			startUpProg_done <= '0';
			delayStartup <= x"FFFFFF";
			startUpProg <= '0';
			BUSY <= '0';
        elsif rising_edge(clk) then
			if DoStartupSetup = "1" then
				if delayStartup = x"000000" then
					startUpProg <= '1';
				else
					delayStartup <= delayStartup -1;
				end if;
			end if;
			
            case ProgSM is
                when x"0" =>
					BUSY <= '0';
                    ASIC_BIT_COUNT <= 0;
                    PETIROC_CLK <= '0';
                    PETIROC_SELECT <='1';                    
                    if startProg = '1' or (startUpProg_done = '0' and startUpProg='1') then
						startUpProg_done <= '1';
                        ASIC_BIT_COUNT <= 639;
						ASIC_BITSTREAM <= ASIC_BITSTREAM_CFG;
                        ProgSMp <= X"1";
                        ProgSM <= x"F";
                        PETIROC_RESETB <='0';
                        PETIROC_SLOAD <= '0';
                        PETIROC_CLK <= '0';
                        TimeCounter <= 2*Halfbit;
						BUSY <= '1';
                    end if;

                    if startProgMonitor = '1'  then
                        PETIROC_SELECT <='0';                               --enable probe register
                        ASIC_BIT_COUNT <= 199;
						ASIC_BITSTREAM(199 downto 0) <= ASIC_BITSTREAM_MONITOR;
                        ProgSMp <= X"1";
                        ProgSM <= x"F";
                        PETIROC_RESETB <='0';
                        PETIROC_SLOAD <= '0';
                        PETIROC_CLK <= '0';
                        TimeCounter <= 2*Halfbit;
						BUSY <= '1';
                    end if;

                
                when x"1" =>
                    PETIROC_RESETB <='1';
                    TimeCounter <= 10*Halfbit;
                    ProgSMp <= X"2";
                    ProgSM <= x"F";
                        
                when x"2" =>
                    PETIROC_CLK <= '0';
                    PETIROC_MOSI <= ASIC_BITSTREAM(ASIC_BIT_COUNT);
                    TimeCounter <= Halfbit;
                    ProgSMp <= X"3";
                    ProgSM <= x"F";
                        
                when x"3" =>
                    PETIROC_CLK <= '1';
                    TimeCounter <= Halfbit;
                    ProgSMp <= X"4";
                    ProgSM <= x"F";
                
                when x"4" =>
                    PETIROC_CLK <= '0';
                    ASIC_BIT_COUNT <= ASIC_BIT_COUNT -1;
                    if ASIC_BIT_COUNT = 0 then
                        TimeCounter <= 4*Halfbit;
                        ProgSMp <= X"5";
                        ProgSM <= x"F";                       
                    else
                        ProgSM <= x"2";
                    end if;     
                    
                when x"5" =>
                    PETIROC_SLOAD <= '1';
                    TimeCounter <= 4*Halfbit;
                    ProgSMp <= X"6";
                    ProgSM <= x"F";  
                
                when x"6" =>
                    PETIROC_SLOAD <= '0';
                    TimeCounter <= 4*Halfbit;
                    ProgSMp <= X"0";
                    ProgSM <= x"F";  

                                                                             
                when x"F" =>
                    if TimeCounter = 0 then
                        ProgSM <= ProgSMp;
                    else
                        TimeCounter <= TimeCounter -1;
                    end if;
                    
                when others =>
             end case;
        end if;
    end process;

 bus_control : process (CLK)
    begin
        if rising_edge(CLK) then
           startProg <= '0';
           startProgMonitor <= '0';
		   iSTART_CFG <= START_REG_CFG(1 downto 0);
		   oSTART_CFG <= iSTART_CFG;
			ASIC_BITSTREAM_CFG <= CfgDefault;
           ASIC_BITSTREAM_MONITOR <= CfgMonitorDefault;
		   
		   if iSTART_CFG = "01" and oSTART_CFG /= "01" then
				ASIC_BITSTREAM_CFG((32*(0+1)-1) downto 32*0) <= REG_CFG0;
				ASIC_BITSTREAM_CFG((32*(1+1)-1) downto 32*1) <= REG_CFG1;
				ASIC_BITSTREAM_CFG((32*(2+1)-1) downto 32*2) <= REG_CFG2;
				ASIC_BITSTREAM_CFG((32*(3+1)-1) downto 32*3) <= REG_CFG3;
				ASIC_BITSTREAM_CFG((32*(4+1)-1) downto 32*4) <= REG_CFG4;
				ASIC_BITSTREAM_CFG((32*(5+1)-1) downto 32*5) <= REG_CFG5;
				ASIC_BITSTREAM_CFG((32*(6+1)-1) downto 32*6) <= REG_CFG6;
				ASIC_BITSTREAM_CFG((32*(7+1)-1) downto 32*7) <= REG_CFG7;
				ASIC_BITSTREAM_CFG((32*(8+1)-1) downto 32*8) <= REG_CFG8;
				ASIC_BITSTREAM_CFG((32*(9+1)-1) downto 32*9) <= REG_CFG9;
				ASIC_BITSTREAM_CFG((32*(10+1)-1) downto 32*10) <= REG_CFG10;
				ASIC_BITSTREAM_CFG((32*(11+1)-1) downto 32*11) <= REG_CFG11;
				ASIC_BITSTREAM_CFG((32*(12+1)-1) downto 32*12) <= REG_CFG12;
				ASIC_BITSTREAM_CFG((32*(13+1)-1) downto 32*13) <= REG_CFG13;
				ASIC_BITSTREAM_CFG((32*(14+1)-1) downto 32*14) <= REG_CFG14;
				ASIC_BITSTREAM_CFG((32*(15+1)-1) downto 32*15) <= REG_CFG15;
				ASIC_BITSTREAM_CFG((32*(16+1)-1) downto 32*16) <= REG_CFG16;
				ASIC_BITSTREAM_CFG((32*(17+1)-1) downto 32*17) <= REG_CFG17;
				ASIC_BITSTREAM_CFG((32*(18+1)-1) downto 32*18) <= REG_CFG18;
				ASIC_BITSTREAM_CFG((32*(19+1)-1) downto 32*19) <= REG_CFG19;		
				startProg <= '1';
		   end if;
		   
			if iSTART_CFG = "10" and oSTART_CFG /= "10" then
				ASIC_BITSTREAM_MONITOR((32*(0+1)-1) downto 32*0) <= REG_CFG0;
				ASIC_BITSTREAM_MONITOR((32*(1+1)-1) downto 32*1) <= REG_CFG1;
				ASIC_BITSTREAM_MONITOR((32*(2+1)-1) downto 32*2) <= REG_CFG2;
				ASIC_BITSTREAM_MONITOR((32*(3+1)-1) downto 32*3) <= REG_CFG3;
				ASIC_BITSTREAM_MONITOR((32*(4+1)-1) downto 32*4) <= REG_CFG4;
				ASIC_BITSTREAM_MONITOR((32*(5+1)-1) downto 32*5) <= REG_CFG5;
				ASIC_BITSTREAM_MONITOR(199 downto 32*6) <= REG_CFG6(7 downto 0);
				startProgMonitor <= '1';
		   end if;		   

			if LOAD_CFG = "1" then
				ASIC_BITSTREAM_CFG <= ASIC_CONFIGURATION;
			end if;

			if LOAD_MONITOR = "1" then
				ASIC_BITSTREAM_MONITOR <= ASIC_MONITOR_CONFIGURATION;
			end if;
			
			olSTART_CFG <= ilSTART_CFG;
			ilSTART_CFG <= START_CFG;
			olSTART_MON <= ilSTART_MON;
			ilSTART_MON <= START_MONITOR;

			if olSTART_CFG = "1" and ilSTART_CFG = "0" then
				startProg <= '1';
			end if;
			
			if olSTART_MON = "1" and ilSTART_MON = "0" then
				startProgMonitor <= '1';
			end if;
		
	    end if;
	end process;
	

end Behavioral;


