-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_WriteEnbAddrGen.vhd
-- Created: 2021-02-25 17:36:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_WriteEnbAddrGen
-- Source Path: OFDM_Rx_HW/OFDMRx/ChannelEstEq/ChannelEstimate/WriteEnbAddrGen
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_WriteEnbAddrGen IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_384_0                       :   IN    std_logic;
        In1                               :   IN    std_logic;
        Out1                              :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        Out2                              :   OUT   std_logic
        );
END ofdm_rx_src_WriteEnbAddrGen;


ARCHITECTURE rtl OF ofdm_rx_src_WriteEnbAddrGen IS

  -- Signals
  SIGNAL HDL_Counter2_out1                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL HDL_Counter1_out1                : unsigned(5 DOWNTO 0);  -- ufix6

BEGIN
  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 127
  HDL_Counter2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter2_out1 <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' AND In1 = '1' THEN
        HDL_Counter2_out1 <= HDL_Counter2_out1 + to_unsigned(16#01#, 7);
      END IF;
    END IF;
  END PROCESS HDL_Counter2_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter2_out1 >= to_unsigned(16#40#, 7) ELSE
      '0';

  Compare_To_Constant1_out1 <= '1';

  AND_out1 <= Compare_To_Constant_out1 AND Compare_To_Constant1_out1;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 63
  HDL_Counter1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' AND AND_out1 = '1' THEN
        HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(16#01#, 6);
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  Out1 <= std_logic_vector(HDL_Counter1_out1);

  Out2 <= AND_out1;

END rtl;

