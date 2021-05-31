-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_pilotValidGen.vhd
-- Created: 2021-05-05 22:15:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_pilotValidGen
-- Source Path: OFDM_Tx_HW/OFDMTx/ControlSignalGenerator/pilotValidGen
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_tx_src_pilotValidGen IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_256_0                       :   IN    std_logic;
        enb_1                             :   IN    std_logic;
        y                                 :   OUT   std_logic
        );
END ofdm_tx_src_pilotValidGen;


ARCHITECTURE rtl OF ofdm_tx_src_pilotValidGen IS

  -- Signals
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL AND_out1                         : std_logic;

BEGIN
  NOT_out1 <=  NOT enb_1;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 79
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00#, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        IF NOT_out1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#00#, 7);
        ELSIF enb_1 = '1' THEN 
          IF HDL_Counter_out1 >= to_unsigned(16#4F#, 7) THEN 
            HDL_Counter_out1 <= to_unsigned(16#00#, 7);
          ELSE 
            HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#01#, 7);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 < to_unsigned(16#20#, 7) ELSE
      '0';

  
  Compare_To_Constant1_out1 <= '1' WHEN HDL_Counter_out1 > to_unsigned(16#1B#, 7) ELSE
      '0';

  AND_out1 <= Compare_To_Constant_out1 AND Compare_To_Constant1_out1;

  y <= AND_out1;

END rtl;

