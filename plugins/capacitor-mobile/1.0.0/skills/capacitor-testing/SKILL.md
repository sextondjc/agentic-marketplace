---
name: capacitor-testing
description: Use when designing or implementing tests for a CapacitorJS application including native plugin mocking, unit tests, integration tests, E2E tests, and CI device testing strategies.
---

# Capacitor Testing

## Specialization

Design and implement a deterministic testing strategy for CapacitorJS hybrid applications covering native plugin mocking, web-layer unit and integration tests, E2E automation, and CI device-lab or emulator workflows.

## Scope Boundaries

In scope:

- Unit testing of business logic and UI components with native plugins mocked.
- Integration testing of plugin API interactions using Capacitor's mock patterns.
- E2E testing in browser mode (Playwright, Cypress) and device mode.
- CI configuration for reproducible Capacitor test runs.
- Test coverage expectations and gap identification.

Out of scope:

- Native unit testing of iOS Swift or Android Kotlin plugin code directly.
- Performance profiling and benchmarking (covered in `capacitor-release-readiness`).
- App Store compliance testing.

## Trigger Conditions

- A Capacitor project needs a testing baseline.
- Native plugin calls are untested or brittle due to real device dependencies.
- E2E tests are failing intermittently in CI due to Capacitor context mismatches.
- A new native capability needs test coverage before release.
- CI pipeline lacks reproducible test runs for the Capacitor layer.

## Inputs

- Web framework in use (React, Vue, Angular, SvelteKit).
- Test runner preference (Vitest, Jest, Playwright, Cypress).
- List of native plugins in use.
- CI environment (GitHub Actions, GitLab CI, etc.).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Plugin mock strategy and concrete mock implementations for all plugins in use.
- Unit test baseline for business logic with mocked native APIs.
- Integration test plan for plugin interactions.
- E2E test configuration for browser-mode and device-mode scenarios.
- CI configuration for reproducible test execution.
- Coverage gap analysis with prioritized remediation plan.

## Depth Modes

| Level | Intent | Stop Rule |
|---|---|---|
| L1 Orientation | Establish mock patterns | All native plugins have a working mock |
| L2 Practical Coverage | Core flows are tested | Business logic and critical native interactions have tests |
| L3 CI Integration | Tests run in CI | Unit and E2E tests pass reproducibly in CI |
| L4 Expert Baseline | Production-grade coverage | Coverage thresholds are enforced and device tests are included |

## Native Plugin Mock Pattern

Capacitor plugins inject into the global `window.Capacitor` bridge. In test environments, mock at the module level.

### Vitest / Jest Mock Pattern
```typescript
// src/__mocks__/@capacitor/camera.ts
export const Camera = {
  checkPermissions: vi.fn().mockResolvedValue({ camera: 'granted' }),
  requestPermissions: vi.fn().mockResolvedValue({ camera: 'granted' }),
  getPhoto: vi.fn().mockResolvedValue({
    webPath: 'blob:mock-image-url',
    format: 'jpeg'
  })
};
```

```typescript
// vitest.config.ts — auto-mock Capacitor modules
export default defineConfig({
  test: {
    alias: {
      '@capacitor/camera': resolve(__dirname, 'src/__mocks__/@capacitor/camera.ts')
    }
  }
});
```

### Mocking Capacitor.isNativePlatform()
```typescript
import * as CapacitorCore from '@capacitor/core';

vi.spyOn(CapacitorCore.Capacitor, 'isNativePlatform').mockReturnValue(true);
```

## Unit Testing Patterns

```typescript
// Component test — photo capture with mocked Camera
import { render, fireEvent, waitFor } from '@testing-library/react';
import { Camera } from '@capacitor/camera'; // resolves to mock
import { PhotoCapture } from './PhotoCapture';

it('displays captured photo after permission grant', async () => {
  (Camera.getPhoto as vi.Mock).mockResolvedValueOnce({ webPath: 'blob:test' });
  const { getByRole, getByAltText } = render(<PhotoCapture />);
  fireEvent.click(getByRole('button', { name: /take photo/i }));
  await waitFor(() => expect(getByAltText('Captured photo')).toBeInTheDocument());
});

it('shows error message when camera permission is denied', async () => {
  (Camera.checkPermissions as vi.Mock).mockResolvedValueOnce({ camera: 'denied' });
  // ... assert error state
});
```

## Integration Testing Patterns

- Test the full plugin interaction sequence: check permissions → request → invoke API → handle result.
- Use Capacitor's official `@capacitor/mock` package when available for a given plugin.
- For plugins without official mocks, implement a thin adapter interface and mock the adapter.
- Verify both success and failure paths; include user-cancellation scenarios.

## E2E Testing Configuration

### Browser Mode (Playwright)
```typescript
// playwright.config.ts
export default defineConfig({
  use: {
    baseURL: 'http://localhost:5173', // Vite dev server
  },
  projects: [
    { name: 'web', use: { ...devices['Desktop Chrome'] } }
  ]
});
```
- Browser-mode E2E tests run against the web fallback paths.
- Gate native-only features with `Capacitor.isNativePlatform()` guards so web tests skip them cleanly.

### Device Mode (Appium or Detox — Optional)
- Use Appium for cross-platform device E2E when device-specific behavior must be validated.
- Scope device E2E to critical happy paths only; do not replicate unit test coverage in device tests.
- Run device tests on CI using hosted device labs (BrowserStack, Sauce Labs) or emulators.

## CI Configuration (GitHub Actions)

```yaml
# .github/workflows/test.yml
jobs:
  unit-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - run: npm run test:unit -- --coverage

  e2e-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - run: npx playwright install --with-deps chromium
      - run: npm run build
      - run: npx playwright test
```

## Coverage Expectations

| Layer | Minimum Coverage Target | Notes |
|---|---|---|
| Business logic services | 80% | Must not depend on real native APIs |
| Plugin interaction flows | All happy + denial paths | Mock-based; no real devices required |
| UI components | Critical user flows | Focus on state transitions and error states |
| E2E (browser mode) | Core user journeys | Web fallback paths |

## Quality Gates

- All native plugins have mock implementations resolvable in the test environment.
- Unit tests pass without any real native bridge; no `window.Capacitor` access in test runs.
- Permission denial and user cancellation paths are tested.
- CI test job completes without device dependencies.
- Coverage meets the defined targets for each layer.

## Done Criteria

- Mock strategy is documented and all plugins in use have mocks.
- Unit tests cover business logic and plugin interaction flows.
- E2E tests cover core user journeys in browser mode.
- CI configuration runs tests reproducibly.
- Coverage gap analysis is complete with prioritized actions.
