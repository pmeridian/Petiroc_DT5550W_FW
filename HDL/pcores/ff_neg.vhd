------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				FLIP FLOP (POSITIVE)          				--
--	Version:			1.0										--
--	Creation Data:		13-07-2017								--
--																--
--																--
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;


entity FF_FE is
  Generic (bitSize : integer := 1);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	PRESET: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
	PORT_IN: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
	PORT_OUT: OUT STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0)
	);
end;


architecture Behavioral of FF_FE is

begin

	ff_process: process(CLK,RESET)
	begin
        if RESET(0) = '1' and CE="1"  then
            PORT_OUT <= PRESET; 
        else
            if falling_edge(CLK(0)) and CE="1" then
              PORT_OUT <=  PORT_IN;
            end if;
        end if;
    end process;
end Behavioral; 