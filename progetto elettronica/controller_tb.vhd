LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY controller_tb IS
END controller_tb;

ARCHITECTURE testbench OF controller_tb IS

component dff is
	port (
		rst: in std_logic;
		clk: in std_logic;
		d: in std_logic;
		q: out std_logic
		);
	end component;

	--constants declaration
	constant T_CLK  : time := 100 ns;
	constant T_RESET : time := 5 ns;
	-- Simulation time
	constant T_sim  : time := 1000 ns;
	constant N_segments : integer := 7;
	constant N_enable : integer := 4;

--signals
	signal clk_tb : std_logic := '0'; 
	signal rst_tb : std_logic := '0'; 
	-- signal to stop the simulation
	signal stop_simulation : std_logic := '1'; 

   	signal digit_tb : std_logic_vector(3 downto 0) := (others => '0');
	signal digit_select_tb : std_logic_vector(1 downto 0);

	signal segments_tb : std_logic_vector(6 downto 0);
	signal output_segments_tb : std_logic_vector(6 downto 0);
	signal output_enable_tb : std_logic_vector(3 downto 0);
	signal enable_tb : std_logic_vector(3 downto 0);

   --constant clk_period : time := 1 ns;
begin
controller_map:
	entity work.controller 
	port map (
		clk =>clk_tb,
		reset =>rst_tb,
		digit => digit_tb,
		digit_select => digit_select_tb,
		enable => enable_tb,
		segments => segments_tb
	);
dff_map:
	entity work.dff_N(struct)
	generic map(N => 7)
	port map (d_in => segments_tb, q_out => output_segments_tb, clk => clk_tb, resetn => rst_tb);

dff_map2:
	entity work.dff_N(struct)
	generic map(N => 4)
	port map (d_in => enable_tb, q_out => output_enable_tb, clk => clk_tb, resetn => rst_tb);
	

   clk_process :process
   begin
	rst_tb <= '1' after T_RESET;
	clk_tb <= '0';
	wait for T_CLK/2;
	clk_tb <= '1';
	wait for T_CLK/2;      	
	
   end process;
      
   stim_proc: process
   begin               
     for i in 0 to 9 loop
		digit_tb <= conv_std_logic_vector(i,4);
		digit_select_tb <= conv_std_logic_vector(i mod 4,2);
          	wait for T_CLK/3;
     end loop;
   end process;

END;