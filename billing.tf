provider "aws" {
  alias  = "billing"
  region = "us-east-1"
}

resource "aws_sns_topic" "billing_alerts" {
  provider = aws.billing
  name     = "billing-alert-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  provider  = aws.billing
  topic_arn = aws_sns_topic.billing_alerts.arn
  protocol  = "email"
  endpoint  = "pawarsandesh1212@gmail.com"
}
