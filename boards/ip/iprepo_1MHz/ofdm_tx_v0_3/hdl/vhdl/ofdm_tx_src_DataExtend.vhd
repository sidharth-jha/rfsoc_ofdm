-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\OFDM_Tx_HW\ofdm_tx_src_DataExtend.vhd
-- Created: 2021-05-05 22:15:53
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_tx_src_DataExtend
-- Source Path: OFDM_Tx_HW/OFDMTx/CPAdd/DataExtend
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_tx_src_OFDMTx_pkg.ALL;

ENTITY ofdm_tx_src_DataExtend IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_256_0                       :   IN    std_logic;
        enb_1_256_1                       :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataValid                         :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataValidOut                      :   OUT   std_logic
        );
END ofdm_tx_src_DataExtend;


ARCHITECTURE rtl OF ofdm_tx_src_DataExtend IS

  -- Component Declarations
  COMPONENT ofdm_tx_src_READ_CTRL2
    PORT( In1                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          In2                             :   IN    std_logic;
          Out1                            :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT ofdm_tx_src_DualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_256_0                     :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_din_im                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_dout_re                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_dout_im                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_re                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout_im                      :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_tx_src_READ_CTRL2
    USE ENTITY work.ofdm_tx_src_READ_CTRL2(rtl);

  FOR ALL : ofdm_tx_src_DualPortRAM_generic
    USE ENTITY work.ofdm_tx_src_DualPortRAM_generic(rtl);

  -- Constants
  CONSTANT READ_ADDRESS_data              : vector_of_unsigned8(0 TO 159) := 
    (to_unsigned(16#40#, 8), to_unsigned(16#41#, 8), to_unsigned(16#42#, 8), to_unsigned(16#43#, 8),
     to_unsigned(16#44#, 8), to_unsigned(16#45#, 8), to_unsigned(16#46#, 8), to_unsigned(16#47#, 8),
     to_unsigned(16#48#, 8), to_unsigned(16#49#, 8), to_unsigned(16#4A#, 8), to_unsigned(16#4B#, 8),
     to_unsigned(16#4C#, 8), to_unsigned(16#4D#, 8), to_unsigned(16#4E#, 8), to_unsigned(16#4F#, 8),
     to_unsigned(16#10#, 8), to_unsigned(16#11#, 8), to_unsigned(16#12#, 8), to_unsigned(16#13#, 8),
     to_unsigned(16#14#, 8), to_unsigned(16#15#, 8), to_unsigned(16#16#, 8), to_unsigned(16#17#, 8),
     to_unsigned(16#18#, 8), to_unsigned(16#19#, 8), to_unsigned(16#1A#, 8), to_unsigned(16#1B#, 8),
     to_unsigned(16#1C#, 8), to_unsigned(16#1D#, 8), to_unsigned(16#1E#, 8), to_unsigned(16#1F#, 8),
     to_unsigned(16#20#, 8), to_unsigned(16#21#, 8), to_unsigned(16#22#, 8), to_unsigned(16#23#, 8),
     to_unsigned(16#24#, 8), to_unsigned(16#25#, 8), to_unsigned(16#26#, 8), to_unsigned(16#27#, 8),
     to_unsigned(16#28#, 8), to_unsigned(16#29#, 8), to_unsigned(16#2A#, 8), to_unsigned(16#2B#, 8),
     to_unsigned(16#2C#, 8), to_unsigned(16#2D#, 8), to_unsigned(16#2E#, 8), to_unsigned(16#2F#, 8),
     to_unsigned(16#30#, 8), to_unsigned(16#31#, 8), to_unsigned(16#32#, 8), to_unsigned(16#33#, 8),
     to_unsigned(16#34#, 8), to_unsigned(16#35#, 8), to_unsigned(16#36#, 8), to_unsigned(16#37#, 8),
     to_unsigned(16#38#, 8), to_unsigned(16#39#, 8), to_unsigned(16#3A#, 8), to_unsigned(16#3B#, 8),
     to_unsigned(16#3C#, 8), to_unsigned(16#3D#, 8), to_unsigned(16#3E#, 8), to_unsigned(16#3F#, 8),
     to_unsigned(16#40#, 8), to_unsigned(16#41#, 8), to_unsigned(16#42#, 8), to_unsigned(16#43#, 8),
     to_unsigned(16#44#, 8), to_unsigned(16#45#, 8), to_unsigned(16#46#, 8), to_unsigned(16#47#, 8),
     to_unsigned(16#48#, 8), to_unsigned(16#49#, 8), to_unsigned(16#4A#, 8), to_unsigned(16#4B#, 8),
     to_unsigned(16#4C#, 8), to_unsigned(16#4D#, 8), to_unsigned(16#4E#, 8), to_unsigned(16#4F#, 8),
     to_unsigned(16#90#, 8), to_unsigned(16#91#, 8), to_unsigned(16#92#, 8), to_unsigned(16#93#, 8),
     to_unsigned(16#94#, 8), to_unsigned(16#95#, 8), to_unsigned(16#96#, 8), to_unsigned(16#97#, 8),
     to_unsigned(16#98#, 8), to_unsigned(16#99#, 8), to_unsigned(16#9A#, 8), to_unsigned(16#9B#, 8),
     to_unsigned(16#9C#, 8), to_unsigned(16#9D#, 8), to_unsigned(16#9E#, 8), to_unsigned(16#9F#, 8),
     to_unsigned(16#60#, 8), to_unsigned(16#61#, 8), to_unsigned(16#62#, 8), to_unsigned(16#63#, 8),
     to_unsigned(16#64#, 8), to_unsigned(16#65#, 8), to_unsigned(16#66#, 8), to_unsigned(16#67#, 8),
     to_unsigned(16#68#, 8), to_unsigned(16#69#, 8), to_unsigned(16#6A#, 8), to_unsigned(16#6B#, 8),
     to_unsigned(16#6C#, 8), to_unsigned(16#6D#, 8), to_unsigned(16#6E#, 8), to_unsigned(16#6F#, 8),
     to_unsigned(16#70#, 8), to_unsigned(16#71#, 8), to_unsigned(16#72#, 8), to_unsigned(16#73#, 8),
     to_unsigned(16#74#, 8), to_unsigned(16#75#, 8), to_unsigned(16#76#, 8), to_unsigned(16#77#, 8),
     to_unsigned(16#78#, 8), to_unsigned(16#79#, 8), to_unsigned(16#7A#, 8), to_unsigned(16#7B#, 8),
     to_unsigned(16#7C#, 8), to_unsigned(16#7D#, 8), to_unsigned(16#7E#, 8), to_unsigned(16#7F#, 8),
     to_unsigned(16#80#, 8), to_unsigned(16#81#, 8), to_unsigned(16#82#, 8), to_unsigned(16#83#, 8),
     to_unsigned(16#84#, 8), to_unsigned(16#85#, 8), to_unsigned(16#86#, 8), to_unsigned(16#87#, 8),
     to_unsigned(16#88#, 8), to_unsigned(16#89#, 8), to_unsigned(16#8A#, 8), to_unsigned(16#8B#, 8),
     to_unsigned(16#8C#, 8), to_unsigned(16#8D#, 8), to_unsigned(16#8E#, 8), to_unsigned(16#8F#, 8),
     to_unsigned(16#90#, 8), to_unsigned(16#91#, 8), to_unsigned(16#92#, 8), to_unsigned(16#93#, 8),
     to_unsigned(16#94#, 8), to_unsigned(16#95#, 8), to_unsigned(16#96#, 8), to_unsigned(16#97#, 8),
     to_unsigned(16#98#, 8), to_unsigned(16#99#, 8), to_unsigned(16#9A#, 8), to_unsigned(16#9B#, 8),
     to_unsigned(16#9C#, 8), to_unsigned(16#9D#, 8), to_unsigned(16#9E#, 8), to_unsigned(16#9F#, 8));  -- ufix8 [160]

  -- Signals
  SIGNAL HDL_Counter1_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter1_out1_1              : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL dataValid_1                      : std_logic;
  SIGNAL reduced_reg                      : std_logic_vector(0 TO 78);  -- ufix1 [79]
  SIGNAL dataValid_2                      : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_out1_1               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL READ_ADDRESS_k                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL READ_ADDRESS_out1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL READ_ADDRESS_out1_1              : unsigned(7 DOWNTO 0) := to_unsigned(16#00#, 8);  -- uint8
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Delay1_out1_1                    : std_logic;
  SIGNAL READ_CTRL2_out1                  : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL READ_CTRL2_out1_unsigned         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Dual_Port_RAM21_bypass_reg       : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL READ_CTRL2_out1_1                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Dual_Port_RAM2_out1_re           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM2_out1_im           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM2_out2_re           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM2_out2_im           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM2_out2_re_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Dual_Port_RAM2_out2_im_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay4_reg_re                    : vector_of_signed16(0 TO 79);  -- sfix16_En14 [80]
  SIGNAL Delay4_reg_im                    : vector_of_signed16(0 TO 79);  -- sfix16_En14 [80]
  SIGNAL Delay4_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay4_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay2_reg                       : std_logic_vector(0 TO 80);  -- ufix1 [81]
  SIGNAL Delay2_out1                      : std_logic;

BEGIN
  u_READ_CTRL2 : ofdm_tx_src_READ_CTRL2
    PORT MAP( In1 => std_logic_vector(READ_ADDRESS_out1_1),  -- uint8
              In2 => Delay1_out1_1,
              Out1 => READ_CTRL2_out1  -- uint8
              );

  u_Dual_Port_RAM2 : ofdm_tx_src_DualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb_1_256_0 => enb_1_256_0,
              wr_din_re => dataIn_re,
              wr_din_im => dataIn_im,
              wr_addr => std_logic_vector(HDL_Counter1_out1_1),
              wr_en => dataValid_1,
              rd_addr => std_logic_vector(READ_CTRL2_out1_1),
              wr_dout_re => Dual_Port_RAM2_out1_re,
              wr_dout_im => Dual_Port_RAM2_out1_im,
              rd_dout_re => Dual_Port_RAM2_out2_re,
              rd_dout_im => Dual_Port_RAM2_out2_im
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 159
  HDL_Counter1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        IF dataValid = '1' THEN 
          IF HDL_Counter1_out1 >= to_unsigned(16#9F#, 8) THEN 
            HDL_Counter1_out1 <= to_unsigned(16#00#, 8);
          ELSE 
            HDL_Counter1_out1 <= HDL_Counter1_out1 + to_unsigned(16#01#, 8);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  delayMatch1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter1_out1_1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        HDL_Counter1_out1_1 <= HDL_Counter1_out1;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataValid_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        dataValid_1 <= dataValid;
      END IF;
    END IF;
  END PROCESS reduced_process;


  reduced_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reduced_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        reduced_reg(0) <= dataValid_1;
        reduced_reg(1 TO 78) <= reduced_reg(0 TO 77);
      END IF;
    END IF;
  END PROCESS reduced_1_process;

  dataValid_2 <= reduced_reg(78);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 159
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        IF dataValid_2 = '1' THEN 
          IF HDL_Counter_out1 >= to_unsigned(16#9F#, 8) THEN 
            HDL_Counter_out1 <= to_unsigned(16#00#, 8);
          ELSE 
            HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#01#, 8);
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  HDL_Counter_out1_1 <= HDL_Counter_out1;

  
  READ_ADDRESS_k <= to_unsigned(16#00#, 8) WHEN HDL_Counter_out1_1 = to_unsigned(16#00#, 8) ELSE
      to_unsigned(16#9F#, 8) WHEN HDL_Counter_out1_1 >= to_unsigned(16#9F#, 8) ELSE
      HDL_Counter_out1_1;
  READ_ADDRESS_out1 <= READ_ADDRESS_data(to_integer(READ_ADDRESS_k));

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        READ_ADDRESS_out1_1 <= READ_ADDRESS_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  Delay1_out1 <= dataValid_2;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay1_out1_1 <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  READ_CTRL2_out1_unsigned <= unsigned(READ_CTRL2_out1);

  Dual_Port_RAM21_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Dual_Port_RAM21_bypass_reg <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_1 = '1' THEN
        Dual_Port_RAM21_bypass_reg <= READ_CTRL2_out1_unsigned;
      END IF;
    END IF;
  END PROCESS Dual_Port_RAM21_bypass_process;

  
  READ_CTRL2_out1_1 <= READ_CTRL2_out1_unsigned WHEN enb_1_256_1 = '1' ELSE
      Dual_Port_RAM21_bypass_reg;

  Dual_Port_RAM2_out2_re_signed <= signed(Dual_Port_RAM2_out2_re);

  Dual_Port_RAM2_out2_im_signed <= signed(Dual_Port_RAM2_out2_im);

  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_reg_re <= (OTHERS => to_signed(16#0000#, 16));
      Delay4_reg_im <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        Delay4_reg_im(0) <= Dual_Port_RAM2_out2_im_signed;
        Delay4_reg_im(1 TO 79) <= Delay4_reg_im(0 TO 78);
        Delay4_reg_re(0) <= Dual_Port_RAM2_out2_re_signed;
        Delay4_reg_re(1 TO 79) <= Delay4_reg_re(0 TO 78);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1_re <= Delay4_reg_re(79);
  Delay4_out1_im <= Delay4_reg_im(79);

  dataOut_re <= std_logic_vector(Delay4_out1_re);

  dataOut_im <= std_logic_vector(Delay4_out1_im);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_256_0 = '1' THEN
        Delay2_reg(0) <= dataValid_2;
        Delay2_reg(1 TO 80) <= Delay2_reg(0 TO 79);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(80);

  dataValidOut <= Delay2_out1;

END rtl;

