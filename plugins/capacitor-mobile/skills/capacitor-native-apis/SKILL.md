---
name: capacitor-native-apis
description: Use when implementing CapacitorJS official and community plugin APIs including Camera, Filesystem, Geolocation, Preferences, Push Notifications, and other native capabilities with correct permission handling and web fallbacks.
---

# Capacitor Native APIs

## Specialization

Implement native capabilities through official Capacitor plugin APIs and vetted community plugins with deterministic permission handling, platform-conditional branching, graceful web fallbacks, and error-resilient bridge patterns.

## Scope Boundaries

In scope:

- Official `@capacitor/*` plugin API usage patterns for all major capability areas.
- Permission request and state check workflows.
- Platform-conditional implementations (iOS vs. Android vs. web).
- Error handling and graceful degradation for web contexts.
- Capability availability checks before API invocation.

Out of scope:

- Custom plugin authoring (see `capacitor-plugin-authoring`).
- Plugin installation and initial Capacitor setup (see `capacitor-setup`).
- Native plugin security hardening (see `capacitor-security`).

## Trigger Conditions

- A feature needs device camera, geolocation, storage, push notifications, haptics, clipboard, sharing, or other native capability.
- A native API call is failing, returning unexpected results, or behaving differently across platforms.
- Permission handling for a native API is missing, incomplete, or implemented incorrectly.
- A web fallback is needed for a feature that uses native APIs.

## Inputs

- Required native capability or capabilities.
- Target platforms: iOS, Android, web, or all three.
- User-facing feature context (why the capability is needed).
- Existing permission handling state.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Correct API invocation pattern for each required capability.
- Permission check and request flow for each capability requiring permissions.
- Platform-specific behavioral notes for iOS and Android.
- Web fallback or degradation strategy.
- Error handling pattern for bridge failures, permission denials, and capability absence.

## Official Plugin Capability Index

| Plugin | Package | Key Capabilities |
|---|---|---|
| Camera | `@capacitor/camera` | Photo capture, gallery selection, base64 or URI output |
| Filesystem | `@capacitor/filesystem` | Read, write, delete files; directory management |
| Geolocation | `@capacitor/geolocation` | Current position, watch position, accuracy options |
| Preferences | `@capacitor/preferences` | Key-value storage (replaces Storage plugin) |
| Push Notifications | `@capacitor/push-notifications` | Token registration, foreground/background handling |
| Local Notifications | `@capacitor/local-notifications` | Scheduled local alerts |
| Haptics | `@capacitor/haptics` | Vibration, impact, and notification feedback |
| Network | `@capacitor/network` | Connection status and type; change listener |
| Share | `@capacitor/share` | Native share sheet for text, URLs, and files |
| Clipboard | `@capacitor/clipboard` | Read and write clipboard content |
| StatusBar | `@capacitor/status-bar` | Style, color, and visibility control |
| SplashScreen | `@capacitor/splash-screen` | Show, hide, and auto-hide configuration |
| Browser | `@capacitor/browser` | In-app browser; open external URLs safely |
| App | `@capacitor/app` | App state, back button, deep links |
| Device | `@capacitor/device` | Device info, battery, language |
| Keyboard | `@capacitor/keyboard` | Keyboard show/hide events; resize behavior |
| Toast | `@capacitor/toast` | Native toast notifications |

## Permission Workflow Pattern

```typescript
import { Camera, CameraPermissionState } from '@capacitor/camera';

async function requestCameraWithFallback(): Promise<void> {
  // 1. Check current state
  const permissions = await Camera.checkPermissions();

  if (permissions.camera === 'granted') {
    return; // Already granted
  }

  if (permissions.camera === 'denied') {
    // Inform user to go to Settings; do not re-request
    throw new Error('PERMISSION_DENIED');
  }

  // 2. Request if in 'prompt' or 'prompt-with-rationale' state
  const result = await Camera.requestPermissions({ permissions: ['camera'] });
  if (result.camera !== 'granted') {
    throw new Error('PERMISSION_DENIED');
  }
}
```

- Always call `checkPermissions()` before `requestPermissions()`.
- Never re-request a permission already in `denied` state; guide the user to system Settings.
- Treat `limited` (iOS) as a gracefully-degraded granted state.

## Key API Patterns

### Camera — Capture Photo
```typescript
import { Camera, CameraResultType, CameraSource } from '@capacitor/camera';

const photo = await Camera.getPhoto({
  resultType: CameraResultType.Uri,   // prefer Uri over Base64 for large images
  source: CameraSource.Camera,
  quality: 90,
  allowEditing: false,
  saveToGallery: false
});
// photo.webPath is safe to use in <img src>
```

### Preferences — Read and Write
```typescript
import { Preferences } from '@capacitor/preferences';

await Preferences.set({ key: 'user-token', value: token });
const { value } = await Preferences.get({ key: 'user-token' });
await Preferences.remove({ key: 'user-token' });
```

### Geolocation — Current Position
```typescript
import { Geolocation } from '@capacitor/geolocation';

const coordinates = await Geolocation.getCurrentPosition({
  enableHighAccuracy: true,
  timeout: 10000
});
```

### Network — Connection Check
```typescript
import { Network } from '@capacitor/network';

const status = await Network.getStatus();
if (!status.connected) { /* handle offline */ }

Network.addListener('networkStatusChange', (status) => {
  // React to connectivity changes
});
```

### Push Notifications — Registration
```typescript
import { PushNotifications } from '@capacitor/push-notifications';

await PushNotifications.requestPermissions();
await PushNotifications.register();

PushNotifications.addListener('registration', ({ value: token }) => {
  // Send token to server
});
PushNotifications.addListener('registrationError', (error) => {
  // Handle failure
});
```

## Web Fallback Rules

- Implement web equivalents using `Capacitor.isNativePlatform()` guards for every native API call.
- For Camera on web: use the HTML `<input type="file" accept="image/*">` fallback.
- For Geolocation on web: use `navigator.geolocation` with user permission prompt.
- For Preferences on web: Capacitor falls back to `localStorage`; no custom fallback needed.
- For Push Notifications on web: use the Web Push API if required; Capacitor does not bridge push on web.
- Always provide a graceful no-op or informative error for capabilities with no web equivalent.

## Error Handling Pattern

```typescript
try {
  const photo = await Camera.getPhoto({ ... });
} catch (error) {
  if ((error as Error).message === 'User cancelled photos app') {
    return; // User dismissed; not an error
  }
  // Log and surface actionable message
  throw error;
}
```

- User cancellations are not errors; distinguish cancel from failure.
- Permission errors require user action; surface a clear settings-redirect message.
- Plugin not available errors occur only on web; guard with `Capacitor.isNativePlatform()`.

## Quality Gates

- Every native API call is preceded by a permission check where the capability requires one.
- Web fallbacks exist for all user-facing features that use native APIs.
- User cancellation is handled separately from error conditions.
- Event listeners registered with `addListener` are removed when the component unmounts.
- No native API is called outside a `Capacitor.isNativePlatform()` guard unless a web fallback is present.

## Done Criteria

- All required native capabilities are implemented with correct API patterns.
- Permission workflows pass the permission checklist.
- Web fallbacks or degradation paths are implemented and tested.
- Event listeners are properly registered and cleaned up.
- Error paths produce user-actionable feedback.
