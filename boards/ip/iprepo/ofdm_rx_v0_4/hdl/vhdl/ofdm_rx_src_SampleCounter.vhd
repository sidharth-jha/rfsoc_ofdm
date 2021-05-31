-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\OFDM_rx\hdlsrc\OFDM_Rx_HW\ofdm_rx_src_SampleCounter.vhd
-- Created: 2021-02-25 17:36:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_rx_src_SampleCounter
-- Source Path: OFDM_Rx_HW/OFDMRx/PhaseTracking_1/PilotCtrlGen/SampleCounter
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_rx_src_SampleCounter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_384_0                       :   IN    std_logic;
        Valid_In                          :   IN    std_logic;
        Sample_Cnt                        :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
        );
END ofdm_rx_src_SampleCounter;


ARCHITECTURE rtl OF ofdm_rx_src_SampleCounter IS

  -- Signals
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL SAMPLE_COUNTER_out1              : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Delay_out1                       : unsigned(5 DOWNTO 0);  -- ufix6

BEGIN
  Logical_Operator_out1 <=  NOT Valid_In;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 51
  SAMPLE_COUNTER_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SAMPLE_COUNTER_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        IF Logical_Operator_out1 = '1' THEN 
          SAMPLE_COUNTER_out1 <= to_unsigned(16#00#, 6);
        ELSIF Valid_In = '1' THEN 
          IF SAMPLE_COUNTER_out1 >= to_unsigned(16#33#, 6) THEN 
            SAMPLE_COUNTER_out1 <= to_unsigned(16#00#, 6);
          ELSE 
            SAMPLE_COUNTER_out1 <= SAMPLE_COUNTER_out1 + to_unsigned(16#01#, 6);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS SAMPLE_COUNTER_process;


  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= to_unsigned(16#00#, 6);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_384_0 = '1' THEN
        Delay_out1 <= SAMPLE_COUNTER_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Sample_Cnt <= std_logic_vector(Delay_out1);

END rtl;

