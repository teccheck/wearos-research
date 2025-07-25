# WearOS Research
Growing research document about [WearOS](https://en.wikipedia.org/wiki/Wear_OS)

## What is this?
This repo aims to document the inner workings of WearOS, Googles Android based operating system for smartwatches.

All research shown here is based on the version of WearOS that ships with a Pixel Watch 1. For other devices there might be subtle differences, but the core system should be largely the same.

## Bluetooth Communication
WearOS devices communicate with their host system (probably your smartphone) using Bluetooth. See [Overview of Data Layer API](https://developer.android.com/training/wearables/data/overview).

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

### Flow15
- UUID `6a1eafb1-61c0-42a0-8bb0-a336fb1c3f00`
- Phone is server
- Not sure what it's for

## Bluetooth Low Enegery
GMS seems to use BLE as well.

There's a service UUID `C9C92447-8F77-4C63-9C79-25E71B4CA9B3` and a characteristic UUID `ABDD3056-28FA-441D-A470-55A75A52553A`. Not sure what they are for atm.

## Background system packages
This section will give an overview over the most important system packages and what their role is.

### PrebuiltGmsCoreForClockworkWearable
| Property       | Value                                                 |
| -------------- | ----------------------------------------------------- |
| display name   | Google Play services                                  |
| package        | com.google.android.gms                                |
| location       | /product/priv-app/PrebuiltGmsCoreForClockworkWearable |
| shared user id | com.google.uid.shared                                 |

Google play services for wearables

### GoogleServicesFramework
// TODO


### WearServicesGoogle
| Property       | Value                                |
| -------------- | ------------------------------------ |
| display name   | Wear Services                        |
| package        | com.google.wear.services             |
| location       | /system/priv-app/WearServicesGoogle/ |
| shared user id | android.uid.system                   |

Probably core WearOS services. Does something with tiles and complications. Maybe provides APIs for that.

### WearHealthServicesPrebuilt
// TODO

### DeviceConnectivityServiceWearPrebuilt_25
// TODO

### PersistentBackgroundServices-watch
// TODO

### ModeManagerContentProvider
// TODO

### DeclarativeWatchFaceRuntimePrebuilt
// TODO


### ClockworkWcs
// TODO

### EuiccSupportWear
// TODO

eSim stuff

### HardwareInfo
| Property       | Value                           |
| -------------- | ------------------------------- |
| display name   | ---                             |
| package        | com.google.android.hardwareinfo |
| location       | /product/priv-app/HardwareInfo/ |
| shared user id | ---                             |

Service to get device information. Stuff like storage, battery, serial numbers etc.

### ConnMo
| Property       | Value                          |
| -------------- | ------------------------------ |
| display name   | ConnMo                         |
| package        | com.android.sdm.plugins.connmo |
| location       | /product/priv-app/ConnMO/      |
| shared user id | ---                            |

Somthing with [OMA Device Management](https://en.wikipedia.org/wiki/OMA_Device_Management). Found some strings containing Motorola in there

### DCMO
| Property       | Value                        |
| -------------- | ---------------------------- |
| display name   | Carrier OMADM                |
| package        | com.android.sdm.plugins.dcmo |
| location       | /product/priv-app/DCMO/      |
| shared user id | ---                          |

Somthing with [OMA Device Management](https://en.wikipedia.org/wiki/OMA_Device_Management)

### DiagMon
| Property       | Value                           |
| -------------- | ------------------------------- |
| display name   | ???                             |
| package        | com.android.sdm.plugins.diagmon |
| location       | /product/priv-app/DiagMon/      |
| shared user id | ---                             |

Somthing with [OMA Device Management](https://en.wikipedia.org/wiki/OMA_Device_Management)?

### DMService
| Property       | Value                        |
| -------------- | ---------------------------- |
| display name   | ???                          |
| package        | com.android.omadm.service    |
| location       | /product/priv-app/DMService/ |
| shared user id | ---                          |

Somthing with [OMA Device Management](https://en.wikipedia.org/wiki/OMA_Device_Management)?


## User facing system packages
This section will give an overview over the preinstalled apps.

### ClockworkSystemUI
// TODO

### ClockworkSysUiGoogle
// TODO

### ClockworkShell
// TODO

### ClockworkSettings
// TODO

System settings

### ClockworkSetupWizard
| Property       | Value                                   |
| -------------- | --------------------------------------- |
| display name   | setup                                   |
| package        | com.google.android.wearable.setupwizard |
| location       | /system/priv-app/ClockworkSetupWizard/  |
| shared user id | ---                                     |

Initial setup?

### WeatherClockwork

### Maps

### WearGboard

### ClockworkPhone

### YouTubeMusicClockwork

### WearCalendar

### MapsClockwork

### GmailWear

### ClockworkFlashlight

### GooglePhotosClockwork

### GoogleContactsClockwork

### FitbitClockwork

### MediaSessionsClockworkPrebuilt
Currently playing media

### GoogleHomeAppClockwork

### PrebuiltDeskClockMicroApp
Clock app

### PrebuiltWearsky
Google Play Store

### AssistantWearPrebuilt
// TODO

### ClockworkWatchFacesGoogleV2
| Property       | Value                                          |
| -------------- | ---------------------------------------------- |
| display name   | Google Watch Faces                             |
| package        | com.google.android.wearable.watchface.rwf      |
| location       | /product/priv-app/ClockworkWatchFacesGoogleV2/ |
| shared user id | ---                                            |

Googles default watch faces. Contains an editor as well

### cavalry
| Property       | Value                               |
| -------------- | ----------------------------------- |
| display name   | Diagnostics                         |
| package        | com.google.android.wearable.cavalry |
| location       | /product/priv-app/cavalry/          |
| shared user id | ---                                 |

Diagnostics tool. Can be started from settings/system/diagnostics