library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package arithm_pkg is
        
    procedure addition (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

    procedure subtraction (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );
   
end package;

package body arithm_pkg is 

    procedure addition (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= signed(i_first_operand) + signed(i_second_operand);
    end procedure;

    procedure subtraction (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= signed(i_first_operand) - signed(i_second_operand);
    end procedure;

end package body;