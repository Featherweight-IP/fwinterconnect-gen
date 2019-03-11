
from abc import ABC

class icgen(ABC):
    
    def __init__(self):
        pass
    
    def exported_target_port(self, name, parameters):
        print("Error: unimplemented method")
    
    def validate_params(self, parameters):
        if "name" not in parameters:
            raise Exception("interconnect missing \"name\" key")
        
        if "data-width" not in parameters:
            raise Exception("interconnect missing \"data-width\" key")
        
        if "addr-width" not in parameters:
            raise Exception("interconnect missing \"addr-width\" key")
        
    
        