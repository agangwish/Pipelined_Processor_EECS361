
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;


entity CPU_pipelined_tb is
end entity;

architecture behav of CPU_pipelined_tb is



component CPU_pipelined is
	generic (
		data_file : string
  	);
port (clk : in std_logic;
      pc_init, counter : in std_logic);
end component;


signal clk_tb, pc_init_tb, counter_tb : std_logic;
signal mem_file : string (26 downto 1);


begin

dut : CPU_pipelined generic map (data_file => "bills_branch.dat") port map(clk_tb, pc_init_tb, counter_tb);

testbench: process begin
counter_tb <= '0';
clk_tb <= '0';

pc_init_tb <='1';

wait for 200 ps;

clk_tb <= '1';



wait for 200 ps;
pc_init_tb <= '0';
clk_tb <= '0';
counter_tb <= '1';

wait for 200 ps;

clk_tb <= '1';


wait for 200 ps;


G0: for i in 0 to 100 loop

clk_tb <= '0';
counter_tb <= '0';

wait for 200 ps;

clk_tb <= '1';


wait for 200 ps;


end loop;

end process;

end behav;


