# TDD Examples and Anti-Patterns

## Good RED Example

```typescript
test('retries failed operations three times', async () => {
  let attempts = 0;
  const operation = async () => {
    attempts++;
    if (attempts < 3) {
      throw new Error('fail');
    }
    return 'success';
  };

  const result = await retryOperation(operation);

  expect(result).toBe('success');
  expect(attempts).toBe(3);
});
```

## Weak RED Example

```typescript
test('retry works', async () => {
  const mock = jest.fn()
    .mockRejectedValueOnce(new Error())
    .mockRejectedValueOnce(new Error())
    .mockResolvedValueOnce('success');
  await retryOperation(mock);
  expect(mock).toHaveBeenCalledTimes(3);
});
```

This test mostly validates mock configuration instead of product behavior.

## Good GREEN Example

```typescript
async function retryOperation<T>(fn: () => Promise<T>): Promise<T> {
  for (let i = 0; i < 3; i++) {
    try {
      return await fn();
    } catch (error) {
      if (i === 2) {
        throw error;
      }
    }
  }

  throw new Error('unreachable');
}
```

## Anti-Patterns

- Writing implementation first and backfilling tests.
- Testing internal implementation details instead of behavior.
- Packing multiple behaviors into one test.
- Treating manual testing as a replacement for automation.
- Skipping re-run after refactor.

## Bugfix Example

```typescript
test('rejects empty email', async () => {
  const result = await submitForm({ email: '' });
  expect(result.error).toBe('Email required');
});
```

Then implement only enough logic to satisfy this failing test.
