library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port(
        i_first_operand, i_second_operand : in std_logic_vector(31 downto 0);
        i_manage : in std_logic_vector(3 downto 0);
        i_clk : in std_logic;
        o_result : out std_logic_vector(31 downto 0);
        o_result_trait : out std_logic
    );
end entity;

architecture ALU_arch of ALU is
begin
    

end architecture;