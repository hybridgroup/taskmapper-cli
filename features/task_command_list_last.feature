Feature: We can list the last task for a given project
  As a user with a valid provider and credentials set
  I want to be able to list the last task for a given project.

  @announce-stdout
  Scenario: List last task for a project
    Given File `.taskmapper.rc.yml` exists 
    When I successfully run `tm task --project='test-project' --list=last`
    Then The stdout should contain 'id: 1'
