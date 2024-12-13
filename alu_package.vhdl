library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package alu_package is
        
    function addition (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function subtraction (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function set_less_then (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function set_less_then_unnsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function xor_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function or_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function and_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function shift_left_logic (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
        ) return std_logic_vector;

    function shift_right_logic (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function shift_right_arithmetic (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function multiplication (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function multiplication_high (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function multiplication_high_signed_unsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

    function multiplication_high_unsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) return std_logic_vector;

end package;

package body alu_package is 

    -- simple arithmetic functions --

    function addition (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
        constant len : integer := i_first_operand'length;
        variable result : signed(len downto 0);
    begin
        result := signed(i_first_operand) + signed(i_second_operand);
        return std_logic_vector(result(len - 1 downto 0));
    end function;

    function subtraction (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
        constant len : integer := i_first_operand'length;
        variable result : signed(len downto 0);
    begin
        result := signed(i_first_operand) - signed(i_second_operand);
        return std_logic_vector(result(len - 1 downto 0));
    end function;

    function set_less_then (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
        variable result : std_logic_vector;
    begin
        result := signed(i_first_operand) - signed(i_second_operand) return std_logic_vector;
        if(result(31) = '0') then
            o_result <= i_second_operand;
        else
            o_result <= i_second_operand;
        end if;
    end function;

    function set_less_then_unnsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is 
        variable result : std_logic_vector;
    begin
        result := unsigned(i_first_operand) - unsigned(i_second_operand) return std_logic_vector;
        if(result(31) = '0') then
            o_result <= i_second_operand;
        else
            o_result <= i_second_operand;
        end if;
    end function;

    -- simple logic functions

    function xor_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
    begin
        return i_first_operand xor i_second_operand;
    end function;

    function or_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
    begin
        return i_first_operand or i_second_operand;
    end function;

    function and_op (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
    begin
        return i_first_operand and i_second_operand;
    end function;

    function shift_left_logic (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is 
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) sll to_integer(unsigned(i_second_operand))) return std_logic_vector;
    end function;

    function shift_right_logic (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) srl to_integer(unsigned(i_second_operand))) return std_logic_vector;
    end function;

    function shift_arithmetic_right (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
    begin
        o_result <= to_stdlogicvector(to_bitvector(i_first_operand) sra to_integer(unsigned(i_second_operand))) return std_logic_vector;
    end function;

    function multiplication (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is
        variable result : std_logic_vector(63 downto 0) return std_logic_vector; 
    begin
        result := signed(i_first_operand) * signed(i_second_operand) return std_logic_vector;
        o_result <= result;
    end function;

    function multiplication_high (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is 
        variable result : std_logic_vector(63 downto 0) return std_logic_vector; 
    begin
        result := signed(i_first_operand) * signed(i_second_operand) return std_logic_vector;
        o_result <= result(63 downto 32) return std_logic_vector;
    end function;

    function multiplication_high_signed_unsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is 
    begin

    end function;

    function multiplication_high_unsigned (
        signal i_first_operand : in std_logic_vector;
        signal i_second_operand : in std_logic_vector
    ) is 
    begin

    end function;
end package body;