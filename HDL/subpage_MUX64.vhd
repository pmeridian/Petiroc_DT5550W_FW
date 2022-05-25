library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_MUX64 is
    Port (	
		IN_1 : in std_logic_vector(63 downto 0);
IN_2 : in std_logic_vector(63 downto 0);
SEL : in std_logic_vector(0 downto 0);
MOUT : out std_logic_vector(63 downto 0);

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
end SUBPAGE_MUX64;

architecture Behavioral of SUBPAGE_MUX64 is
signal U0_M_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
COMPONENT U0_UserHDL_MULTIPLEX_64
PORT( 
	IN_1 : in STD_LOGIC_VECTOR(63 downto 0);
	IN_2 : in STD_LOGIC_VECTOR(63 downto 0);
	M_SEL : in STD_LOGIC;
	M_OUT : out STD_LOGIC_VECTOR(63 downto 0) );
END COMPONENT;
signal U1_IN_1 : std_logic_vector(63 downto 0);
signal U3_IN_2 : std_logic_vector(63 downto 0);
signal U5_SEL : std_logic_vector(0 downto 0);

begin
U0 : U0_UserHDL_MULTIPLEX_64
PORT MAP(
	IN_1 => U1_IN_1,
	IN_2 => U3_IN_2,
	M_SEL => U5_SEL(0),
	M_OUT => U0_M_OUT );
U1_IN_1 <= IN_1;
U3_IN_2 <= IN_2;
U5_SEL <= SEL;
MOUT <= U0_M_OUT;

end Behavioral;
