---
name: capacitor-security
description: Use when hardening a CapacitorJS application for security including Content Security Policy, secure storage, plugin permission governance, CORS configuration, deep link validation, and certificate pinning patterns.
---

# Capacitor Security

## Specialization

Apply deterministic, defense-in-depth security hardening to CapacitorJS hybrid applications covering the web layer (CSP, CORS), the native bridge (plugin permission governance, bridge surface reduction), data at rest (secure storage), and transport (HTTPS enforcement, certificate pinning).

## Scope Boundaries

In scope:

- Content Security Policy authoring and validation for Capacitor's WebView.
- Secure storage patterns for sensitive data (tokens, credentials, PII).
- Plugin permission governance and surface-area minimization.
- CORS and server-side request configuration for Capacitor's custom protocol.
- Deep link and Universal Link / App Link validation to prevent hijacking.
- HTTPS enforcement and certificate pinning patterns.
- Sensitive data exclusion from logs and error messages.

Out of scope:

- Backend API security (outside the scope of the Capacitor client).
- App Store security review responses.
- MDM or enterprise device policy management.

## Trigger Conditions

- A new Capacitor app is being prepared for production and needs a security baseline.
- A security audit finding references the Capacitor layer.
- Sensitive data (tokens, credentials, PII) is being stored or transmitted from a Capacitor app.
- Deep links are being implemented and need hijack-prevention validation.
- A CSP violation is blocking functionality or a CSP is absent.
- A plugin has broad permissions that should be narrowed.

## Inputs

- App sensitivity level (public, authenticated, regulated/PII).
- List of plugins in use and their required permissions.
- Deep link schemes and associated domain patterns.
- Storage requirements for sensitive data.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- CSP policy string validated for Capacitor's WebView protocol (`capacitor://` or `ionic://`).
- Secure storage implementation pattern appropriate to the app sensitivity level.
- Plugin permission audit: required permissions vs. declared permissions, with reduction recommendations.
- Deep link validation implementation.
- HTTPS enforcement configuration.
- Security findings with severity, owner, and remediation action.

## Content Security Policy

Capacitor's WebView serves content from `capacitor://localhost` (iOS) or `http://localhost` (Android). The CSP must accommodate this origin.

```html
<!-- Strict CSP for Capacitor hybrid apps -->
<meta http-equiv="Content-Security-Policy" content="
  default-src 'self' capacitor://localhost http://localhost;
  script-src 'self' 'unsafe-inline';
  style-src 'self' 'unsafe-inline';
  img-src 'self' data: blob: capacitor://localhost http://localhost https:;
  connect-src 'self' https://your-api.example.com;
  frame-src 'none';
  object-src 'none';
  base-uri 'self';
">
```

- `'unsafe-eval'` must not be present unless a justified exception exists.
- `connect-src` must enumerate explicit API origins; do not use `*`.
- Remove `http:` from `connect-src` in production; all API calls must use `https:`.
- `frame-src 'none'` prevents iframe-based injection attacks.

## Secure Storage Patterns

| Data Type | Recommended Storage | Never Use |
|---|---|---|
| Auth tokens | `@capacitor/preferences` + encryption wrapper, or `capacitor-secure-storage-plugin` | `localStorage` unencrypted |
| Credentials | Keychain (iOS) / Keystore (Android) via secure plugin | Plaintext in files or prefs |
| PII | Encrypted file storage via `@capacitor/filesystem` with AES | SQLite without encryption |
| Session flags | `@capacitor/preferences` | Cookies without secure flag |

```typescript
// Never store raw tokens in Preferences without encryption in high-sensitivity apps
// Use a plugin that wraps iOS Keychain / Android Keystore
import { SecureStoragePlugin } from 'capacitor-secure-storage-plugin';

await SecureStoragePlugin.set({ key: 'auth-token', value: token });
const { value } = await SecureStoragePlugin.get({ key: 'auth-token' });
```

## Plugin Permission Governance

- Audit each plugin's `Info.plist` and `AndroidManifest.xml` declarations.
- Remove declared permissions for plugins that are installed but unused.
- Use the minimum permission level available (e.g., `ACCESS_COARSE_LOCATION` vs. `ACCESS_FINE_LOCATION`) unless precision is required.
- Do not pre-request permissions at startup; request at the moment of first use.
- Provide rationale strings in `Info.plist` that match the actual use case.

## Deep Link Validation

```typescript
import { App } from '@capacitor/app';

App.addListener('appUrlOpen', (event) => {
  const url = new URL(event.url);

  // 1. Validate scheme and host against explicit allowlist
  const ALLOWED_HOSTS = ['yourapp.example.com'];
  if (!ALLOWED_HOSTS.includes(url.hostname)) {
    return; // Reject unknown hosts
  }

  // 2. Validate path against expected route patterns
  const ALLOWED_PATH_PATTERN = /^\/app\/(home|profile|settings)(\/.*)?$/;
  if (!ALLOWED_PATH_PATTERN.test(url.pathname)) {
    return; // Reject unexpected paths
  }

  // 3. Route to the validated destination
  router.push(url.pathname);
});
```

- Never navigate directly to a deep link URL without host and path validation.
- Register Universal Links (iOS) and App Links (Android) using `assetlinks.json` and `apple-app-site-association` to prevent third-party hijacking.

## HTTPS and Transport Security

- All API calls must target HTTPS endpoints in production.
- Do not set `cleartext: true` in `capacitor.config.ts` for production builds.
- Enable iOS App Transport Security (ATS) by default; do not add `NSAllowsArbitraryLoads` exceptions.
- Configure Android `network_security_config.xml` to prohibit cleartext traffic except for `localhost` during development.

## Sensitive Data Log Exclusion

- Token values, credentials, and PII must never appear in `console.log`, error messages, or analytics events.
- Sanitize error objects before logging; strip sensitive fields explicitly.
- In native plugins, do not log bridge call arguments for methods that handle sensitive data.

## Quality Gates

- CSP is present, correctly scoped to Capacitor's WebView protocol, and excludes `'unsafe-eval'`.
- No sensitive data is stored in `localStorage` or unencrypted Preferences.
- All declared permissions are justified and used.
- Deep links validate host and path against an explicit allowlist.
- No `cleartext: true` in committed `capacitor.config.ts`.
- No sensitive values in console output or error messages.

## Done Criteria

- All security findings have a severity, owner, and explicit remediation action.
- CSP policy is validated and in place.
- Secure storage pattern is implemented for all sensitive data types.
- Plugin permission audit is complete with reduction actions recorded.
- Deep link validation is implemented and tested.
- Transport security rules are enforced in the native project configuration.
