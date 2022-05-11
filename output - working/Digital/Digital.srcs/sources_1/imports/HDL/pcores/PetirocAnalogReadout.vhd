----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2018 17:52:01
-- Design Name: 
-- Module Name: PetirocAnalogMonitor - Behavioral
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
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PetirocAnalogReadout is
    Generic (CLKDIV : integer := 160);
    Port (  
            clk : in STD_LOGIC;
			reject_data : in std_logic;
			reset : in STD_LOGIC;
            TRIG : in STD_LOGIC;
			ADC_IN : in STD_LOGIC_VECTOR (15 downto 0);
			CHARGE_HIT_in : in STD_LOGIC;
            chrage_srin_a : out STD_LOGIC;
            chrage_clk_a : out STD_LOGIC;
            raz_chn : out STD_LOGIC;
			val_evnt : out STD_LOGIC;
			
			M_ENERGY : out STD_LOGIC_VECTOR (15 downto 0);
			M_CLK : out STD_LOGIC_VECTOR (0 downto 0);
			M_DIN : out STD_LOGIC_VECTOR (0 downto 0);
			
			S_CHID : out STD_LOGIC_VECTOR (4 downto 0);
			S_ENERGY : out STD_LOGIC_VECTOR (15 downto 0);
			S_HIT : out STD_LOGIC_VECTOR (0 downto 0);
			S_DV : out STD_LOGIC_VECTOR (0 downto 0);

			P_ENERGY_0 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_0 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_1 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_1 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_2 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_2 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_3 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_3 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_4 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_4 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_5 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_5 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_6 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_6 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_7 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_7 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_8 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_8 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_9 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_9 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_10 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_10 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_11 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_11 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_12 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_12 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_13 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_13 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_14 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_14 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_15 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_15 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_16 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_16 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_17 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_17 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_18 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_18 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_19 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_19 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_20 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_20 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_21 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_21 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_22 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_22 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_23 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_23 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_24 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_24 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_25 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_25 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_26 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_26 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_27 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_27 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_28 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_28 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_29 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_29 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_30 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_30 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_31 : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_31 : out STD_LOGIC_VECTOR (0 downto 0);			
			P_DV : out STD_LOGIC_VECTOR (0 downto 0);
			
			TS_IN : in STD_LOGIC_VECTOR (63 downto 0);
			TS0_IN : in STD_LOGIC_VECTOR (31 downto 0);
			TS_OUT : out STD_LOGIC_VECTOR (63 downto 0);
			TS0_OUT : out STD_LOGIC_VECTOR (31 downto 0);

			BUSY : out STD_LOGIC_VECTOR (0 downto 0)
    );
end PetirocAnalogReadout;

architecture Behavioral of PetirocAnalogReadout is
    
    signal iEnable : std_logic;
    signal iAnalogOnly : std_logic;
	signal start_c_raz : std_logic_vector (7 downto 0) := x"FF";
	type BUFFER_AN is array (0 to 35) of std_logic_vector(15 downto 0);
	signal BUFFER_DATA : BUFFER_AN;
	signal BUFFER_HIT : std_logic_vector (34 downto 0);
	signal I : integer range 0 to 35 := 0;
	signal  ADC_FILTERED : std_logic_vector(15 downto 0);
	
	signal ichrage_srin_a: STD_LOGIC;
    signal ichrage_clk_a : STD_LOGIC;

begin
    chrage_srin_a <= ichrage_srin_a;
    chrage_clk_a <= ichrage_clk_a;
    M_ENERGY <= ADC_FILTERED;
    
    M_CLK(0) <= ichrage_clk_a;
    M_DIN(0) <= ichrage_srin_a;

 ANALOG_READOUT : block
        signal BLKSM : std_logic_vector (3 downto 0) := x"0";
        signal iA_trigger_logic : std_logic;
        signal oA_trigger_logic : std_logic;
        signal counter : integer;
        signal bitcounter : integer;
        
        signal filterMem : BUFFER_AN;
        signal accumulator : std_logic_vector (23 downto 0) := (others => '0');
        signal skip : std_logic := '0';
    begin
        ANALOG_SM : process(clk)
        begin
			if reset = '1' then
				start_c_raz <= x"1F";
				BLKSM <= x"0";
				P_DV <= "0";
				S_DV <= "0";
				BUSY <= "0";	
				ichrage_srin_a <= '0';
                ichrage_clk_a  <= '0';
				raz_chn <= '1';
				val_evnt <= '0';			
				accumulator <= (others => '0');	
            elsif rising_edge(clk) then
				P_DV <= "0";
                            S_DV <= "0";
                            
                            if start_c_raz = x"00" then
                                    raz_chn <= '1';
                                    val_evnt <= '1';
                            else
                                    if start_c_raz = x"1F" then
                                        raz_chn <= '1';
                                        val_evnt <= '0';
                                    else
                                        if start_c_raz = x"15" then
                                            raz_chn <= '0';
                                        else
                                            if start_c_raz = x"7" then
                                                raz_chn <= '1';
                                            end if;
                                        end if;
                                    end if;
                                        start_c_raz <= start_c_raz -1; 
                            end if;
                            iA_trigger_logic <= TRIG;
                            oA_trigger_logic <= iA_trigger_logic;
                    
                    filterMem(0) <= x"3FFF"-ADC_IN;
                    for Z in 1 to 32 loop
                        filterMem(Z) <= filterMem(Z-1);
                    end loop;
                    accumulator <= accumulator + ext(filterMem(0),24) - ext(filterMem(31),24);  
                    ADC_FILTERED <=  accumulator(16+5-1 downto 5);
                    case BLKSM is
                        when x"0" =>
                            BUSY <= "0";
                            if iA_trigger_logic = '1' and oA_trigger_logic = '0'  then
                                BUSY <= "1";
                                BLKSM <= x"1";
                                ichrage_srin_a <= '1';
                                ichrage_clk_a  <= '0';
                                counter <= CLKDIV;
                                bitcounter <= 35;
                                I <= 0;
                                skip <= '1';
								TS0_OUT <= TS0_IN;
								TS_OUT <= TS_IN;

                            end if;
                        when x"1" =>
                            if counter = 0 then
                                ichrage_clk_a <= '1';
                                counter <= CLKDIV;
                                BLKSM <= x"2";
                            else
                                counter <= counter -1;
                            end if; 
                            
                            if counter = 1 then                        --Campiona i dati analogici poco prima del bit successivo
                                if skip = '0' then
                                    BUFFER_DATA(I) <= ADC_FILTERED;
                                    BUFFER_HIT(I) <= CHARGE_HIT_in;
                                    I <= I + 1;
                                    if I < 32 then 
                                        S_ENERGY <= ADC_FILTERED;
                                        S_HIT(0) <= CHARGE_HIT_in;
                                        S_CHID <= conv_std_logic_vector(I,5);
                                        S_DV <= "1";
                                    end if;
                                else
                                    skip <= '0';
                                end if;
                            end if;                            
                            
                        when x"2" =>
                            if counter = 0 then
                                ichrage_clk_a <= '0';
                                counter <= CLKDIV;
                                BLKSM <= x"3";
                            else
                                counter <= counter -1;
                            end if; 
                        

                            
                        when x"3" =>
                            ichrage_srin_a <= '0';
                            if bitcounter = 0 then
                                BLKSM <= x"0";
                                start_c_raz <= x"1F";
                                
                                P_ENERGY_0 <= BUFFER_DATA(0);
                                P_HIT_0(0) <= BUFFER_HIT(0);
                                P_ENERGY_1 <= BUFFER_DATA(1);
                                P_HIT_1(0) <= BUFFER_HIT(1);
                                P_ENERGY_2 <= BUFFER_DATA(2);
                                P_HIT_2(0) <= BUFFER_HIT(2);
                                P_ENERGY_3 <= BUFFER_DATA(3);
                                P_HIT_3(0) <= BUFFER_HIT(3);
                                P_ENERGY_4 <= BUFFER_DATA(4);
                                P_HIT_4(0) <= BUFFER_HIT(4);
                                P_ENERGY_5 <= BUFFER_DATA(5);
                                P_HIT_5(0) <= BUFFER_HIT(5);
                                P_ENERGY_6 <= BUFFER_DATA(6);
                                P_HIT_6(0) <= BUFFER_HIT(6);
                                P_ENERGY_7 <= BUFFER_DATA(7);
                                P_HIT_7(0) <= BUFFER_HIT(7);
                                P_ENERGY_8 <= BUFFER_DATA(8);
                                P_HIT_8(0) <= BUFFER_HIT(8);
                                P_ENERGY_9 <= BUFFER_DATA(9);
                                P_HIT_9(0) <= BUFFER_HIT(9);
                                P_ENERGY_10 <= BUFFER_DATA(10);
                                P_HIT_10(0) <= BUFFER_HIT(10);
                                P_ENERGY_11 <= BUFFER_DATA(11);
                                P_HIT_11(0) <= BUFFER_HIT(11);
                                P_ENERGY_12 <= BUFFER_DATA(12);
                                P_HIT_12(0) <= BUFFER_HIT(12);
                                P_ENERGY_13 <= BUFFER_DATA(13);
                                P_HIT_13(0) <= BUFFER_HIT(13);
                                P_ENERGY_14 <= BUFFER_DATA(14);
                                P_HIT_14(0) <= BUFFER_HIT(14);
                                P_ENERGY_15 <= BUFFER_DATA(15);
                                P_HIT_15(0) <= BUFFER_HIT(15);
                                P_ENERGY_16 <= BUFFER_DATA(16);
                                P_HIT_16(0) <= BUFFER_HIT(16);
                                P_ENERGY_17 <= BUFFER_DATA(17);
                                P_HIT_17(0) <= BUFFER_HIT(17);
                                P_ENERGY_18 <= BUFFER_DATA(18);
                                P_HIT_18(0) <= BUFFER_HIT(18);
                                P_ENERGY_19 <= BUFFER_DATA(19);
                                P_HIT_19(0) <= BUFFER_HIT(19);
                                P_ENERGY_20 <= BUFFER_DATA(20);
                                P_HIT_20(0) <= BUFFER_HIT(20);
                                P_ENERGY_21 <= BUFFER_DATA(21);
                                P_HIT_21(0) <= BUFFER_HIT(21);
                                P_ENERGY_22 <= BUFFER_DATA(22);
                                P_HIT_22(0) <= BUFFER_HIT(22);
                                P_ENERGY_23 <= BUFFER_DATA(23);
                                P_HIT_23(0) <= BUFFER_HIT(23);
                                P_ENERGY_24 <= BUFFER_DATA(24);
                                P_HIT_24(0) <= BUFFER_HIT(24);
                                P_ENERGY_25 <= BUFFER_DATA(25);
                                P_HIT_25(0) <= BUFFER_HIT(25);
                                P_ENERGY_26 <= BUFFER_DATA(26);
                                P_HIT_26(0) <= BUFFER_HIT(26);
                                P_ENERGY_27 <= BUFFER_DATA(27);
                                P_HIT_27(0) <= BUFFER_HIT(27);
                                P_ENERGY_28 <= BUFFER_DATA(28);
                                P_HIT_28(0) <= BUFFER_HIT(28);
                                P_ENERGY_29 <= BUFFER_DATA(29);
                                P_HIT_29(0) <= BUFFER_HIT(29);
                                P_ENERGY_30 <= BUFFER_DATA(30);
                                P_HIT_30(0) <= BUFFER_HIT(30);
                                P_ENERGY_31 <= BUFFER_DATA(31);
                                P_HIT_31(0) <= BUFFER_HIT(31);
                                P_DV <= "1";
                            else
                                BLKSM <= x"1";
                                bitcounter <= bitcounter -1;
                            end if;
                            
                        when others =>
                            BLKSM <= x"0";
                  end case;
    
                if reject_data ='1' then
                    BLKSM <= x"0"; 
                    start_c_raz <= x"1F";                                    --avvia la procedura di reset dell'ASIC
                end if;

            end if;
        end process;
    end block;
end Behavioral;
