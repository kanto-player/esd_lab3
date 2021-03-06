library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- SOPC component to control FM Synth
-- Address 0 is note divider
-- Address 16 is modulation depth
-- Address 32 is volume
-- Address 48 is enable (1) / disable (0)

entity de2_fm_synth_control is
    port (
        clk        : in  std_logic;
        reset_n    : in  std_logic;
        read       : in  std_logic;
        write      : in  std_logic;
        chipselect : in  std_logic;
        address    : in  std_logic_vector(4 downto 0);
        readdata   : out std_logic_vector(15 downto 0);
        writedata  : in  std_logic_vector(15 downto 0);

        fm_synth_note   : out std_logic_vector(9 downto 0);
        fm_synth_mod_depth  : out std_logic_vector(3 downto 0);
        fm_synth_volume     : out std_logic_vector(3 downto 0);
        fm_synth_en     : out std_logic
    );
end de2_fm_synth_control;

architecture rtl of de2_fm_synth_control is
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                fm_synth_note <= "1100000000";
                fm_synth_mod_depth <= x"F";
                fm_synth_volume <= x"F";
                fm_synth_en <= '0';
            else
                if chipselect = '1' and write = '1' then
                    case address(4 downto 3) is
                        when "00" =>
                            fm_synth_note <= writedata(9 downto 0);
                        when "01" =>
                            fm_synth_mod_depth <= writedata(3 downto 0);
                        when "10" =>
                            fm_synth_volume <= writedata(3 downto 0);
                        when others =>
                            fm_synth_en <= writedata(0);
                    end case;
                end if;
            end if;
        end if;
    end process;
end rtl;
