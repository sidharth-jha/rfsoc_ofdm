-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_Sq1.vhd
-- Created: 2021-02-25 17:36:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_Sq1
-- Source Path: OFDM_Rx_HW/OFDMRx/Synchronisation/SchmidlCoxMetric /Sq1
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_Sq1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        enb_1_384_1                       :   IN    std_logic;
        enb_1_384_0                       :   IN    std_logic;
        In1                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En15
        Out1                              :   OUT   std_logic_vector(35 DOWNTO 0)  -- sfix36_En30
        );
END ofdm_rx_src_Sq1;


ARCHITECTURE rtl OF ofdm_rx_src_Sq1 IS

  -- Signals
  SIGNAL In1_signed                       : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Delay_out1                       : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Delay_out1_1                     : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Delay_out1_2                     : signed(17 DOWNTO 0);  -- sfix18_En15
  SIGNAL Product_out1                     : signed(35 DOWNTO 0);  -- sfix36_En30
  SIGNAL Product_out1_1                   : signed(35 DOWNTO 0);  -- sfix36_En30
  SIGNAL Delay1_bypass_reg                : signed(35 DOWNTO 0);  -- sfix36
  SIGNAL Product_out1_2                   : signed(35 DOWNTO 0);  -- sfix36_En30

BEGIN
  In1_signed <= signed(In1);

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= to_signed(16#00000#, 18);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay_out1 <= In1_signed;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay_out1_1 <= Delay_out1;

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1_2 <= to_signed(16#00000#, 18);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Delay_out1_2 <= Delay_out1_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Product_out1 <= Delay_out1_2 * Delay_out1_2;

  PipelineRegister_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_out1_1 <= to_signed(0, 36);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Product_out1_1 <= Product_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  Delay1_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_bypass_reg <= to_signed(0, 36);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_1 = '1' THEN
        Delay1_bypass_reg <= Product_out1_1;
      END IF;
    END IF;
  END PROCESS Delay1_bypass_process;

  
  Product_out1_2 <= Product_out1_1 WHEN enb_1_384_1 = '1' ELSE
      Delay1_bypass_reg;

  Out1 <= std_logic_vector(Product_out1_2);

END rtl;

