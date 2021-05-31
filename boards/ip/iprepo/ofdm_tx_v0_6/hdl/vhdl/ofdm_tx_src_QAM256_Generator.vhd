-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm_workspace\models\hdl_prj\OFDM_tx\hdlsrc\OFDM_Tx_Rx_fixed_point\ofdm_tx_src_QAM256_Generator.vhd
-- Created: 2021-02-02 15:48:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_QAM256_Generator
-- Source Path: OFDM_Tx_Rx_fixed_point/OFDMTx/DataGenerator/RF Signal Generator/Variable Modulator/QAM256 Generator
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_QAM256_Generator IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_384_0                       :   IN    std_logic;
        Data                              :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        Reset_1                           :   IN    std_logic;
        Enable                            :   IN    std_logic;
        I_symbols                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        Q_symbols                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_tx_src_QAM256_Generator;


ARCHITECTURE rtl OF ofdm_tx_src_QAM256_Generator IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_complement_re_block
    PORT( d_in                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          d_out                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_complement_im_block
    PORT( d_in                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          d_out                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_complement_re_block
    USE ENTITY work.ofdm_tx_src_complement_re_block(rtl);

  FOR ALL : ofdm_tx_src_complement_im_block
    USE ENTITY work.ofdm_tx_src_complement_im_block(rtl);

  -- Signals
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL Reset_2                          : std_logic;
  SIGNAL Data_unsigned                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Constant1_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant5_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant2_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant6_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant7_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant3_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant4_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant8_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch_out1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL complement_re_out1               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL complement_re_out1_signed        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch2_out1           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_iv                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_delOut                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_ectrl                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_toDelay                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_bypassIn                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_out1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_last_value                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Bit_Slice4_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Multiport_Switch1_out1           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL complement_im_out1               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL complement_im_out1_signed        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch3_out1           : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_iv                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_delOut                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_ectrl                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_toDelay                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_bypassIn                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_out1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_last_value                : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  u_complement_re : ofdm_tx_src_complement_re_block
    PORT MAP( d_in => std_logic_vector(Multiport_Switch_out1),  -- sfix16_En14
              d_out => complement_re_out1  -- sfix16_En14
              );

  u_complement_im : ofdm_tx_src_complement_im_block
    PORT MAP( d_in => std_logic_vector(Multiport_Switch1_out1),  -- sfix16_En14
              d_out => complement_im_out1  -- sfix16_En14
              );

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        reduced_reg(0) <= Reset_1;
        reduced_reg(1) <= reduced_reg(0);
      END IF;
    END IF;
  END PROCESS reduced_process;

  Reset_2 <= reduced_reg(1);

  Data_unsigned <= unsigned(Data);

  Bit_Slice3_out1 <= Data_unsigned(6);

  Bit_Slice2_out1 <= Data_unsigned(2 DOWNTO 0);

  Constant1_out1 <= to_signed(16#40CD#, 16);

  Constant5_out1 <= to_signed(16#3829#, 16);

  Constant2_out1 <= to_signed(16#2F85#, 16);

  Constant6_out1 <= to_signed(16#26E1#, 16);

  Constant7_out1 <= to_signed(16#1E3D#, 16);

  Constant3_out1 <= to_signed(16#159A#, 16);

  Constant4_out1 <= to_signed(16#0CF6#, 16);

  Constant8_out1 <= to_signed(16#0452#, 16);

  
  Multiport_Switch_out1 <= Constant1_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#0#, 3) ELSE
      Constant5_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#1#, 3) ELSE
      Constant2_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#2#, 3) ELSE
      Constant6_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#3#, 3) ELSE
      Constant7_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#4#, 3) ELSE
      Constant3_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#5#, 3) ELSE
      Constant4_out1 WHEN Bit_Slice2_out1 = to_unsigned(16#6#, 3) ELSE
      Constant8_out1;

  complement_re_out1_signed <= signed(complement_re_out1);

  
  Multiport_Switch2_out1 <= Multiport_Switch_out1 WHEN Bit_Slice3_out1 = '0' ELSE
      complement_re_out1_signed;

  Delay1_iv <= to_signed(16#0000#, 16);

  
  Delay1_ectrl <= Delay1_delOut WHEN Enable = '0' ELSE
      Multiport_Switch2_out1;

  
  Delay1_toDelay <= Delay1_ectrl WHEN Reset_2 = '0' ELSE
      Delay1_iv;

  Delay1_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_delOut <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay1_delOut <= Delay1_toDelay;
      END IF;
    END IF;
  END PROCESS Delay1_lowered_process;


  
  Delay1_bypassIn <= Delay1_delOut WHEN Reset_2 = '0' ELSE
      Delay1_iv;

  Delay1_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_last_value <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay1_last_value <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS Delay1_bypass_process;


  
  Delay1_out1 <= Delay1_last_value WHEN Enable = '0' ELSE
      Delay1_bypassIn;

  I_symbols <= std_logic_vector(Delay1_out1);

  Bit_Slice4_out1 <= Data_unsigned(7);

  Bit_Slice1_out1 <= Data_unsigned(5 DOWNTO 3);

  
  Multiport_Switch1_out1 <= Constant1_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#0#, 3) ELSE
      Constant5_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#1#, 3) ELSE
      Constant2_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#2#, 3) ELSE
      Constant6_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#3#, 3) ELSE
      Constant7_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#4#, 3) ELSE
      Constant3_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#5#, 3) ELSE
      Constant4_out1 WHEN Bit_Slice1_out1 = to_unsigned(16#6#, 3) ELSE
      Constant8_out1;

  complement_im_out1_signed <= signed(complement_im_out1);

  
  Multiport_Switch3_out1 <= Multiport_Switch1_out1 WHEN Bit_Slice4_out1 = '0' ELSE
      complement_im_out1_signed;

  Delay2_iv <= to_signed(16#0000#, 16);

  
  Delay2_ectrl <= Delay2_delOut WHEN Enable = '0' ELSE
      Multiport_Switch3_out1;

  
  Delay2_toDelay <= Delay2_ectrl WHEN Reset_2 = '0' ELSE
      Delay2_iv;

  Delay2_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_delOut <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay2_delOut <= Delay2_toDelay;
      END IF;
    END IF;
  END PROCESS Delay2_lowered_process;


  
  Delay2_bypassIn <= Delay2_delOut WHEN Reset_2 = '0' ELSE
      Delay2_iv;

  Delay2_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_last_value <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay2_last_value <= Delay2_out1;
      END IF;
    END IF;
  END PROCESS Delay2_bypass_process;


  
  Delay2_out1 <= Delay2_last_value WHEN Enable = '0' ELSE
      Delay2_bypassIn;

  Q_symbols <= std_logic_vector(Delay2_out1);

END rtl;

