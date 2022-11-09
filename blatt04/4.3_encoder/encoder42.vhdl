library ieee;
use ieee.std_logic_1164.all;

entity encoder42 is 
	port (
		i : in  std_logic_vector(3 downto 0);
		y : out std_logic_vector(1 downto 0)
		);
end encoder42;

architecture rtl of encoder42 is

	COMPONENT andgate IS
	PORT (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
  END COMPONENT;

	COMPONENT orgate IS
	PORT (
    input1 : in std_logic;
    input2 : in std_logic;
    or_result : out std_logic
  );
  END COMPONENT;

COMPONENT not_gate is
        PORT (
            input1 : IN std_logic;
            not_output: OUT std_logic
        );
    END COMPONENT;  

	signal wire1 : std_logic;
	signal wire2 : std_logic;

  BEGIN  

  or1 : orgate port map(input1 => i(3), input2 => wire2 , or_result => y(0));
  not1 : not_gate port map(input1 => i(2), not_output => wire1);
  and1 : andgate port map( input1 => wire1, input2 => i(1), and_result => wire2);
  or2 : orgate port map( input1 => i(3), input2 => i(2), or_result => y(1));

--missing
end rtl;