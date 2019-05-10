library ieee;
use ieee.std_logic_1164.all;
entity demuxR is
	port(S_in0,S_in1,S_in2,S_in3,
		  S_in4,S_in5,S_in6,S_in7: in std_logic_vector(3 downto 0);
		  R: in std_logic;
		  key: in std_logic_vector(2 downto 0);
		  C_out: out std_logic_vector(3 downto 0));
end demuxR;

architecture choice of DemuxR is
begin
	p_mux : process(S_in0,S_in1,S_in2,S_in3,
		  S_in4,S_in5,S_in6,S_in7, key, R)
   begin
	case R is
		when '1' => case key is
			when "000" => C_out <=S_in0;
			when "001" => C_out <=S_in1;
			when "010" => C_out <=S_in2;
			when "011" => C_out <=S_in3;
			when "100" => C_out <=S_in4;
			when "101" => C_out <=S_in5;
			when "110" => C_out <=S_in6;
			when "111" => C_out <=S_in7;
		end case;
		when '0' => C_out <="0000";
	end case;
	end process p_mux;
end choice;