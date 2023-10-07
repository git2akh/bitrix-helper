# How to open SSH session from HOST to Virtual Machine by Virtual Machine (Name OR UUID)

Note: You must install Virtual Box extensions pack on the host and Virtual Box extensions on the virtual machine.

## Set Constants
sh script:
```
VIRTUALBOX_HOSTONLY_NIC_ID=2;
VIRTUALBOX_VM_NAME_OR_UUID="Test.2.VMBitrix7.5-1";
```

## Set Computed
sh script:
```
VIRTUALBOX_NET_ID="$(expr "${VIRTUALBOX_HOSTONLY_NIC_ID}" - 1)";
VIRTUALBOX_VM_IPv4="$(
  VBoxManage guestproperty get "${VIRTUALBOX_VM_NAME_OR_UUID}" "/VirtualBox/GuestInfo/Net/${VIRTUALBOX_NET_ID}/V4/IP" |
  awk '{print($2);}'
)";
```

## Run
sh script:
```
ssh bitrix@${VIRTUALBOX_VM_IPv4};
```

## Functions
sh script:
```
BXGET() {
  [ -f "${3}" ] && (echo "file \"${3}\" already exists ... skipped") || (
    wget -O "${3}" "https:/${1}";
    unzip -l "${3}";
    #VBoxManage -n import VMBitrix7.5-1-CentOS7.9-x86_64.ova --vsys 0 --ostype RedHat_64 --vmname "Test.2.VMBitrix7.5-1" --basefolder $(pwd);
  )
};
```

## Run
sh script:
eval "$(curl https://www.1c-bitrix.ru/download/vmbitrix.php | tr '\n' '\a' | sed -nE 's;.*<a [^>]*href="/(([^"]+/)(([^/"]+[Vv]irtual[Bb]ox[^/"]*)\.zip))"[^>]*>Скачать \(.zip\)</a>.*;BXGET "\1" "\2" "\3" "\4";p;' | tr '\a' '\n')";

eval "$(curl https://www.1c-bitrix.ru/download/vmbitrix.php | tr '\n' '\a' | sed -nE 's;.*<a [^>]*href="/(([^"]+/)([^/"]+\.ova))"[^>]*>Скачать \(.ova\)</a>.*;BXGET "\1" "\2" "\3";p;' | tr '\a' '\n')";

curl https://www.1c-bitrix.ru/download/vmbitrix.php | tr '\n' '\a' | sed -nE 's;.*<a [^>]*href="/(([^"]+/)([^/"]+\.ova))"[^>]*>Скачать \(.ova\)</a>.*;BXGET "\1" "\2" "\3";p;' | tr '\a' '\n' | sh; echo ''

unzip VMBitrix7.5-1-CentOS7.9-VirtualBox.zip

VBoxManage import VMBitrix7.5-1-CentOS7.9-x86_64.ova --vsys 0 --ostype RedHat_64 --vmname "Test.2.VMBitrix7.5-1" --basefolder $(pwd)
