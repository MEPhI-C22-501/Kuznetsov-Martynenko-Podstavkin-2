library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_tester is
    port (
        o_clk : out std_logic;
        o_rst : out std_logic;
        o_first_operand, o_second_operand : out std_logic_vector(31 downto 0);
        o_manage : out std_logic_vector(16 downto 0)
    );
end entity alu_tester;

architecture alu_tester_arch of alu_tester is

    constant ADDI_OP   : std_logic_vector := "00000000000010011";
    constant SLTI_OP   : std_logic_vector := "00000000100010011";
    constant SLTIU_OP  : std_logic_vector := "00000000110010011";
    constant XORI_OP   : std_logic_vector := "00000001000010011";
    constant ORI_OP    : std_logic_vector := "00000001100010011";
    constant ANDI_OP   : std_logic_vector := "00000001110010011";
    constant SLLI_OP   : std_logic_vector := "00000000010010011";
    constant SRLI_OP   : std_logic_vector := "00000001010010011";
    constant SRAI_OP   : std_logic_vector := "01000001010010011";

    constant ADD_OP    : std_logic_vector := "00000000000110011";
    constant SUB_OP    : std_logic_vector := "01000000000110011";
    constant SLL_OP    : std_logic_vector := "00000000010110011";
    constant SLT_OP    : std_logic_vector := "00000000100110011";
    constant SLTU_OP   : std_logic_vector := "00000000110110011";
    constant XOR_OP    : std_logic_vector := "00000001000110011";
    constant SRL_OP    : std_logic_vector := "00000001010110011";
    constant SRA_OP    : std_logic_vector := "01000001010110011";
    constant OR_OP     : std_logic_vector := "00000001100110011";
    constant AND_OP    : std_logic_vector := "00000001110110011";
    constant MUL_OP    : std_logic_vector := "00000011000110011";
    constant MULH_OP   : std_logic_vector := "00000011010110011";
    constant MULHSU_OP : std_logic_vector := "00000010100110011";
    constant MULHU_OP  : std_logic_vector := "00000010110110011";
    
    constant clk_period : time := 10 ns;
    signal clk : std_logic := '1';

    type ops is array (0 to 2) of std_logic_vector(31 downto 0);
    signal positives : ops := (x"00000001", x"40000000", x"7FFFFFFF");
    signal negatives : ops := (x"FFFFFFFF", x"C0000000", x"80000001");
    signal positive_imms : ops := (x"00000001", x"00000400", x"000007FF");
    signal negative_imms : ops := (x"FFFFFFFF", x"FFFFFC00", x"FFFFF801");

begin
    
    clk <= not clk after clk_period / 2;
    o_clk <= clk;
    process
    begin

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        -- arithmetic tests

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= positives(i);
                o_manage <= ADD_OP;
                wait for clk_period;
                o_manage <= SUB_OP;
                wait for clk_period;
                o_second_operand <= positive_imms(i);
                o_manage <= ADDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';
    
        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= negatives(i);
                o_manage <= ADD_OP;
                wait for clk_period;
                o_manage <= SUB_OP;
                wait for clk_period;
                o_second_operand <= negative_imms(i);
                o_manage <= ADDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= positives(i);
                o_manage <= ADD_OP;
                wait for clk_period;
                o_manage <= SUB_OP;
                wait for clk_period;
                o_second_operand <= positive_imms(i);
                o_manage <= ADDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= negatives(i);
                o_manage <= ADD_OP;
                wait for clk_period;
                o_manage <= SUB_OP;
                wait for clk_period;
                o_second_operand <= negative_imms(i);
                o_manage <= ADDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        -- shift tests

        for i in 0 to 2 loop 
            o_first_operand <= positives(i);
            o_manage <= SLL_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRL_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;    
            
            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';
                
            o_manage <= SRA_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;
            
            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SLLI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRLI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRAI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

        end loop;

        for i in 0 to 2 loop 
            o_first_operand <= negatives(i);
            o_manage <= SLL_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRL_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;   
            
            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRA_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;    
            
            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SLLI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRLI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

            o_manage <= SRAI_OP;
            for i in 1 to 32 loop
                o_second_operand <= std_logic_vector(to_unsigned(i, 32));
                wait for clk_period;
            end loop;

            o_rst <= '1';
            wait for clk_period;
            o_rst <= '0';

        end loop;

        -- logic test

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= positives(i);
                o_manage <= XOR_OP;
                wait for clk_period;
                o_manage <= OR_OP;
                wait for clk_period;
                o_manage <= AND_OP;
                wait for clk_period;
                o_second_operand <= positive_imms(i);
                o_manage <= XORI_OP;
                wait for clk_period;
                o_manage <= ORI_OP;
                wait for clk_period;
                o_manage <= ANDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= negatives(i);
                o_manage <= XOR_OP;
                wait for clk_period;
                o_manage <= OR_OP;
                wait for clk_period;
                o_manage <= AND_OP;
                wait for clk_period;
                o_second_operand <= negative_imms(i);
                o_manage <= XORI_OP;
                wait for clk_period;
                o_manage <= ORI_OP;
                wait for clk_period;
                o_manage <= ANDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= positives(i);
                o_manage <= XOR_OP;
                wait for clk_period;
                o_manage <= OR_OP;
                wait for clk_period;
                o_manage <= AND_OP;
                wait for clk_period;
                o_second_operand <= positive_imms(i);
                o_manage <= XORI_OP;
                wait for clk_period;
                o_manage <= ORI_OP;
                wait for clk_period;
                o_manage <= ANDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= negatives(i);
                o_manage <= XOR_OP;
                wait for clk_period;
                o_manage <= OR_OP;
                wait for clk_period;
                o_manage <= AND_OP;
                wait for clk_period;
                o_second_operand <= negative_imms(i);
                o_manage <= XORI_OP;
                wait for clk_period;
                o_manage <= ORI_OP;
                wait for clk_period;
                o_manage <= ANDI_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        -- multiplication test

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= positives(i);
                o_manage <= MUL_OP;
                wait for clk_period;
                o_manage <= MULH_OP;
                wait for clk_period;
                o_manage <= MULHSU_OP;
                wait for clk_period;
                o_manage <= MULHU_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= positives(j);
                o_second_operand <= negatives(i);
                o_manage <= MUL_OP;
                wait for clk_period;
                o_manage <= MULH_OP;
                wait for clk_period;
                o_manage <= MULHSU_OP;
                wait for clk_period;
                o_manage <= MULHU_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= positives(i);
                o_manage <= MUL_OP;
                wait for clk_period;
                o_manage <= MULH_OP;
                wait for clk_period;
                o_manage <= MULHSU_OP;
                wait for clk_period;
                o_manage <= MULHU_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

        for i in 0 to 2 loop 
            for j in 0 to 2 loop
                o_first_operand <= negatives(j);
                o_second_operand <= negatives(i);
                o_manage <= MUL_OP;
                wait for clk_period;
                o_manage <= MULH_OP;
                wait for clk_period;
                o_manage <= MULHSU_OP;
                wait for clk_period;
                o_manage <= MULHU_OP;
                wait for clk_period;
            end loop;
        end loop;

        o_rst <= '1';
        wait for clk_period;
        o_rst <= '0';

    end process ;
end architecture;