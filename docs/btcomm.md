# Bluetooth Communication

WearOS devices communicate with their host system (probably your smartphone) using Bluetooth. See [Overview of Data Layer API](https://developer.android.com/training/wearables/data/overview).

## Bluetooth Classic

There seem to be two channels:

### WearableBt

- UUID `5e8945b0-9525-11e3-a5e2-0800200c9a66`
- Wearable is server (originating package currently unknown)
- Seems to be the primary communication channel
- Uses [Protobuf](https://en.wikipedia.org/wiki/Protocol_Buffers) for data serialization

#### Protocol

- Sends messages as potentially multiple pieces
- Each message starts with a 32 bit message length
- Followed by Protobuf data

### Flow

- UUID `fafbdd20-83f0-4389-addf-917ac9dae5b2`
- Phone is server
- Companion App listens on this socket
- Not sure what it's for

### Flow15

- UUID `6a1eafb1-61c0-42a0-8bb0-a336fb1c3f00`
- Phone is server
- Companion App listens on this socket
- Not sure what it's for

## Bluetooth Low Enegery
GMS seems to use BLE as well.

There's a service UUID `C9C92447-8F77-4C63-9C79-25E71B4CA9B3` and a characteristic UUID `ABDD3056-28FA-441D-A470-55A75A52553A`. Not sure what they are for atm.
