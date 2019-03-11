output[(${addr-width}-1):0]    ${name}_AWADDR, 
output[(${id-width}-1):0]        ${name}_AWID, 
output[7:0]                        ${name}_AWLEN, 
output[2:0]                        ${name}_AWSIZE, 
output[1:0]                        ${name}_AWBURST, 
output                            ${name}_AWLOCK, 
output[3:0]                        ${name}_AWCACHE, 

output[2:0]                        ${name}_AWPROT, 
output[3:0]                        ${name}_AWQOS, 
output[3:0]                        ${name}_AWREGION, 

output                            ${name}_AWVALID, 
input                            ${name}_AWREADY, 

output[(${data-width}-1):0]    ${name}_WDATA, 
output[(${data-width}/8)-1:0]    ${name}_WSTRB, 
output                            ${name}_WLAST, 

output                            ${name}_WVALID, 
input                            ${name}_WREADY, 

input[(${id-width}-1):0]        ${name}_BID, 
input[1:0]                        ${name}_BRESP, 

input                            ${name}_BVALID, 
output                            ${name}_BREADY, 

output[(${addr-width}-1):0]    ${name}_ARADDR, 
output[(${id-width}-1):0]        ${name}_ARID,   
output[7:0]                        ${name}_ARLEN,  
output[2:0]                        ${name}_ARSIZE, 
output[1:0]                        ${name}_ARBURST, 
output                            ${name}_ARLOCK, 
output[3:0]                        ${name}_ARCACHE, 

output[2:0]                        ${name}_ARPROT, 
output[3:0]                        ${name}_ARQOS, 
output[3:0]                        ${name}_ARREGION, 

output                            ${name}_ARVALID, 
input                            ${name}_ARREADY, 

input[(${id-width}-1):0]        ${name}_RID, 
input[(${data-width}-1):0]    ${name}_RDATA, 
input[1:0]                        ${name}_RRESP, 
input                            ${name}_RLAST, 

input                            ${name}_RVALID, 
output                            ${name}_RREADY