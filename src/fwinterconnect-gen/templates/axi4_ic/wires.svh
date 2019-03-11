/************************************************************************
 * AXI interconnect ${name} wires
 ************************************************************************/
// Stored request
reg[${addr-width}-1:0]                    ${name}_R_AWADDR_i[${n-targets}-1:0];
reg[${addr-width}-1:0]                    ${name}_R_AWADDR[${n-targets}-1:0];
reg[${id-width}-1:0]        ${name}_R_AWID[${n-targets}-1:0];
reg[7:0]                                    ${name}_R_AWLEN[${n-targets}-1:0];
reg[2:0]                                    ${name}_R_AWSIZE[${n-targets}-1:0];
reg[1:0]                                    ${name}_R_AWBURST[${n-targets}-1:0];
reg                                         ${name}_R_AWLOCK[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_AWCACHE[${n-targets}-1:0];
reg[2:0]                                    ${name}_R_AWPROT[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_AWQOS[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_AWREGION[${n-targets}-1:0];
reg                                         ${name}_R_AWVALID[${n-targets}-1:0];

reg[${addr-width}-1:0]                      ${name}_R_ARADDR_i[${n-targets}-1:0];
reg[${addr-width}-1:0]                      ${name}_R_ARADDR[${n-targets}-1:0];
reg[${id-width}-1:0]        ${name}_R_ARID[${n-targets}-1:0];
reg[7:0]                                    ${name}_R_ARLEN[${n-targets}-1:0];
reg[2:0]                                    ${name}_R_ARSIZE[${n-targets}-1:0];
reg[1:0]                                    ${name}_R_ARBURST[${n-targets}-1:0];
reg                                         ${name}_R_ARLOCK[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_ARCACHE[${n-targets}-1:0];
reg[2:0]                                    ${name}_R_ARPROT[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_ARQOS[${n-targets}-1:0];
reg[3:0]                                    ${name}_R_ARREGION[${n-targets}-1:0];
reg                                            ${name}_R_ARVALID[${n-targets}-1:0];
    
reg[(${id-width}-1:0]    ${name}_R_SBID[${n-initiators}:0];
reg[1:0]                                    ${name}_R_SBRESP[${n-initiators}:0];
reg                                            ${name}_R_SBVALID[${n-initiators}:0];
reg                                            ${name}_R_SBREADY[${n-initiators}:0];
    

reg                                            ${name}_write_request_busy[${n-targets}-1:0];
reg[N_SLAVEID_BITS:0]                        ${name}_write_selected_slave[${n-targets}-1:0];

wire[${n-targets}-1:0]                            ${name}_aw_req[${n-initiators}:0];
wire                                        ${name}_aw_master_gnt[${n-initiators}:0];
wire[$clog2(${n-targets})-1:0]                    ${name}_aw_master_gnt_id[${n-initiators}:0];

    
wire[${id-width}-1:0]        ${name}_SRID_p[${n-initiators}:0];
wire[${data-width}-1:0]                    ${name}_SRDATA_p[${n-initiators}:0];
wire[1:0]                                    ${name}_SRRESP_p[${n-initiators}:0];
wire                                        ${name}_SRLAST_p[${n-initiators}:0];
wire                                        ${name}_SRVALID_p[${n-initiators}:0];
    
reg[${id-width}-1:0]        ${name}_SRID_r[${n-initiators}:0];
reg[${data-width}-1:0]                    ${name}_SRDATA_r[${n-initiators}:0];
reg[1:0]                                    ${name}_SRRESP_r[${n-initiators}:0];
reg                                            ${name}_SRLAST_r[${n-initiators}:0];