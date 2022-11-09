LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        I_n : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        Y0 : OUT std_logic_vector(2 DOWNTO 0);
        Y1 : OUT std_logic_vector(2 DOWNTO 0);
        Y2 : OUT std_logic_vector(2 DOWNTO 0);
        Y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS
--missing
COMPONENT and_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
            and_output : OUT std_logic);
    END COMPONENT;

COMPONENT not_gate is
        PORT (
            input1 : IN std_logic;
            not_output: OUT std_logic
        );
    END COMPONENT;  

    signal not_sel: std_logic_vector(1 DOWNTO 0);


    BEGIN
    
    not_assingment : for i in 0 to 1 generate 
    not1 : not_gate port map(input1 => sel(i), not_output => not_sel(i));
    end generate not_assingment; 

    y_assingment : for i in 0 to 2 generate 
    and0: and_gate port map(input1 => I_n(i), input2 => not_sel(0), input3 => not_sel(1), and_output => Y0(i)); 
    and1: and_gate port map(input1 => I_n(i), input2 => sel(0), input3 => not_sel(1), and_output => Y1(i));
    and2: and_gate port map(input1 => I_n(i), input2 => not_sel(0), input3 => sel(1), and_output => Y2(i));
    and3: and_gate port map(input1 => I_n(i), input2 => sel(0), input3 => sel(1), and_output => Y3(i));
    end generate y_assingment; 

END rtl;
