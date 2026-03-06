# Setup

## WatchConnectionStep

Order:

- Checking old ConnectionConfiguration
- Creating ConnectionConfiguration: ...
- ConnectionConfiguration created
- Finding ConnectionConfiguration
- Connected configuration not found, retrying in 5000
- Force enabling connection for ...
- Found connected configuration
- Waiting for watch to become ready
- Waiting for watch ready resumable event

Currently loops at

```
2026-03-04 22:58:24.454 30307-30307 WearSetup               com...e.android.apps.wear.companion  I  [WatchConnectionStep] Waiting for watch to become ready
2026-03-04 22:58:24.570 30307-30307 WearSetup               com...e.android.apps.wear.companion  I  [WatchConnectionStep] Waiting for watch ready resumable event
```