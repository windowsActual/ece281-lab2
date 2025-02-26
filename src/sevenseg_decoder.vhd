----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Joshua Burke
-- 
-- Create Date: 02/24/2025 08:32:41 AM
-- Design Name: 
-- Module Name: sevenseg_decoder - Behavioral
-- Project Name: Lab2
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder is -- make me a box
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_sen_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is
    -- include components declarations and signals
    -- signal w_user_input : std_logic_vector(3 downto 0);
    -- signal w_mux_output : std_logic_vector(6 downto 0);
begin
    -- Concurrent statements --
    with i_Hex select o_sen_n <= 
               "1000000" when "0000",
               "1111001" when "0001",
               "0100100" when "0010",
               "0110000" when "0011",
               "0011001" when "0100",
               "0010010" when "0101",
               "0000010" when "0110",
               "1111000" when "0111",
               "0000000" when "1000",
               "0011000" when "1001",
               "0001000" when "1010",
               "0000011" when "1011",
               "0100111" when "1100",
               "0100001" when "1101",
               "0000110" when "1110",
               "0001110" when "1111",
               "1111111" when others;
end Behavioral;
