library ieee;
	use ieee.std_logic_1164.all;

entity dff_N is
generic (N: integer);
	port (
		resetn : in std_logic;
		clk : in std_logic;
		d_in : in std_logic_vector(N-1 downto 0);
		q_out : out std_logic_vector(N-1 downto 0)
		);
end dff_N;

architecture struct of dff_N is
	component dff is
	port (
		rst: in std_logic;
		ck: in std_logic;
		d: in std_logic;
		q: out std_logic
		);
	end component;
begin

	dff_N_gen : for i in 0 to N - 1  generate
	        i_dff : dff port map(
		                                    d    =>  d_in(i),
					            q    =>  q_out(i), 
						    rst  =>  resetn,
						    ck => clk
						  );
end generate dff_N_gen;
end struct;