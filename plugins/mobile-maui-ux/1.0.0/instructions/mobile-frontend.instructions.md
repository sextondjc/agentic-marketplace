---
name: mobile-frontend
description: 'Cross-platform mobile frontend standards: platform parity, offline/sync patterns, secure storage, performance budgets, and prohibited patterns.'
applyTo: '**/*.tsx,**/*.xaml'
---
# Mobile Frontend Policy

## Platform Parity

- Core user flows must behave identically on iOS and Android unless a documented platform exception exists.
- Platform-specific adaptations must be isolated to named platform files or conditional compilation targets; do not scatter platform checks throughout shared logic.
- Use native platform navigation patterns (iOS modal/push, Android back-stack) unless the design explicitly deviates and documents the rationale.
- Test on at minimum one physical or emulated iOS device and one Android device before marking a screen complete.

## Architecture

- Enforce MVVM boundaries in MAUI: UI logic must not live in code-behind or views.
- ViewModels must be testable without a UI host; no direct references to platform UI types.
- DI lifetimes must be documented and justified; do not use singleton for stateful per-screen objects.
- Navigation parameters must be strongly typed; do not pass untyped strings or object dictionaries between screens.

## Offline and Lifecycle

- Define offline behavior explicitly: optimistic updates, queue-and-sync, or read-only degraded mode.
- All screens must survive process kill and lifecycle interruption (suspend/resume) without data loss.
- Do not perform long-running work on the UI thread; use background tasks with cancellation support.
- Sync and cache invalidation strategy must be documented per entity type.

## Security

- Store sensitive tokens and credentials exclusively in the platform secure storage (Keychain / Keystore / MAUI SecureStorage); never in preferences, SQLite plain text, or app bundle files.
- Validate all deep link and URI scheme parameters before routing or state mutation.
- Do not disable certificate validation; pin certificates only when justified and documented.
- Remove all debug logging of sensitive identifiers before release builds.

## Performance

- Target app cold-start time under two seconds on a mid-range device.
- Maintain 60 fps scrolling on list views with typical data sets.
- Use compiled bindings in MAUI; measure binding overhead before opting out.
- Profile memory pressure before and after any cache or collection growth change.

## Prohibited Patterns

- Synchronous network calls on the UI thread.
- Storing authentication tokens in `Preferences` or application-level dictionaries.
- Hardcoded environment URLs or credentials in source files.
- Disabling platform back navigation without an explicit UX decision and accessibility review.

## Routing Notes

- Use [SKILL.md](./../skills/build-maui-apps/SKILL.md) for MAUI architecture, secure storage, and implementation workflow.
- Use [SKILL.md](./../skills/mobile-orchestrator/SKILL.md) for end-to-end mobile UX, prototyping, and release coordination.
- Use quality-gate skills for deterministic evidence gates:
  - [SKILL.md](./../skills/mobile-accessibility-quality-gate/SKILL.md) for accessibility findings
  - [SKILL.md](./../skills/mobile-offline-resilience/SKILL.md) for offline/sync validation
  - [SKILL.md](./../skills/mobile-performance-quality-gate/SKILL.md) for performance and release readiness

