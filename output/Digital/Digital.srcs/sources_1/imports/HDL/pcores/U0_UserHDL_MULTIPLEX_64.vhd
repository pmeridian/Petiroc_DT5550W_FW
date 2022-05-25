Library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;


entity U0_UserHDL_MULTIPLEX_64 is
port (
 IN_1: in STD_LOGIC_VECTOR (63 downto 0);
 IN_2: in STD_LOGIC_VECTOR (63 downto 0);
 M_SEL: in STD_LOGIC;
 M_OUT: out STD_LOGIC_VECTOR (63 downto 0)
);
end U0_UserHDL_MULTIPLEX_64;

architecture Behavioral of U0_UserHDL_MULTIPLEX_64 is

begin
	mux_out: process(IN_1,IN_2,M_SEL)
	begin
 if M_SEL = '0' then
 M_OUT <= IN_1; 
 else
 if M_SEL = '1' then
 M_OUT <= IN_2; 
 end if;
 end if;
 end process;

end Behavioral;

