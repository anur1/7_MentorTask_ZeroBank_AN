@AccountActivityNavigation
Feature: Navigating to specific accounts in Accounts Activity

  @AccountActivityNavigation1
  Scenario Outline: Login with invalid credentials
    When user is on the login page
    And user types username as "<username>"
    And user types password as "<password>"
    And user clicks on sign in button
    Then verify "<error message>" should be displayed


    #Combinations
       # blank - blank
         # blank - password
          # username - blank

      # invalid - invalid
         # invalid - password
          # username - invalid

    Examples:
      | username   | password   | error message                    |
      |            |            | Login and/or password are wrong. |
      |            | password   | Login and/or password are wrong. |
      | username   |            | Login and/or password are wrong. |
      | X_username | X_username | Login and/or password are wrong. |
      | X_username | password   | Login and/or password are wrong. |
      | username   | X_password | Login and/or password are wrong. |


  @AccountActivityNavigation2
  Scenario: Savings account redirect
    Given  the user is logged in
    When the user clicks on Online Baking More Services
    When the user clicks on "Account Activity" link
    Then the "Account Activity" page should be displayed
    And the user accesses the "Show Transactions" tab
    And Account drop down should have following parts

      | Savings     |
      | Brokerage   |
      | Checking    |
      | Credit Card |
      | Loan        |
