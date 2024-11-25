library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package mult_pkg is 

    procedure multiplication (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure multiplication_high (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure multiplication_high_signed_unsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure multiplication_high_unsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

    procedure multiplication_word (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    );

end package;

package body mult_pkg is
   
    procedure multiplication (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is
        variable result : std_logic_vector(63 downto 0); 
    begin
        result := signed(i_first_operand) * signed(i_second_operand);
        o_result <= result(31 downto 0);
    end procedure;

    procedure multiplication_high (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is 
        variable result : std_logic_vector(63 downto 0); 
    begin
        result := signed(i_first_operand) * signed(i_second_operand);
        o_result <= result(63 downto 32);
    end procedure;

    procedure multiplication_high_signed_unsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is 
    begin

    end procedure;

    procedure multiplication_high_unsigned (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is 
    begin

    end procedure;

    procedure multiplication_word (
        signal i_first_operand : in std_logic_vector(31 downto 0);
        signal i_second_operand : in std_logic_vector(31 downto 0);
        signal o_result : out std_logic_vector(31 downto 0)
    ) is 
    begin

    end procedure;

end package body;