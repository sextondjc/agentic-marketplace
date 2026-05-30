---
name: capacitor-push-notifications
description: Use when implementing end-to-end push notification delivery in a CapacitorJS app including APNs and FCM infrastructure setup, notification channels, silent and data-only pushes, server-side payload design, topic targeting, opt-in UX patterns, and deep-link navigation on tap.
---

# Capacitor Push Notifications

## Specialization

Design and implement production-grade push notification delivery for CapacitorJS apps on iOS (APNs) and Android (FCM). Covers the full pipeline: certificate and key lifecycle, FCM project setup, Capacitor plugin wiring, notification channels (Android API 26+), foreground and background handling, silent/data-only pushes, server-side payload design, topic and segment targeting, opt-in and re-engagement UX, and navigation to the correct in-app route on notification tap.

## Scope Boundaries

In scope:

- APNs certificate and `.p8` key lifecycle management.
- FCM project setup: service account, legacy API migration to HTTP v1, and Firebase `google-services.json` / `GoogleService-Info.plist`.
- `@capacitor/push-notifications` plugin wiring: registration, token persistence, foreground and background event handling.
- Android notification channels: creation, importance levels, sound, vibration, and badge behavior.
- iOS permission request strategy: when to ask, soft-ask pattern, settings deep link on denial.
- Silent / data-only pushes: content-available (iOS) and data-only FCM messages.
- Server-side payload design: `notification` vs. `data` fields, TTL, priority, collapse keys.
- Topic and segment targeting: FCM topic subscriptions, audience conditions.
- Opt-in UX: permission rationale, progressive disclosure, re-engagement prompts.
- Tap navigation: routing to the correct in-app screen from `pushNotificationActionPerformed`.
- Notification analytics: delivery, open rate, conversion attribution.

Out of scope:

- In-app messaging (FCM in-app messaging SDK — not a Capacitor concern).
- Full OAuth/PKCE auth session management (`capacitor-auth-session`).
- Deep-link configuration beyond notification-tap routing (`capacitor-deep-linking`).
- OTA live updates (`capacitor-live-updates`).
- Full CI pipeline authoring (`capacitor-ci-integration`).

## Trigger Conditions

- The app needs to receive push notifications on iOS and/or Android.
- Push notifications are not being delivered — diagnosing APNs or FCM configuration errors.
- Android notifications are missing sound or vibration on API 26+ devices (channel not configured).
- iOS permission request is being shown at the wrong time, harming opt-in rate.
- Background / silent pushes are not waking the app.
- Server is sending notifications using the deprecated FCM legacy API.
- Notification taps are opening the app home screen instead of the target content.
- Token rotation after logout is not being handled, causing cross-user notification leaks.

## Inputs

- Target platforms: iOS, Android, or both.
- APNs method: `.p8` key (preferred) or certificate.
- Push service: FCM (Google), direct APNs, or third-party (OneSignal, Braze, Courier, etc.).
- Notification types required: transactional, marketing, silent/data, or all.
- Whether topic / segment targeting is needed.
- Web framework and router in use.
- Whether deep-link navigation on tap is required (cross-reference `capacitor-deep-linking`).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- APNs key / certificate setup guide with rotation policy.
- FCM HTTP v1 service account configuration.
- `google-services.json` and `GoogleService-Info.plist` placement guidance.
- `@capacitor/push-notifications` wiring with token persistence, event handlers, and tap routing.
- Android notification channel definitions.
- iOS permission request strategy with soft-ask pattern.
- Server-side payload design reference.
- Token rotation on logout implementation.
- Rejected-candidate table with deterministic reason codes.
- Closure check: end-to-end delivery verified on physical devices for each notification type.

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Explain APNs/FCM architecture, plugin overview, platform requirements | Decision on APNs method and push service documented |
| L2 Delivery | Configure APNs and FCM; wire plugin; handle token, foreground, and tap events | Test notification delivered and tapped on physical iOS and Android |
| L3 Hardening | Add notification channels, silent pushes, opt-in UX, token rotation, and analytics | All notification types verified; opt-in rate baseline measured; token rotation tested |
| L4 Expert Standardization | Multi-app, multi-environment, multi-team push governance model | Reusable configuration templates, payload schema, and channel inventory documented |

## Deterministic Workflow

1. Decide APNs method (`.p8` key strongly preferred over certificates for lower rotation overhead).
2. Create APNs `.p8` key in Apple Developer portal; record key ID and team ID; never commit the key file.
3. Create Firebase project; enable Cloud Messaging; add iOS and Android apps; download config files.
4. Place `google-services.json` in `android/app/`; place `GoogleService-Info.plist` in `ios/App/App/`.
5. Install `@capacitor/push-notifications`; run `cap sync`.
6. Register for notifications on app launch; handle `registration` event; persist token to backend; associate with authenticated user.
7. Handle `pushNotificationReceived` (foreground) and `pushNotificationActionPerformed` (tap); extract data payload; route to correct screen.
8. Define Android notification channels for each notification category before first delivery.
9. Implement iOS soft-ask: show rationale UI first; only call `requestPermissions()` after user confirms.
10. Implement token rotation: on logout, deregister the token from the backend and call `removeAllListeners()`.
11. Configure server-side payload using FCM HTTP v1 API; set `priority`, `ttl`, and `collapse_key` as required.
12. Test silent/data-only pushes: `content-available: 1` (iOS), `data`-only FCM message (Android).
13. Verify end-to-end delivery on physical devices; log APNs and FCM delivery receipts.

## Plugin Wiring Pattern

```typescript
import { PushNotifications } from '@capacitor/push-notifications';

export async function registerPushNotifications(
  onToken: (token: string) => Promise<void>
): Promise<void> {
  let permStatus = await PushNotifications.checkPermissions();

  if (permStatus.receive === 'prompt') {
    permStatus = await PushNotifications.requestPermissions();
  }

  if (permStatus.receive !== 'granted') {
    // Guide user to Settings — do not repeatedly re-prompt
    return;
  }

  await PushNotifications.register();

  PushNotifications.addListener('registration', async (token) => {
    await onToken(token.value);
  });

  PushNotifications.addListener('registrationError', (err) => {
    console.error('Push registration failed', err);
  });

  PushNotifications.addListener('pushNotificationReceived', (notification) => {
    // App is in foreground — present in-app banner or badge
    console.log('Foreground notification', notification);
  });

  PushNotifications.addListener('pushNotificationActionPerformed', (action) => {
    const route = action.notification.data?.route;
    if (route) {
      router.push(route);  // replace with framework-specific navigation
    }
  });
}

export async function deregisterPushNotifications(): Promise<void> {
  await PushNotifications.removeAllListeners();
  // Notify backend to remove the token for this user
}
```

## Android Notification Channel Pattern

```typescript
import { PushNotifications } from '@capacitor/push-notifications';
import { Capacitor } from '@capacitor/core';

if (Capacitor.getPlatform() === 'android') {
  PushNotifications.createChannel({
    id: 'transactional',
    name: 'Transactional',
    description: 'Order updates and account alerts',
    importance: 4,       // IMPORTANCE_HIGH
    sound: 'default',
    vibration: true,
    visibility: 1,       // VISIBILITY_PUBLIC
    lights: true,
    lightColor: '#FF5733',
  });

  PushNotifications.createChannel({
    id: 'marketing',
    name: 'Promotions',
    description: 'Offers and recommendations',
    importance: 3,       // IMPORTANCE_DEFAULT
    sound: 'default',
    vibration: false,
    visibility: 1,
  });
}
```

## FCM HTTP v1 Payload Pattern

```json
{
  "message": {
    "token": "<DEVICE_FCM_TOKEN>",
    "notification": {
      "title": "Order shipped",
      "body": "Your order #1234 is on its way."
    },
    "data": {
      "route": "/orders/1234",
      "orderId": "1234"
    },
    "android": {
      "notification": { "channel_id": "transactional" },
      "priority": "HIGH",
      "ttl": "86400s"
    },
    "apns": {
      "payload": {
        "aps": {
          "alert": { "title": "Order shipped", "body": "Your order #1234 is on its way." },
          "sound": "default",
          "badge": 1
        }
      },
      "headers": { "apns-priority": "10" }
    }
  }
}
```

## Quality Gates

- APNs `.p8` key is stored in the secret store — not committed to version control.
- `google-services.json` and `GoogleService-Info.plist` are gitignored in production-credential form (use placeholder files for dev).
- Test notification delivered and tapped on physical iOS device (simulator cannot receive APNs).
- Test notification delivered and tapped on physical Android device or emulator with Google Play Services.
- Android notification channels are created before first notification delivery.
- Token is rotated on user logout; backend confirms token deregistration.
- Silent/data-only pushes confirmed to wake the app on both platforms.
- Foreground notification handled without duplicate system banner.
- Tap navigation routes to the correct in-app screen for each notification type.

## Done Criteria

- APNs key and FCM project are configured; no credentials in source.
- Plugin is wired with token persistence, foreground, and tap handlers.
- Android notification channels are defined for each notification category.
- iOS soft-ask permission pattern is implemented.
- Token rotation on logout is implemented and tested.
- End-to-end delivery verified on physical devices for all notification types.
- Server-side payload schema is documented with field reference.
- Channel and topic inventory exists with owner and business purpose per entry.
