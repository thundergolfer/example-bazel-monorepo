/*
Copyright 2018 Google LLC
Modifications copyright (C) 2019 Jonathon I Belotti

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    https://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

terraform {
  required_version = ">= 0.12"
}

variable "zone" {
  description = "The zone in which to create the Kubernetes cluster. Must match the region"
  type        = "string"
}

variable "project" {
  description = "The name of the project in which to create the Kubernetes cluster."
  type        = "string"
}

variable "node_machine_type" {
  description = "The machine type of the Kubernetes cluster nodes."
  type        = "string"
  default     = "n1-standard-1"
}

provider "google" {
  version = ">= 2.17.0"
  project = var.project
}

///////////////////////////////////////////////////////////////////////////////////////
// This configuration will create a GKE cluster that will be used for hosting
// our Bazel built & deployed Java server and Javascript client pod.
///////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////
// Create the primary cluster for this project.
///////////////////////////////////////////////////////////////////////////////////////
data "google_container_engine_versions" "gke_versions" {
  location = var.zone
}

resource "google_container_cluster" "primary" {
  name               = "gke-bazel-tutorial"
  location           = var.zone
  initial_node_count = 2
  min_master_version = data.google_container_engine_versions.gke_versions.latest_master_version

  // Scopes necessary for the nodes to function correctly
  node_config {

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]

    machine_type = var.node_machine_type
    image_type   = "COS"

    // (Optional) The Kubernetes labels (key/value pairs) to be applied to each node.
    labels = {
      status = "poc"
    }
  }

  master_auth {
    # Best practice
    # Disable basic auth
    # Default behavior for new clusters in GKE 1.12
    username = ""
    password = ""

    client_certificate_config {
      # Best practice
      # Disable client cert
      # Default behavior for new clusters in GKE 1.12
      issue_client_certificate = false
    }
  }

  # TODO setup a network for this
  ip_allocation_policy {
    use_ip_aliases = true
  }

  provisioner "local-exec" {
    command = "sleep 120"
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --zone ${google_container_cluster.primary.zone} --project ${var.project}"
  }
}

resource "google_project_service" "container" {
  service            = "container.googleapis.com"
  disable_on_destroy = false
}

// OUTPUTS

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "primary_zone" {
  value = google_container_cluster.primary.zone
}