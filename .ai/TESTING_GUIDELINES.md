# Testing Guidelines

## Test Types
- **Unit Tests**: Test individual functions/methods
- **Integration Tests**: Test component interactions
- **E2E Tests**: Test complete user flows

## Test Structure
```
describe('Component/Function', () => {
  it('should do expected behavior', () => {
    // Arrange
    // Act
    // Assert
  });
});
```

## Coverage Requirements
- Minimum: 80% coverage
- Critical paths: 100% coverage

## Running Tests
```bash
# Run all tests
npm test

# Run specific test
npm test -- --grep "test name"

# Coverage report
npm run test:coverage
```

## Mocking Guidelines
<!-- How to mock dependencies -->

---
*Last Updated: <!-- date -->*
