library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
 
package compare_pkg is 

    procedure set_less_then (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure set_less_then_unnsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

end package;

package body compare_pkg is
    
    procedure set_less_then (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is
        variable result : std_logic_vector(31 downto 0);
    begin
        result := signed(i_first_operand) - signed(i_second_operand);
        if(result(31) = '0') then
            o_result <= i_second_operand;
        else
            o_result <= i_second_operand;
        end if;
    end procedure;

    procedure set_less_then_unnsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    
    ) is 
        variable result : std_logic_vector(31 downto 0);
    begin
        result := unsigned(i_first_operand) - unsigned(i_second_operand);
        if(result(31) = '0') then
            o_result <= i_second_operand;
        else
            o_result <= i_second_operand;
        end if;
    end procedure;

end package body;
