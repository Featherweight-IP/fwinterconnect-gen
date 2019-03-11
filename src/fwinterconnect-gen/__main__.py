#****************************************************************************
#* fwinterconnect-gen main
#****************************************************************************
import argparse
import json
import os
from string import Template
from . import axi4_ic

supported_protocols = {
    "axi4": axi4_ic.axi4_icgen(),
    "wb": None}

class port:
    def __init__(self, params, protocol, ptype):
        self.params = params
        self.protocol = protocol
        self.ptype = ptype
        
class interconnect:
    def __init__(self, name, n_targets, n_initiators, params, protocol):
        self.name = name
        self.n_targets = n_targets
        self.n_initiators = n_initiators
        self.protocol = protocol
        
    def wires(self):
        return eval(self.protocol + ".ic_wires(" + 
                    self.name + ", " + str(self.n_targets) + 
                    ", " + str(self.n_initiators) + ")")

class ic_data:
    def __init__(self):
        interconnects = []
        bridges = []
        exported_ports = []

    def wires(self):
        ret = ""
        
        for ic in interconnects:
            ret += ic.wires()
        return ret
        
    
#********************************************************************
#* main()
#********************************************************************
def main():
    parser = argparse.ArgumentParser()
   
    parser.add_argument("icdfile", help="Interconnect definition file")
    
    args = parser.parse_args()
   
    fh = open(args.icdfile, "r")
    icd = json.load(fh)
    fh.close()
    
    name = os.path.splitext(os.path.basename(args.icdfile))[0]

    templates_dir = os.path.join(
        os.path.dirname(os.path.realpath(__file__)),
        "templates")
    
    fh = open(os.path.join(templates_dir, "interconnect.sv"), "r")
    interconnect_templ = fh.read()
    fh.close()
    
    ports = ""
    wires = ""
    port_wire_assignments = ""
    interconnects = ""
    module_decl = ""

    if "interconnects" not in icd.keys():
        print("Error: no interconnects specified")
        exit(1)

    for ic in icd["interconnects"]:
        icgen = supported_protocols[ic["protocol"]]
        
        icgen.validate_params(ic)
        
        wires += icgen.ic_wires(ic)
        interconnects += icgen.interconnect(ic);

    for key in icd.keys():
        print("key=" + key)
    
    for map in icd["portmap"]:
        if map[0] == "export":
            if ports != "":
                ports += ",\n"

            # TODO: these much come from the interconnect/bridge from which the port is exported
            port_params = {"addr_width": "32", "data_width": "64", "id_width": "4"}
            protocol = "axi4"
            
            # TODO: determine whether this is initiator or target
            interconnect_port = map[1]
            last_dot = interconnect_port.rfind(".")
            
            if interconnect_port[last_dot+1] == "i":
                ports += icgen.exported_initiator_port(map[2], port_params)
            elif interconnect_port[last_dot+1] == "t":
                ports += icgen.exported_target_port(map[2], port_params)
            else:
                print("Error: unknown port type \"" + interconnect_port[last_dot+1] + "\"")
            
        elif map[0] == "bind":
            # TODO: Connect 
            print("TODO: bind")
        else:
            print("Error: unknown portmap statement \"" + map[0] + "\"")
            exit(1)

    for ic_type in supported_protocols.keys():
        if supported_protocols[ic_type] != None:
            module_decl += supported_protocols[ic_type].module_decl()

    params = {}
    params["name"] = name
    params["ports"] = ports
    params["wires"] = wires
    params["port_wire_assignments"] = port_wire_assignments
    params["interconnects"] = interconnects
    params["module_decl"] = module_decl
    templ = Template(interconnect_templ)
    print("interconnect=" + templ.safe_substitute(params))
    

if __name__ == "__main__":
    main();
    
