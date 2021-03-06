library ieee;
use ieee.std_logic_1164.all;

entity mux_4_1 is
  port (
	sel	  : in	std_logic_vector (1 downto 0);
	src0,src1,src2,src3 :	in	std_logic;
	z : out std_logic
  );
end mux_4_1;



architecture structural of mux_4_1 is


component mux is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic;
	src1  : in  std_logic;
	z	    : out std_logic
  );
end component;

signal temp, temp1 : std_logic;
begin

mux0: mux port map(sel(0), src0, src1, temp);
mux1: mux port map(sel(0), src2, src3, temp1);
mux2: mux port map (sel(1), temp, temp1, z);



end structural;
