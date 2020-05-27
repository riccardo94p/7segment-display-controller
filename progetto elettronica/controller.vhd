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
	--segments_out : out std_logic_vector(6 downto 0) -- 7 bit decoded output.
    );
end controller;

-- D-FlipFlop used to update the output synchronously with the rising edge of the clock signal

--'a' corresponds to MSB of segments and g corresponds to LSB of segments.

architecture bhv of controller is

component dff_N is
generic (N: integer);
	port (
		resetn : in std_logic;
		clk : in std_logic;
		d_in : in std_logic_vector(N-1 downto 0);
		q_out : out std_logic_vector(N-1 downto 0)
		);
end component;

component dff_M is
generic (M: integer);
	port (
		resetn : in std_logic;
		clk : in std_logic;
		d_in : in std_logic_vector(M-1 downto 0);
		q_out : out std_logic_vector(M-1 downto 0)
		);
end component;

signal segments_signal : std_logic_vector(6 downto 0);
signal enable_signal : std_logic_vector(3 downto 0);

begin

segments_signal <="1111110" when digit = "0000" else  -- '0'
	"0110000" when digit = "0001" else
	"1101101" when digit = "0010" else
	"1111001" when digit = "0011" else
	"0110011" when digit = "0100" else
	"1011011" when digit = "0101" else
	"0011111" when digit = "0110" else
	"1110000" when digit = "0111" else
	"1111111" when digit = "1000" else
	"1110011" when digit = "1001" else "0000000";

segments <= segments_signal;

enable_signal <="1000" when digit_select = "00" else
	"0100" when digit_select = "01" else
	"0010" when digit_select = "10" else
	"0001" when digit_select = "11" else "0000";

enable <= enable_signal;
end;