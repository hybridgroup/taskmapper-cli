Feature: We can list projects
  As a user with valid credentials set for a project
  I want to be able to list all projects for an already set provider.

  Scenario: List all projects
    Given `tm --provider kanbanpad --authentication 'token:dkdk,username:username' project --list='all'`
    Then The stdout should contain "Test Project"
