provider "newrelic" {}

resource "newrelic_alert_channel" "foo" {
  name = "meeeee"
  type = "email"

  config {
    recipients              = "vosechu@gmail.com"
    include_json_attachment = "1"
  }
}

data "newrelic_entity" "app" {
  name = "WebPortal"
  type = "APPLICATION"
  domain = "APM"
}

resource "newrelic_alert_policy" "foo" {
  name = "test policy please delete"
}

resource "newrelic_alert_condition" "foo" {
  policy_id = newrelic_alert_policy.foo.id

  name        = "foo"
  type        = "apm_app_metric"
  entities    = [data.newrelic_entity.app.application_id]
  metric      = "apdex"
  runbook_url = "https://www.example.com"
  condition_scope = "application"

  term {
    duration      = 5
    operator      = "below"
    priority      = "critical"
    threshold     = "0.75"
    time_function = "all"
  }
}
