provider "newrelic" {}

resource "newrelic_alert_channel" "slack channel" {
  name = "slack"
  type = "slack"

  config {
    url = ""
    channel = ""
  }
}
