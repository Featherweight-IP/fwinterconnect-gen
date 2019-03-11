
input[(${addr_width}-1):0]      ${name}_AWADDR, 
input[(${id_width}-1):0]        ${name}_AWID, 
input[7:0]                      ${name}_AWLEN, 
input[2:0]                      ${name}_AWSIZE, 
input[1:0]                      ${name}_AWBURST, 
input                           ${name}_AWLOCK, 
input[3:0]                      ${name}_AWCACHE, 
    
input[2:0]                      ${name}_AWPROT, 
input[3:0]                      ${name}_AWQOS, 
input[3:0]                      ${name}_AWREGION, 

input                           ${name}_AWVALID, 
output                          ${name}_AWREADY, 

input[(${addr_width}-1):0]      ${name}_WDATA, 
input[(${addr_width}/8)-1:0]    ${name}_WSTRB, 
input                            ${name}_WLAST, 

input                            ${name}_WVALID, 
output                            ${name}_WREADY, 

output[(${id_width}-1):0]        ${name}_BID, 
output[1:0]                        ${name}_BRESP, 

output                            ${name}_BVALID, 
input                            ${name}_BREADY, 
    
input[(${addr_width}-1):0]    ${name}_ARADDR, 
input[(${id_width}-1):0]        ${name}_ARID,   
input[7:0]                        ${name}_ARLEN,  
input[2:0]                        ${name}_ARSIZE, 
input[1:0]                        ${name}_ARBURST, 
input                            ${name}_ARLOCK, 
input[3:0]                        ${name}_ARCACHE, 

input[2:0]                        ${name}_ARPROT, 
input[3:0]                        ${name}_ARQOS, 
input[3:0]                        ${name}_ARREGION, 

input                            ${name}_ARVALID, 
output                            ${name}_ARREADY, 

output[(${id_width}-1):0]        ${name}_RID, 
output[(${addr_width}-1):0]    ${name}_RDATA, 
output[1:0]                        ${name}_RRESP, 
output                            ${name}_RLAST, 

output                            ${name}_RVALID, 
input                            ${name}_RREADY