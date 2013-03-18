  --Example instantiation for system 'nios_system'
  nios_system_inst : nios_system
    port map(
      SRAM_ADDR_from_the_sram => SRAM_ADDR_from_the_sram,
      SRAM_CE_N_from_the_sram => SRAM_CE_N_from_the_sram,
      SRAM_DQ_to_and_from_the_sram => SRAM_DQ_to_and_from_the_sram,
      SRAM_LB_N_from_the_sram => SRAM_LB_N_from_the_sram,
      SRAM_OE_N_from_the_sram => SRAM_OE_N_from_the_sram,
      SRAM_UB_N_from_the_sram => SRAM_UB_N_from_the_sram,
      SRAM_WE_N_from_the_sram => SRAM_WE_N_from_the_sram,
      fm_synth_en_from_the_fm_synth => fm_synth_en_from_the_fm_synth,
      fm_synth_mod_depth_from_the_fm_synth => fm_synth_mod_depth_from_the_fm_synth,
      fm_synth_note_from_the_fm_synth => fm_synth_note_from_the_fm_synth,
      fm_synth_volume_from_the_fm_synth => fm_synth_volume_from_the_fm_synth,
      PS2_Clk_to_the_de2_ps2_0 => PS2_Clk_to_the_de2_ps2_0,
      PS2_Data_to_the_de2_ps2_0 => PS2_Data_to_the_de2_ps2_0,
      clk_0 => clk_0,
      reset_n => reset_n
    );


