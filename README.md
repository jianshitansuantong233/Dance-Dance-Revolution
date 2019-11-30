# Dance-Dance-Revolution

The goal for the final project is to create a Dance Dance Revolution type game.

Modules

1. Random Number
Generates random numbers of either 0 and 1.
Inputs: 
Clk: 100MHz Clock signal from board.
Reset: Reset signal sent by user.
Outputs:
Random: Returns either 0 or 1 randomly. If reset is pressed, the module gets set back to 0. 
2. VGA 
Responsible for displaying all the arrows on the screen and calculating user’s score.
Inputs: 
Reset: Resets the game by reinitializing everything to 0. 
vga_clk: Clock signal at which we use to print the arrows on the screen.
Clk_arr (stands for clock arrow): Clock signal at which the red arrows move upwards normally.
Arr: Array with four values to determine which direction arrow to generate along and an additional enable flag. 
Pressed: 4 bit array corresponding to which button is being pressed. 
Outputs: 
VGA_R: Used to color each pixel on the screen row by row depending on the red arrow positions.
VGA_B: Used to color each pixel on the screen row by row depending on the blue arrow positions.
VGA_G: since our project does not print anything green, so it is driven by a constant 0.
VGA_HS and VGA_VS: Horizontal and vertical sync signals.
Score: User’s score get by pressing either up, down, left, or right button. The value is from 0 to 3. 
Update: Flag indicating whether to update score.
3. Display Master
Displays the user’s cumulative score.
Inputs: 
total: User’s total score that we have to display.
Outputs: 
One, Ten, Hundred, Thousand: Score to display for each of their respective digits between 0-9.
AN: used to let 4 seven segment display blink.
CA-CG: Passed to module display.
4. Display
The state machine used to display values
Inputs: 
total: User’s total score that we have to display.
One, Ten, Hundred, Thousand: get from module display_master.
AN: used to see which seven segment display we should set to be on now.
Outputs: 
CA-CG: The seven segments to assign whether to be on or off to actually display the digit.
5. Master Module
Controls clock dividers, decodes the random numbers, and implements a debouncer
Inputs:
Clock: 100 MHz internal clock from FPGA board.
Reset: Reinitializes everything back to 0.
Bu (stands for Button): From player indicating which button was pressed.
Output:
AN: To send to Seven Segment module.
VGA_R, VGA_B, VGA_G, VGA_HS, VGA_VS: to send to VGA module.
