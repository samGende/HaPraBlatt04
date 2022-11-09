LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (
        i0_81 : IN std_logic_vector(2 DOWNTO 0); 
        i1_81 : IN std_logic_vector(2 DOWNTO 0);
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT mux41 IS
        PORT (
            i0 : IN std_logic_vector(2 DOWNTO 0); 
            i1 : IN std_logic_vector(2 DOWNTO 0);
            i2 : IN std_logic_vector(2 DOWNTO 0);
            i3 : IN std_logic_vector(2 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
    
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

    COMPONENT or_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
            input4: IN std_logic;
            or_result : OUT std_logic);
    END COMPONENT;

    -- weitere Komponenten 
    
    
    -- Signale
    signal mux41_result1: std_logic_vector(2 DOWNTO 0);
    signal mux41_result2: std_logic_vector(2 DOWNTO 0);
    signal and_result1: std_logic_vector(2 DOWNTO 0);
    signal and_result2: std_logic_vector(2 DOWNTO 0); 
    signal sel01: std_logic_vector(1 DOWNTO 0);
    signal not_sel2: std_logic;
begin

    sel01(0) <= sel_81(0);
    sel01(1) <= sel_81(1);

    not1 : not_gate port map(input1 => sel_81(2), not_output => not_sel2);
    mux41_1 : mux41 port map(i0 => i0_81, i1 => i1_81, i2 => i2_81, i3 => i3_81, sel => sel01,  y => mux41_result1);
    mux41_2 : mux41 port map(i0 => i4_81, i1 => i5_81, i2 => i6_81, i3 => i7_81, sel => sel01, y => mux41_result2);


    and_assingment : for i in 0 TO 2 generate 
    and1 : and_gate port map(input1 => mux41_result1(i), input2 => not_sel2, input3 => '1',  and_output => and_result1(i));
    and2 : and_gate port map(input1 => mux41_result2(i), input2 => sel_81(2), input3 => '1', and_output => and_result2(i));
    end generate and_assingment; 

    or_assingment : for i in 0 TO 2 generate 
    or_result : or_gate port map(input1 => and_result1(i), input2=> and_result2(i), input3 => '0', input4 => '0', or_result => y_81(i));
    end generate or_assingment; 
    
    
    

    --missing;
    -- hier werden die einzelnen Komponenten verschaltet

end rtl;
