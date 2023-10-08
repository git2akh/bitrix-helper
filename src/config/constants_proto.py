from typing_extensions import Protocol

class Constants_VirtualBox_VM_NIC_INTERFACE(Protocol):
    ID: int

class Constants_VirtualBox_VM_NIC(Protocol):
    NAT: Constants_VirtualBox_VM_NIC_INTERFACE
    NAT: Constants_VirtualBox_VM_NIC_INTERFACE

class Constants_VirtualBox_VM_FORMATS(Protocol):
    NAME: str
    UUID: str

class Constants_VirtualBox_VM(Protocol):
    NIC: Constants_VirtualBox_VM_NIC
    FORMATS: Constants_VirtualBox_VM_FORMATS

class Constants_VirtualBox(Protocol):
    VM: Constants_VirtualBox_VM
    
class Constants(Protocol):
    VIRTUALBOX: Constants_VirtualBox

