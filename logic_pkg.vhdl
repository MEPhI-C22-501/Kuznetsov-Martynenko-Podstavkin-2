library IEEE;
use IEEE.std_logic_1164.all;

package logic_pkg is

    procedure xor_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure or_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure and_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

end package;

package body logic_pkg is
    
    procedure xor_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is
    begin
        o_result <= i_first_operand xor i_second_operand;
    end procedure;

    procedure or_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is
    begin
        o_result <= i_first_operand or i_second_operand;
    end procedure;

    procedure and_op (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is
    begin 
        o_result <= i_first_operand and i_second_operand;
    end procedure;

end package body;
