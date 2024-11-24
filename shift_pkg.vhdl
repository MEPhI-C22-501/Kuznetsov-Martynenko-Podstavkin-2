library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package shift_pkg is

    procedure left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
        );

    procedure right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

    procedure arithmetic_left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

    procedure arithmetic_right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

    procedure loop_left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

    procedure loop_right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    );

end package;

package body shift_pkg is

    procedure left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is 
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) sll to_integer(unsigned(i_second_operand)));
    end procedure;

    procedure right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) srl to_integer(unsigned(i_second_operand)));
    end procedure;

    procedure arithmetic_left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) sla to_integer(unsigned(i_second_operand)));
    end procedure;

    procedure arithmetic_right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) sra to_integer(unsigned(i_second_operand)));
    end procedure;

    procedure loop_left_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) rol to_integer(unsigned(i_second_operand)));
    end procedure;

    procedure loop_right_shift (
        signal i_first_operand : in std_logic_vector(32 downto 0);
        signal i_second_operand : in std_logic_vector(32 downto 0);
        signal o_result : out std_logic_vector(32 downto 0)
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) ror to_integer(unsigned(i_second_operand)));
    end procedure;
    
end package body;