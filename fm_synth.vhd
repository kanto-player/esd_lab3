-- fm_synth.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fm_synth is
	port (
		clk                : in  std_logic                     := '0';             --          clock.clk
		reset_n            : in  std_logic                     := '0';             --          reset.reset_n
		read               : in  std_logic                     := '0';             -- avalon_slave_0.read
		write              : in  std_logic                     := '0';             --               .write
		chipselect         : in  std_logic                     := '0';             --               .chipselect
		address            : in  std_logic_vector(4 downto 0)  := (others => '0'); --               .address
		readdata           : out std_logic_vector(15 downto 0);                    --               .readdata
		writedata          : in  std_logic_vector(15 downto 0) := (others => '0'); --               .writedata
		fm_synth_en        : out std_logic;                                        --    conduit_end.export
		fm_synth_note      : out std_logic_vector(9 downto 0);                     --               .export
		fm_synth_mod_depth : out std_logic_vector(3 downto 0);                     --               .export
		fm_synth_volume    : out std_logic_vector(3 downto 0)                      --               .export
	);
end entity fm_synth;

architecture rtl of fm_synth is
	component de2_fm_synth_control is
		port (
			clk                : in  std_logic                     := 'X';             -- clk
			reset_n            : in  std_logic                     := 'X';             -- reset_n
			read               : in  std_logic                     := 'X';             -- read
			write              : in  std_logic                     := 'X';             -- write
			chipselect         : in  std_logic                     := 'X';             -- chipselect
			address            : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- address
			readdata           : out std_logic_vector(15 downto 0);                    -- readdata
			writedata          : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			fm_synth_en        : out std_logic;                                        -- export
			fm_synth_note      : out std_logic_vector(9 downto 0);                     -- export
			fm_synth_mod_depth : out std_logic_vector(3 downto 0);                     -- export
			fm_synth_volume    : out std_logic_vector(3 downto 0)                      -- export
		);
	end component de2_fm_synth_control;

begin

	fm_synth : component de2_fm_synth_control
		port map (
			clk                => clk,                --          clock.clk
			reset_n            => reset_n,            --          reset.reset_n
			read               => read,               -- avalon_slave_0.read
			write              => write,              --               .write
			chipselect         => chipselect,         --               .chipselect
			address            => address,            --               .address
			readdata           => readdata,           --               .readdata
			writedata          => writedata,          --               .writedata
			fm_synth_en        => fm_synth_en,        --    conduit_end.export
			fm_synth_note      => fm_synth_note,      --               .export
			fm_synth_mod_depth => fm_synth_mod_depth, --               .export
			fm_synth_volume    => fm_synth_volume     --               .export
		);

end architecture rtl; -- of fm_synth
