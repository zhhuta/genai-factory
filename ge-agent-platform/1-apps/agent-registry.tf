# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set custom service endpoints in Agent Registry
module "agent_registry" {
  # TODO: move to the first Cloud Foundation Fabric release tag that
  # includes modules/geap-agent-registry (GoogleCloudPlatform/cloud-foundation-fabric#4434).
  source          = "github.com/zhhuta/cloud-foundation-fabric//modules/geap-agent-registry?ref=22ad5bc46e4c68640521434d9cffb9f641e4654e"
  project_id      = var.project_id
  location        = var.region
  deletion_policy = var.enable_deletion_protection ? "PREVENT" : "ABANDON"
  services        = local.agent_registry_services
}

moved {
  from = google_agent_registry_service.agent_registry_services
  to   = module.agent_registry.google_agent_registry_service.default
}
