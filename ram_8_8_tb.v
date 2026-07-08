module ram_8_8_tb;// understood different ram block with chip select

    reg clk, rst, we, cs, oe;
    reg [4:0] addr;              
    reg [7:0] temp_data;
    wire [7:0] data;

    reg cs1, cs2, cs3, cs4;      

    // Instantiate DUTs
    ram_8_8 dut1 (clk, rst, we, cs1, oe, addr, data);
    ram_8_8 dut2 (clk, rst, we, cs2, oe, addr, data);
    ram_8_8 dut3 (clk, rst, we, cs3, oe, addr, data);
    ram_8_8 dut4 (clk, rst, we, cs4, oe, addr, data);

    // Chip select logic
    always @(*) begin
        cs1 = 0; cs2 = 0; cs3 = 0; cs4 = 0;
        case(addr[4:3])
            2'b00: cs1 = 1;
            2'b01: cs2 = 1;
            2'b10: cs3 = 1;
            2'b11: cs4 = 1;
        endcase
    end

    // Clock generation
    always #5 clk = ~clk;

    // Initial block
    initial begin
        {clk, rst, we, cs, oe, addr, temp_data} = 0;

        @(negedge clk)
        rst = 1;

        @(negedge clk)
        rst = 0;

        @(negedge clk)
        we = 1;
        cs = 1;
        temp_data = 8'b11010111;
        addr = 2'b00;

        @(negedge clk)
        we = 0;
        oe = 1;
        addr = 2'b00;

        #20;
        $finish;
    end

    // Drive data bus (for write)
    assign data = temp_data;  // fixed bus contention

endmodule