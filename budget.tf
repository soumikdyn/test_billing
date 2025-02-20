provider "aws" {
  region = "eu-central-1"
}

resource "aws_budgets_budget" "monthly_budget" {
  name         = "new-monthly-budget"
  budget_type  = "COST"
  limit_amount = "100.0"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"  # No need for time_period_start

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["soumik.shadman@dynmedia.com"]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["soumik.shadman@dynmedia.com"]
  }
}