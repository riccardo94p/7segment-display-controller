# 7segment-display-controller
The purpose of this project was to implement the description of a controller for a 7-segment display using VHDL code. Furthermore, it was required to synthetize the project by using the Vivado Software.

![alt text][fig1]

A user selects which one of the four segments to use through thedigitselectinput  and  then  alters  the  digit  input  in  order  to  display  the  required  number.  The controller will read thedigitselectinput and correctly enable therequired display before setting it through the segments output line.  The conversion between the BCD digit and the segments encoding happens accordingto to the standard truth table found in most Electronics textbooks.

[fig1]: https://github.com/riccardo94p/7segment-display-controller/blob/master/img/display.jpg "Logic scheme"
