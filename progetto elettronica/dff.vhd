library ieee;
use ieee.std_logic_1164.all;

entity dff is
port (
		rst: in std_logic;
		ck: in std_logic;
		d: in std_logic;
		q: out std_logic
		);
end dff;

architecture struct of dff is
begin  
	process(ck)
 		begin 
    		if(rising_edge(ck)) then
   			q <= d; 
    		end if;       
 	end process; 
end struct;
