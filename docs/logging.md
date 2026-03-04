# Logging

Logging can help in understanding what software does on a higher level without much difficulty.

## Android's Log.isLoggable

Android provides a way to check if a log tag can be logged on a certain level. By default everything is logged if it's on level info or higher. See [Android Log API reference](https://developer.android.com/reference/android/util/Log#isLoggable(java.lang.String,%20int)). You can use `setprop log.tag.<YOUR_LOG_TAG> <LEVEL>` to change that for certain tags. Level can be any of `V, D, I, W, E`.

For debuggable apps, this does not apply. They can log everything.

## Wear log tags to enable

- Wear_Transport
- WearableService
- WearableBluetooth
- Wear_PlaySetup
- Wear_AccountMatching
- Wear_WifiService
- Wear_Controller
- WearableClient
- WearableEventLogger
- WearableLogger
- WearableVerbose
- datatransport
- wearable
- Wear_TransportWriter
- Wear_ConnectionMgr
- WearDataBatching
- WearNotification
- WearableLS
- wearable.ARI
- wearable.TOS
- wearable.Privacy
- wearable.Consents
- wearable.ConsentRecord
- wearable.ConsentSync
- WearableInitOperation
- Wear_Gcm
- WearIoStream
- WearPrefHelper
- WearReadyBroadcaster
