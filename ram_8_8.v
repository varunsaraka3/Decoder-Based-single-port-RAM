module ram_8_8(
    input clk, rst, we,cs ,oe,
    input [2:0] addr,
    inout [7:0] data
    );
    reg [7:0] mem [7:0];
    reg [7:0] temp_data;
    integer i;

    always @(posedge clk) begin 
        if(rst) begin
        for (i=0;i<=7;i=i+1)
            mem[i] <= 0;
            end
        else if (we && cs) 
            mem[addr] <= data;
        else if (cs && !we)
            temp_data <= mem[addr];                  
    end  
    assign data = (!we && cs && oe)? temp_data : 'bz;
endmodule