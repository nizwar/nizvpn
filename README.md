# NizVPN
Flutter Android VPN based on OpenVPN Library.

> [!IMPORTANT]
> **NizVPN is no longer maintained.** Its OpenVPN engine dates from 2020 (OpenVPN 2.5, OpenSSL 1.1.1g, which Google Play flags) and `master` no longer builds with current Android tooling.
>
> Use [openvpn_flutter](https://pub.dev/packages/openvpn_flutter) instead: the same idea as a Flutter plugin, with OpenVPN 2.7 / OpenSSL 3.5, 16 KB page size support, iOS and macOS. Add `openvpn_flutter` to your app and follow its [README](https://github.com/nizwar/openvpn_flutter#readme).

# Let's Code!
I made it so simple to connect to OpenVPN, everything is setup, all you need to do is do the layouting *`on this project`* (i don't recommanded you to create a new project).

Here, i'll show you how to deal with the "connection things"

## Do this to Connect / Disconnect
Connect or Disconnect vpn with single line of code!
```dart 
    ...
        _vpnStage = NizVpn.vpnDisconnected;
        _selectedVpn = VpnConfig(
            config: "OVPN CONFIG IS HERE", 
            name: "Japan", 
            username: "VPN Username", 
            password:"VPN Password"
        );
    ...

    ...
        if (_selectedVpn == null) return; //Stop right here if user not select a vpn
        if (_vpnStage == NizVpn.vpnDisconnected) {
            //Start if stage is disconnected
            NizVpn.startVpn(_selectedVpn);
        } else {
            //Stop if stage is "not" disconnected
            NizVpn.stopVpn();
        }
    ...
```

## Listen to VPN Stage & Status
Don't forget to listen your vpn stage and status, you can simply show them with this.
```dart
    ...
        //Add listener to update vpnStage
        NizVpn.vpnStageSnapshot().listen((event) {
            setState(() {
                _vpnStage = event; //Look at stages detail below
            });
        });
    ... 
    ...
        //Add listener to update vpnStatus
        NizVpn.vpnStatusSnapshot().listen((event){
            setState((){ 
                _vpnStatus = event;
            });
        })
    ... 
```

### VPN Stages
Let me be clearer, VPN Stage shows the connection indicator when connecting the VPN
```dart
static const String vpnConnected = "connected";
static const String vpnDisconnected = "disconnected";
static const String vpnWaitConnection = "wait_connection";
static const String vpnAuthenticating = "authenticating";
static const String vpnReconnect = "reconnect";
static const String vpnNoConnection = "no_connection";
static const String vpnConnecting = "connecting";
static const String vpnPrepare = "prepare";
static const String vpnDenied = "denied";
```

Note : To change notification's icon, you can go to `vpnLib/main/res/drawable` and replace ic_notification.png from there!

# License
This project and the uses VPN library "ICS OpenVPN" both are under GPLv2 License.
