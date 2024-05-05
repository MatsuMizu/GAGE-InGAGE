module HDL_FLOP (CLOCK  , RESETN  ,  D  , Q ) ;  
 
 input CLOCK  , RESETN ;
 input  D  ;
 output Q  ; 
  
 reg Q ;
 
   always @(posedge CLOCK or negedge RESETN)
     begin
        if (RESETN == 0) Q <= #(0.5) 0;           
        else Q <= #(0.5) D;           
     end
    
endmodule
