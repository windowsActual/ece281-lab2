----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Joshua Burke
-- 
-- Create Date: 02/24/2025 08:02:29 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    
    -- declare the component of your top-level design unit
    component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_sen_n : out STD_LOGIC_VECTOR (6 downto 0)
           );
    end component sevenseg_decoder;
    
    -- declare signals
    signal w_user_input : std_logic_vector(3 downto 0);
    signal w_mux_output : std_logic_vector(6 downto 0);
   
begin
    -- PORT MAP --
    sevenseg_decoder_tb : sevenseg_decoder port map (
        i_Hex   => w_user_input(3 downto 0),
        o_sen_n => w_mux_output(6 downto 0)
             
    );
    
    -- PROCESSES --
    -- Test Plan Process
    test_process : process
    begin
        -- Test input 0000, should output 0
        w_user_input <= "0000"; wait for 10ns;
            assert (w_mux_output = "1000000") report "Bad w/ all 0s" severity failure;
        -- Test input 1111, should output an F
        w_user_input <= "1111"; wait for 10ns;
            assert (w_mux_output = "0001110") report "Bad w/ all 1s" severity failure;
        w_user_input <= "1000"; wait for 10ns;
            assert (w_mux_output = "0000000") report "Bad w/ all 1000" severity failure;
        wait; -- wait forever lol
    end process;
    ---

end Behavioral;
