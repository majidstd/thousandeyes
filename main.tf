terraform {
  required_providers {
    thousandeyes = {
      source = "william20111/thousandeyes"
      version = "0.6.0"
    }
  }
}
provider "thousandeyes" {
  token = var.te_token
  # account_group_id = var.account_group_id
}
data "thousandeyes_agent" "ce_agent" {
  agent_name  = var.ce_agent_name
}
resource "thousandeyes_agent_to_server" "server_test" {
  test_name = "my agent test"
  interval = 120
  server = "www.google.com"
  port = 80
  agents {
      agent_id = data.thousandeyes_agent.ce_agent.agent_id
  }

}


resource "thousandeyes_http_server" "google_http_test" {
  test_name = "google test"
  interval = 120
  url = "https://google.com"
  agents {
      agent_id = data.thousandeyes_agent.ce_agent.agent_id
  }
  agents {
      agent_id = 467841
  }
}