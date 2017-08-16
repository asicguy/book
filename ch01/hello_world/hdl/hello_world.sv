///////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2017 Francis Bruno, All Rights Reserved
// 
//  This program is free software; you can redistribute it and/or modify it 
//  under the terms of the GNU General Public License as published by the Free 
//  Software Foundation; either version 3 of the License, or (at your option) 
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but 
//  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
//  or FITNESS FOR A PARTICULAR PURPOSE. 
//  See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with
//  this program; if not, see <http://www.gnu.org/licenses>.
//
//  This code is available under licenses for commercial use free of GPL 
//  restrictions. Please contact Francis Bruno for more information.
//
//  http://www.asicsolutions.com
//  
///////////////////////////////////////////////////////////////////////////////
//
//  Description :
//  Simple Hello World Example
//
//////////////////////////////////////////////////////////////////////////////
//
//  Modules Instantiated:
//
///////////////////////////////////////////////////////////////////////////////
//
//  Modification History:
//
//  $Log:$
//
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 10 ps
module hello_world
  #
  (
   parameter     NUM_CLK = 2
   )
  (
   input 	clk,
   input 	rst,
   
   output logic done
   );

  logic [NUM_CLK-1:0] delay_reg;

  initial begin
    delay_reg = '0;
    done      = '0;
  end

  always_ff @(posedge clk, posedge rst)
    if (rst) begin
      delay_reg <= '0;
      done      <= '0;
    end else begin
      /* verilator lint_off WIDTH */
      delay_reg <= (delay_reg << 1) | 1'b1;
      /* lint_on */
      if (delay_reg[$left(delay_reg)]) begin
	done <= '1;
      end
    end
endmodule // hello_world

  
