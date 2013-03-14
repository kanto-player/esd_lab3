library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

        note_div   : out unsigned(9 downto 0);
        mod_depth  : out unsigned(3 downto 0);
        volume     : out unsigned(3 downto 0);
        active     : out std_logic;
    );
end de2_fm_synth_control;

architecture rtl of de2_fm_synth_control is
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                note_div <= x"300";
                mod_depth <= x"F";
                volume <= x"F";
                active <= '0';
            else
                if chipselect = '1' and write = '1' then
                    case address(4 downto 3) is
                        when "00" =>
                            note_div <= unsigned(writedata(9 downto 0));
                        when "01" =>
                            note_div <= unsigned(writedata(3 downto 0));
                        when "10" =>
                            volume <= unsigned(writedata(3 downto 0));
                        when "11" =>
                            volume <= writedata(0);
                    end case;
                end if;
            end if;
        end if;
    end process;
end rtl;
