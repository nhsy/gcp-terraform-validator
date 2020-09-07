resource "google_compute_instance" "default" {
  name         = "gce-instance"
  machine_type = "g1-small"
  zone         = "europe-west2-a"

  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-9"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.default.self_link

    access_config {
      // REQUIRED TO ALLOW SSH
    }
  }
  project = var.project
}

data "google_compute_subnetwork" "default" {
  name    = "default"
  project = var.project
  region  = var.region
}
