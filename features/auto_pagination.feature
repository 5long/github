Feature: Github API auto pagination

  The gem permits to auto paginate resources.

  Scenario: Passing auto_pagionation param to instances

    Given I have "Github::Repos" instance
    When I want to list resources
      And I pass the following request options:
        | user   | per_page | auto_pagination |
        | wycats | 45       | true            |
      And I make request within a cassette named "auto_pagination/repos/list"
    Then the response status should be 200
      And the response type should be JSON
      And the response should have 134 items

  Scenario: Passing auto_pagionation param to instances

    Given I have "Github::Repos" instance
      And I pass the following request options:
        | user   | per_page | auto_pagination |
        | wycats | 100       | true            |
    When I want to list resources
      And I make request within a cassette named "auto_pagination/repos/global_list"
    Then the response status should be 200
      And the response type should be JSON
      And the response should have 134 items

