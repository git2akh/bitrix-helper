# How to open SSH session from HOST to Virtual Machine by Virtual Machine (Name OR UUID)

Note: Needs installed Virtual Box Extensions on Host and Virtual Machine

sh script:
```
VIRTUALBOX_HOSTONLY_NIC_ID=2;\
VIRTUALBOX_VM_NAME_OR_UUID="Test.2.VMBitrix7.5-1";\
VIRTUALBOX_NET_ID="$(expr "${VIRTUALBOX_HOSTONLY_NIC_ID}" - 1)";\
ssh bitrix@$(VBoxManage guestproperty get "${VIRTUALBOX_VM_NAME_OR_UUID}" "/VirtualBox/GuestInfo/Net/${VIRTUALBOX_NET_ID}/V4/IP" | awk '{print($2);}');
```
