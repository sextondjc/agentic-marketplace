---
name: capacitor-deep-linking
description: Use when implementing or auditing deep links, Universal Links, App Links, or custom URL schemes in a CapacitorJS app including platform configuration, route handling on arrival, fallback pages, and deep-link test strategy.
---

# Capacitor Deep Linking

## Specialization

Implement and govern deep linking across iOS (Universal Links + custom schemes) and Android (App Links + intent filters + custom schemes) in a CapacitorJS hybrid application. Covers the full chain: platform configuration, AASA / Digital Asset Links files, app-side route resolution, OAuth callback handling, and test strategy.

## Scope Boundaries

In scope:

- iOS Associated Domains entitlement and `apple-app-site-association` (AASA) file authoring.
- Android `assetlinks.json`, intent filters, and `AndroidManifest.xml` configuration.
- Custom URL scheme configuration on both platforms.
- Capacitor `App.addListener('appUrlOpen', ...)` handler pattern.
- Web-side router integration: mapping the arriving URL to an in-app route.
- Fallback and preview pages for links opened in a browser.
- Deep-link hijack prevention (cross-reference `capacitor-security` for full hardening).
- Deferred deep-link patterns (link clicked before app install).
- Deep-link test strategy: simulator/emulator CLI, Charles Proxy, and CI smoke tests.

Out of scope:

- OAuth/PKCE callback deep links (owned by `capacitor-auth-session`).
- OTA live-update URL schemes (owned by `capacitor-live-updates`).
- General app security hardening beyond link validation (`capacitor-security`).
- Full push notification tap navigation (`capacitor-push-notifications`).

## Trigger Conditions

- A feature requires navigating to specific in-app content from a web URL (Universal Link / App Link).
- Marketing or email links must open the app directly on the target screen.
- A custom URL scheme is needed for inter-app communication or OAuth callbacks.
- Deep links are failing on device — app opens to home screen instead of target route.
- An audit reveals unconfigured Associated Domains or missing `assetlinks.json`.
- CI must verify that deep links resolve correctly before each release.

## Inputs

- App bundle ID (iOS) and application ID (Android).
- Target web domain(s) for Universal Links / App Links.
- Required URL path patterns and their in-app route equivalents.
- Web framework router in use (React Router, Vue Router, SvelteKit, Angular Router).
- Custom scheme names, if any.
- Whether deferred deep linking is required (pre-install links).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Platform configuration artifact (Associated Domains, AASA, intent filters, `assetlinks.json`).
- `appUrlOpen` handler with route-mapping logic.
- Fallback/preview page specification.
- Deep-link test plan (device CLI commands, proxy config, CI smoke steps).
- Rejected-candidate table with deterministic reason codes.
- Closure check: all URL patterns resolve to correct in-app routes on both platforms.

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Explain Universal Links vs App Links vs custom schemes; identify which applies | Decision documented with rationale |
| L2 Delivery | Configure both platforms; implement `appUrlOpen` handler and router mapping | Links verified on at least one physical device per platform |
| L3 Hardening | Add fallback pages, deferred deep links, hijack prevention, and CI smoke tests | All URL patterns pass on physical iOS and Android; CI gate in place |
| L4 Expert Standardization | Multi-domain, multi-scheme, cross-team deep-link governance model | Reusable configuration templates and routing conventions documented |

## Deterministic Workflow

1. Identify all URL patterns, schemes, and target in-app routes.
2. Choose link type per platform: Universal Links (iOS), App Links (Android), or custom scheme (both).
3. Configure iOS: add Associated Domains entitlement; host AASA at `https://<domain>/.well-known/apple-app-site-association`.
4. Configure Android: add intent filter in `AndroidManifest.xml`; host `assetlinks.json` at `https://<domain>/.well-known/assetlinks.json`.
5. Implement `App.addListener('appUrlOpen', handler)` in the Capacitor web layer; extract path and query; delegate to router.
6. Implement graceful fallback: if the app is not installed, the URL should open a web preview or install-prompt page.
7. Validate AASA and `assetlinks.json` using Apple's and Google's validation tools.
8. Test on physical devices with `xcrun simctl openurl` (iOS) and `adb shell am start` (Android).
9. Add CI smoke step: deep-link URL invocation and route assertion.
10. Document all URL patterns in a link inventory; assign owner for each domain.

## iOS Configuration Pattern

```xml
<!-- ios/App/App.entitlements -->
<key>com.apple.developer.associated-domains</key>
<array>
  <string>applinks:example.com</string>
  <string>applinks:www.example.com</string>
</array>
```

```json
// https://example.com/.well-known/apple-app-site-association
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAMID.com.example.app",
        "paths": ["/products/*", "/offers/*", "/invite/*"]
      }
    ]
  }
}
```

## Android Configuration Pattern

```xml
<!-- android/app/src/main/AndroidManifest.xml — inside <activity> -->
<intent-filter android:autoVerify="true">
  <action android:name="android.intent.action.VIEW" />
  <category android:name="android.intent.category.DEFAULT" />
  <category android:name="android.intent.category.BROWSABLE" />
  <data android:scheme="https" android:host="example.com" />
</intent-filter>
```

```json
// https://example.com/.well-known/assetlinks.json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.example.app",
    "sha256_cert_fingerprints": ["<RELEASE_SHA256_FINGERPRINT>"]
  }
}]
```

## App Handler Pattern

```typescript
import { App } from '@capacitor/app';

App.addListener('appUrlOpen', (event: URLOpenListenerEvent) => {
  const url = new URL(event.url);
  const path = url.pathname + url.search;

  // Reject unexpected origins
  const allowedHosts = ['example.com', 'www.example.com'];
  if (!allowedHosts.includes(url.hostname) && url.protocol !== 'myapp:') {
    console.warn('Rejected deep link from unexpected host:', url.hostname);
    return;
  }

  // Delegate to router — replace with framework-specific navigation
  router.push(path);
});
```

## Quality Gates

- AASA passes Apple's validation tool at `https://branch.io/resources/aasa-validator/`.
- `assetlinks.json` passes Google's Digital Asset Links API verification.
- `App.addListener` rejects unexpected origins (no open redirect).
- All defined URL patterns resolve to correct in-app routes on physical iOS and Android devices.
- Fallback page exists for each deep-link domain — browser fallback is not a 404.
- CI smoke step invokes at least one deep link per platform and asserts route.

## Done Criteria

- All required URL patterns are configured on both platforms.
- `appUrlOpen` handler is implemented with origin validation and router delegation.
- AASA and `assetlinks.json` are hosted, valid, and verified by platform tools.
- Fallback / preview pages are in place for each domain.
- Deep-link test plan is documented and CI smoke step is active.
- Link inventory exists with pattern → route → owner mapping.
