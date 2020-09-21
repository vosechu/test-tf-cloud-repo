provider "newrelic" {}

resource "newrelic_alert_channel" "foo" {
  name = "meeeee"
  type = "email"

  config {
    recipients              = "vosechu@gmail.com"
    include_json_attachment = "1"
  }
}
