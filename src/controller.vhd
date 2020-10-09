library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity controller is
	port (
		clk : in std_logic;
		reset : in std_logic;
		digit : in std_logic_vector(3 downto 0);  --BCD input
		digit_select : in std_logic_vector(1 downto 0);
		enable : out std_logic_vector(3 downto 0);
		segments : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
	    );
end controller;

architecture bhv of controller is

signal segments_signal : std_logic_vector(6 downto 0);
signal enable_signal : std_logic_vector(3 downto 0);

begin
    process(clk,reset) is
        begin
                        
		if(rising_edge(clk) and reset='1') then
		case digit is
		 when "0000" => segments_signal <="1111110";
		 when "0001" => segments_signal <= "0110000";
		 when "0010" => segments_signal <= "1101101";
		 when "0011" => segments_signal <= "1111001";
		 when "0100" => segments_signal <= "0110011";
		 when "0101" => segments_signal <= "1011011";
		 when "0110" => segments_signal <= "0011111";
		 when "0111" => segments_signal <= "1110000";
		 when "1000" => segments_signal <= "1111111";
		 when "1001" => segments_signal <= "1110011";
		 when others => segments_signal <="0000000";
		end case;
		segments <= segments_signal;
		case digit_select is
		 when "00" => enable_signal<="1000";
		 when "01" => enable_signal<="0100";
		 when "10" => enable_signal<="0010";
		 when "11" => enable_signal<="0001";
		 when others => enable_signal<="0000";
		end case;
		enable <= enable_signal;
		end if;			
	end process;
end architecture bhv;
