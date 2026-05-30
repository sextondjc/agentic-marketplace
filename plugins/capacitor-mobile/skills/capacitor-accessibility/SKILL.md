---
name: capacitor-accessibility
description: Use when implementing or auditing accessibility in a CapacitorJS hybrid app including VoiceOver and TalkBack interaction with WebView content, focus management across the web/native boundary, dynamic content announcements, touch target sizing, and WCAG compliance in hybrid layouts.
---

# Capacitor Accessibility

## Specialization

Design and validate accessibility outcomes for CapacitorJS hybrid apps by addressing the unique challenges of WebView-hosted content interacting with native assistive technologies (VoiceOver on iOS, TalkBack on Android), native UI chrome, and plugin-triggered state changes.

## Scope Boundaries

In scope:

- VoiceOver (iOS) and TalkBack (Android) behavior for WebView-hosted content.
- Focus management across the web/native boundary (e.g., after plugin-triggered overlays or deep links).
- ARIA attribute correctness and landmark structure in hybrid WebView context.
- Dynamic content announcements for plugin-driven state changes (network status, camera result, push notification arrival).
- Touch target sizing and tap gesture conflict resolution between WebView and native gesture recognizers.
- Color contrast, font scaling, and reduced-motion compliance within the WebView.
- Accessibility test strategy for hybrid apps (automated + manual device testing).

Out of scope:

- Pure native accessibility for non-Capacitor MAUI or Swift/Kotlin apps (see `mobile-accessibility-quality-gate`).
- Pure web WCAG compliance without native bridge considerations (see `web-ux-accessibility`).
- Store accessibility declarations and regulatory compliance filings.

## Trigger Conditions

- A Capacitor app has accessibility failures identified by VoiceOver or TalkBack testing.
- Focus is lost or misdirected after a native plugin call (camera, biometric prompt, push notification tap).
- Dynamic content changes driven by native events are not announced to screen readers.
- Touch targets conflict with native gesture recognizers (swipe-to-go-back, pull-to-refresh).
- An accessibility audit or WCAG review is required before release.

## Inputs

- Target platforms: iOS (VoiceOver), Android (TalkBack), or both.
- List of native plugin interactions that trigger UI state changes.
- Current ARIA and semantic HTML baseline.
- Font scaling and color contrast requirements.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Accessibility audit findings with severity classification and affected journey.
- Focus management plan for all plugin-triggered state changes.
- ARIA correction set for WebView content in hybrid context.
- Dynamic announcement strategy for native-event-driven content changes.
- Touch target and gesture conflict remediation plan.
- Test matrix for manual VoiceOver and TalkBack validation.
- Release recommendation with residual accessibility risks.

## Depth Modes

| Level | Intent | Stop Rule |
|---|---|---|
| L1 Orientation | Understand hybrid accessibility constraints | Key WebView/native boundary issues identified |
| L2 Practical Remediation | Fix critical barriers | Focus management, ARIA, and touch targets pass manual testing |
| L3 Quality Gate | Pre-release accessibility sign-off | All severity-1 findings resolved; severity-2 accepted or mitigated |
| L4 Expert Baseline | Reusable hybrid accessibility standard | Patterns, test scripts, and governance documented for cross-project use |

## WebView Accessibility Constraints

Capacitor's WebView inherits platform accessibility APIs but with key limitations:

- iOS: VoiceOver reads WebView content but cannot navigate across web/native boundaries without explicit focus management.
- Android: TalkBack traversal within a WebView is complete, but transition to native UI elements (dialogs, toasts) requires explicit `AccessibilityEvent` management.
- Plugin-triggered overlays (biometric prompt, share sheet, camera viewfinder) remove focus from the WebView; focus must be explicitly restored when the overlay dismisses.

## Focus Management Pattern

```typescript
import { Camera } from '@capacitor/camera';

async function capturePhoto(): Promise<void> {
  // Store the triggering element to restore focus after the plugin overlay dismisses
  const triggerEl = document.activeElement as HTMLElement;

  const photo = await Camera.getPhoto({ ... });

  // Restore focus to the triggering element or a known landmark
  triggerEl?.focus();

  // Announce the state change to screen readers
  announceToScreenReader('Photo captured successfully');
}

function announceToScreenReader(message: string): void {
  const liveRegion = document.getElementById('sr-live-region');
  if (liveRegion) {
    liveRegion.textContent = '';
    // Force re-announcement by cycling the content
    requestAnimationFrame(() => { liveRegion.textContent = message; });
  }
}
```

```html
<!-- Persistent live region for dynamic announcements — place in app shell -->
<div
  id="sr-live-region"
  role="status"
  aria-live="polite"
  aria-atomic="true"
  class="sr-only"
></div>
```

## ARIA Rules for Hybrid WebView Context

- All interactive elements must have an accessible name; do not rely on visual-only affordances.
- Use `role="dialog"` and `aria-modal="true"` for in-WebView modal overlays; ensure focus is trapped within the modal.
- Use `aria-live="polite"` for non-critical updates (sync status, network recovery); use `aria-live="assertive"` only for critical, time-sensitive changes.
- Landmarks (`main`, `nav`, `header`, `footer`) must be present and unique; avoid landmark-less single-page shells.
- Do not remove focus outlines via `outline: none` without a visible replacement.

## Touch Target and Gesture Rules

- Minimum touch target: 44×44 pt (iOS) / 48×48 dp (Android) for all interactive elements.
- Avoid CSS `touch-action: none` on scrollable containers; it suppresses native accessibility gestures.
- Do not intercept swipe gestures at the document level without explicit platform detection; this conflicts with TalkBack's explore-by-touch mode and VoiceOver's swipe navigation.
- Test all WebView scroll regions with VoiceOver and TalkBack; non-scrollable `overflow: auto` containers are inaccessible to assistive technologies.

## Dynamic Content Announcement Checklist

| Event Source | Announcement Required | Method |
|---|---|---|
| Network status change | Yes — offline/online | `aria-live` region |
| Plugin call completion (camera, file) | Yes — result or error | Focus restore + `aria-live` |
| Push notification tap → in-app navigation | Yes — page title or landmark | `document.title` update + focus to main |
| Form validation errors | Yes — field-level | `aria-describedby` + `aria-invalid` |
| Loading state start/end | Yes — if > 500 ms | `aria-busy` + `aria-live` |

## Manual Test Matrix

| Test | iOS VoiceOver | Android TalkBack |
|---|---|---|
| All interactive elements have announced labels | ✓ | ✓ |
| Focus restores after camera/biometric/share overlay dismisses | ✓ | ✓ |
| Dynamic content changes are announced without page reload | ✓ | ✓ |
| Modal dialogs trap focus and are dismissible by gesture | ✓ | ✓ |
| Font scaling to 200% does not break layout or truncate content | ✓ | ✓ |
| Minimum touch target size on all interactive elements | ✓ | ✓ |
| Color contrast ≥ 4.5:1 for body text | ✓ | ✓ |
| Reduced motion: animations disabled when prefers-reduced-motion is active | ✓ | ✓ |

## Quality Gates

- All severity-1 findings (complete barriers) are resolved before release.
- Focus management is implemented for every plugin interaction that removes WebView focus.
- A persistent `aria-live` region is present for dynamic announcements.
- Manual test matrix passes on at least one physical iOS and one physical Android device.
- Severity-2 and severity-3 residual findings are documented with accepted-risk sign-off.

## Done Criteria

- Audit findings are classified by severity and journey.
- Focus management and live region patterns are implemented and tested.
- Manual test matrix is completed on target devices.
- Release recommendation with residual risks is documented and owner-assigned.
