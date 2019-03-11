#****************************************************************************
#* axi4_ic.py
#****************************************************************************
from string import Template
from . import ic_gen
import os

class axi4_icgen(ic_gen.icgen):
    pass
    
    def __init__(self):
        templ_dir = os.path.join(
            os.path.dirname(os.path.realpath(__file__)),
            "templates/axi4_ic")
        
        self.templates = {}
        self.has_interconnect = False
        
        for tmpl in [
            "target_port.svh",
            "initiator_port.svh",
            "wires.svh",
            "interconnect.svh",
            "axi4_interconnect_NxN.sv"]:
            fh = open(os.path.join(templ_dir, tmpl), "r")
            data = fh.read()
         
#             modulename = "module " + os.path.splitext(os.path.basename(tmpl))[0] + ";";
#             module_idx = data.find(modulename)
#             if module_idx != -1:
#                 print("Found module_idx")
#                 data = data[module_idx+len(modulename):]
#                 last_endmodule = data.rfind("endmodule")
#                 data = data[:last_endmodule]
#             else:
#                 print("Didn't find module_idx")
                
            self.templates[tmpl] = data
            fh.close()
    
    def validate_params(self, parameters):
        super().validate_params(parameters)
        
        if "id-width" not in parameters:
            raise Exception("interconnect missing \"id-width\" key")
    
    def exported_target_port(self, name, parameters):
        templ = Template(self.templates["target_port.svh"])
        local_p = {}
        local_p.update(parameters)
    
        local_p["name"] = name;
   
        return templ.safe_substitute(local_p)

    def exported_initiator_port(self, name, parameters):
        templ = Template(self.templates["initiator_port.svh"])
   
        return templ.safe_substitute(parameters)
    
    def ic_wires(self, parameters):
        templ = Template(self.templates["wires.svh"])
    
        return templ.safe_substitute(parameters)

    def exported_target_port_wire_assignment(self, p1, p2):
        return "XXXX"

    def exported_initiator_port_wire_assignment(self, p1, p2):
        return "XXXX"

    def internal_port_wire_assignment(self, ip, tp):
        return "XXXX"


    def interconnect(self, parameters):
        templ = Template(self.templates["interconnect.svh"])
        self.has_interconnect = True
        
        return templ.safe_substitute(parameters)

    # Returns the module declarations required by referenced items
    def module_decl(self):
        ret = ""
        if self.has_interconnect:
            ret += self.templates["axi4_interconnect_NxN.sv"];
            
        return ret
