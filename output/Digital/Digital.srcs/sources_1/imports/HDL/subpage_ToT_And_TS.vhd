library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_ToT_And_TS is
    Port (	
		IN_SIGNAL : in std_logic_vector(0 downto 0);
TOT_LATCHED : out std_logic_vector(31 downto 0);
D_READY : out std_logic_vector(0 downto 0);
TS_IN : in std_logic_vector(63 downto 0);
TS_OUT : out std_logic_vector(63 downto 0);

		async_clk : in std_logic_vector (0 downto 0);
		CLK_ACQ : in std_logic_vector (0 downto 0);
		BUS_CLK : in std_logic_vector (0 downto 0);
		CLK_40 : in std_logic_vector (0 downto 0);
		CLK_50 : in std_logic_vector (0 downto 0);
		CLK_80 : in std_logic_vector (0 downto 0);
		clk_160 : in std_logic_vector (0 downto 0);
		clk_320 : in std_logic_vector (0 downto 0);
		CLK_125 : in std_logic_vector(0 downto 0);
		FAST_CLK_100 : in std_logic_vector (0 downto 0);
		FAST_CLK_200 : in std_logic_vector (0 downto 0);
		FAST_CLK_250 : in std_logic_vector (0 downto 0);
		FAST_CLK_250_90 : in std_logic_vector (0 downto 0);
		FAST_CLK_500 : in std_logic_vector (0 downto 0);
		FAST_CLK_500_90 : in std_logic_vector (0 downto 0);
		GlobalClock : in std_logic_vector (0 downto 0);
		GlobalReset : in std_logic_vector (0 downto 0)
		
 );
end SUBPAGE_ToT_And_TS;

architecture Behavioral of SUBPAGE_ToT_And_TS is
Component CHRONO_STARTSTOP Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        START: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        STOP: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        TIMEMES: OUT STD_LOGIC_VECTOR (31 downto 0);
        AUTORESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        RUNNING: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U0_time : std_logic_vector(31 downto 0) := (others => '0');
Component EDGE_DETECTOR_FE Is
   Generic(bitSize : Integer := 1);
   port(        Reset :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        PORT_IN: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
        PULSE_WIDTH: IN INTEGER;
        PORT_OUT: OUT STD_LOGIC_VECTOR(bitSize - 1 DOWNTO 0)
        );
End component;
signal U1_out : std_logic_vector(0 downto 0) := (others => '0');
Component EDGE_DETECTOR_RE Is
   Generic(bitSize : Integer := 1);
   port(        Reset :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        PORT_IN: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
        PULSE_WIDTH: IN INTEGER;
        PORT_OUT: OUT STD_LOGIC_VECTOR(bitSize - 1 DOWNTO 0)
        );
End component;
signal U2_out : std_logic_vector(0 downto 0) := (others => '0');
signal U4_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT d_latch
  GENERIC( 
	IN_SIZE : INTEGER := 32;
	EDGE : STRING := "rising" );
PORT( 
	a : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	CE : in STD_LOGIC;
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	reset_val : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	b : out STD_LOGIC_VECTOR(IN_SIZE-1 downto 0) );
END COMPONENT;
signal U5_IN_SIGNAL : std_logic_vector(0 downto 0);
signal U8_CONST : INTEGER := 0;

COMPONENT SYNC_FIX_DELAY
Generic (	maxDelay : integer := 16;
        	busWidth : integer := 1);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0); 
    PORT_OUT: OUT STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0)); 
END COMPONENT;
signal U9_out : std_logic_vector(0 downto 0) := (others => '0');

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
signal U10_out : std_logic_vector(0 downto 0) := (others => '0');
signal U12_TS_IN : std_logic_vector(63 downto 0);
signal U15_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal U17_out : std_logic_vector(0 downto 0) := (others => '0');
signal U18_out_0 : std_logic_vector(31 downto 0) := (others => '0');
signal U19_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U20_CONST : INTEGER := 0;

begin
U0 : CHRONO_STARTSTOP
    Generic map(bitSize => 32 )
    port map( 
        RESET =>  U2_out, 
        CE => "1",
        CLK => async_clk,
        START => U17_out,
        STOP => U1_out,
        TIMEMES => U0_time,
        AUTORESET => "0",
        RUNNING => open,
        OVERFLOW => open
    );
U1 : EDGE_DETECTOR_FE
    Generic map(bitSize => 1 )
    port map( 
        Reset => GlobalReset, 
        CE => "1",
        CLK => async_clk,
        PORT_IN => U5_IN_SIGNAL,
        PULSE_WIDTH => U8_CONST,
        PORT_OUT => U1_out
    );
U2 : EDGE_DETECTOR_RE
    Generic map(bitSize => 1 )
    port map( 
        Reset => GlobalReset, 
        CE => "1",
        CLK => async_clk,
        PORT_IN => U5_IN_SIGNAL,
        PULSE_WIDTH => U8_CONST,
        PORT_OUT => U2_out
    );
U4 : d_latch
  Generic map(
	IN_SIZE => 	32,
	EDGE => 	"rising")
PORT MAP(
	a => U0_time,
	CE => U9_out(0),
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "00000000000000000000000000000000",
	b => U4_OUT );
U5_IN_SIGNAL <= IN_SIGNAL;
TOT_LATCHED <= U18_out_0;
U8_CONST <= 2;

U9:SYNC_FIX_DELAY
GENERIC MAP(
    maxDelay => 1,
    busWidth => 1)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U1_out,
    PORT_OUT => U9_out
);

U10:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U1_out,
    DELAY => U20_CONST,
    GATE => 1,
    PORT_OUT => U10_out
);
D_READY <= U10_out;
U12_TS_IN <= TS_IN;
U15 : d_latch
  Generic map(
	IN_SIZE => 	64,
	EDGE => 	"rising")
PORT MAP(
	a => U12_TS_IN,
	CE => U2_out(0),
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "0000000000000000000000000000000000000000000000000000000000000000",
	b => U15_OUT );
TS_OUT <= U15_OUT;

U17:SYNC_FIX_DELAY
GENERIC MAP(
    maxDelay => 1,
    busWidth => 1)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U2_out,
    PORT_OUT => U17_out
);
U18_out_0 <= ext(U4_OUT, 32) + ext(U19_CONST, 32) ;
U19_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"1"),32));
U20_CONST <= 5;

end Behavioral;
