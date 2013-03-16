library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_reg is
    port(clk : in std_logic;
         counter1in : in unsigned(7 downto 0);
         counter2in : in unsigned(7 downto 0);
         counter1out : out unsigned(7 downto 0);
         counter2out : out unsigned(7 downto 0));
end counter_reg;

architecture rtl of counter_reg is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            counter1out <= counter1in;
            counter2out <= counter2in;
        end if;
    end process;
end rtl;