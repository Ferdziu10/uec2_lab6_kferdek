module decode (
    input  wire [3:0] OPcode,
    input  wire       en,
    
    /* [0] - update Carry and Overflow flags; 
     * [1] - update Neg and  Zero flags;
     *  ADD, SUB - update all flags; 
     * AND, OR - update only Neg and Zero
     *  */
    output reg  [1:0] UpdateFlags,
     
    output reg  [1:0] ALUControl,
    output reg  [1:0] RegFileControl
);

//------------------------------------------------------------------------------
// put your code here
always @*
    case (OPcode[1:0])
        2'b00: begin
            ALUControl = 2'b00;
            UpdateFlags = 2'b11;
        end
        2'b01: begin
            ALUControl = 2'b01;
            UpdateFlags = 2'b11;
        end
        2'b10: begin
            ALUControl = 2'b10;
            UpdateFlags = 2'b10;
        end
        2'b11: begin
            ALUControl = 2'b11;
            UpdateFlags = 2'b10;
        end
        default: ALUControl = 2'b00;
    endcase


//------------------------------------------------------------------------------
always @*
    if(!en)
        RegFileControl = 2'b00;
    else
        if(OPcode[3]) // branch
            RegFileControl = 2'b00;
        else begin    // execute
            case(OPcode[2:0])
                3'b000: RegFileControl = 2'b01;
                3'b001: RegFileControl = 2'b01;
                3'b010: RegFileControl = 2'b01;
                3'b011: RegFileControl = 2'b01;
                3'b100: RegFileControl = 2'b11;
                3'b101: RegFileControl = 2'b10;
                3'b111: RegFileControl = 2'b00;
                default: RegFileControl = 2'b00;
            endcase
        end

endmodule
