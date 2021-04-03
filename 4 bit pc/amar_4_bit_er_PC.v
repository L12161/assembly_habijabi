module amar_4_bit_er_PC (
  clk,AX,BX,uiui,
  A_OUT,B_OUT,
  CARRY_FLAG,ZERO_FLAG,
  instruction,I_WANNA_SHOW_THE_OUTPUT,
  stack_pointer,index_pointer,SEQUENTIAL);
  input [3:0]AX;
  input [3:0]BX;
  input clk;
  input [3:0] instruction;
  input SEQUENTIAL;
  output uiui;
  output reg [3:0]A_OUT,B_OUT,I_WANNA_SHOW_THE_OUTPUT;
  
  // all the flags 
  output reg CARRY_FLAG;
  output reg ZERO_FLAG;
  output reg [3:0]stack_pointer;
  output reg [3:0]index_pointer;

  reg [3:0]SLACK_M[15:0];
  reg [3:0]INTERM;
  reg CARRY_IN;
  reg [3:0]instruction_no;
  reg [3:0]memo[15:0]; // for proper simulation of ram memory in PC
  reg address;


  
  
  
  always @(posedge clk)
    
    if (SEQUENTIAL == 0)
    begin 
		begin
		  index_pointer = 4'b 0001;
		  stack_pointer = 4'b 0010;
		  instruction_no = instruction;
		  CARRY_IN = 1'b0;
		  address = 1'b 1;
		  memo[address]= 4'b 0010;
		  SLACK_M [4'b 0001] = 4'b 1001;  
		  SLACK_M[4'b 0010] = 4'b 1111;
		  
		  case(instruction_no)
	//----------------------------------------------        
			4'b 0001 : // 4 bit full adder ADD A,B
			  begin
				  {CARRY_FLAG,A_OUT} = AX + BX ;        
				  //CARRY_FLAG = (AX & BX)  |  (AX & CARRY_IN)  |  (BX & CARRY_IN);
				  //instruction_no = instruction_no+ 1'b 1;
			  end
	 //----------------------------------------------       
			4'b 0010 : // 4 bit subtraction SUB A,B
			  begin
				   INTERM = ~BX;
				  {CARRY_FLAG,A_OUT} = AX + INTERM ;        
				  //CARRY_FLAG = (AX & BX)  |  (AX & CARRY_IN)  |  (BX & CARRY_IN);
				  //instruction_no = instruction_no+ 1'b 1;
			  end
	 //------------------------------------------------
			4'b 0011 : // exchange
			  begin
				A_OUT = BX;
				B_OUT = AX;
			   //instruction_no = instruction_no+ 1'b 1;
			  end
	 //------------------------------------------------      
			4'b 0100 : // 4. RCL B
			  begin
				 B_OUT[3:0] = {BX[2:0],BX[3]} ;
				 CARRY_FLAG = BX[3];
				//instruction_no = instruction_no+ 1'b 1;
			  end 
	 //------------------------------------------------     
			4'b 0101 : // 5.SHR A
			  begin
				 A_OUT[2:0] = AX[3:1];
				 A_OUT[3] = 0;
				CARRY_FLAG = AX[0];
				//instruction_no = instruction_no+ 1'b 1;           
			  end
	 //------------------------------------------------     
			4'b 0110 : // 6. MOV [address] ,A
			 begin
			   memo[address] = AX;
			   I_WANNA_SHOW_THE_OUTPUT = memo[address];
			   //instruction_no = instruction_no+ 1'b 1;
	  
			 end       
	 //------------------------------------------------     
			4'b 0111 : // 7. XOR  A,[ADDRESS]
			 begin
			   A_OUT = AX^memo[address];
			   //instruction_no = instruction_no+ 1'b 1;
			 end 
	 //------------------------------------------------        
			4'b 1000 : // 8. AND  A,B
			 begin
			   A_OUT = AX&BX;
			   //instruction_no = instruction_no+ 1'b 1;
			 end       
	 //------------------------------------------------         
			4'b 1001 : // 9. OR  B,[ADDRESS]
			 begin
			   B_OUT = BX|memo[address];
			   //memo[address]= 4'b 0010
			   //instruction_no = instruction_no+ 1'b 1;
			 end
	 //------------------------------------------------        
			4'b 1010 : // 10. OUT  A
			 begin
				A_OUT = AX;
			   //instruction_no = instruction_no+ 1'b 1;
			 end
	 //------------------------------------------------        
			4'b 1011 : // 11. JZ  ADDRESS
			 begin
			   if (ZERO_FLAG == 1) instruction_no = address;
			   //instruction_no = instruction_no+ 1'b 1;          
			 end 
	 //------------------------------------------------         
			4'b 1100 : // 12. PUSH  B
			 begin
			   SLACK_M [4'b 0010] = BX;
			   I_WANNA_SHOW_THE_OUTPUT = SLACK_M [4'b 0010];
			   //instruction_no = instruction_no+ 1'b 1;          
			 end
	 //------------------------------------------------         
			 4'b 1101 : // 13. pop  B
			 begin
			   B_OUT = SLACK_M [4'b 0010];
			   //SLACK_M[4'b 0010] = 4'b 1111;
			   //instruction_no = instruction_no+ 1'b 1;
			   
			 end
	 //------------------------------------------------         
			4'b 1110 : //14. CALL  ADDRESS
			  begin
				SLACK_M[stack_pointer] = index_pointer;
				// index_pointer = 4'b 0001;
				index_pointer = address;
				// address = 1'b 1;
				stack_pointer = stack_pointer + 4'b 0001;
				
			  //instruction_no = instruction_no+ 1'b 1;  
			  end
	 //------------------------------------------------        
			4'b 1111: //ret
			begin 
			  stack_pointer = stack_pointer - 1 ;
			  index_pointer = SLACK_M[stack_pointer];
			  //instruction_no = instruction_no+ 1'b 1;  
			end
			
	 //------------------------------------------------        
			default:
			/* nothing happens here, and as the same case 
			every posedge, the outcome will be constant */
			;
		  endcase
    end   
    end
    
  
    
endmodule



