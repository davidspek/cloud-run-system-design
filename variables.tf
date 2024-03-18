variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
  default     = "my-project-id"
}

variable "certificate_domains" {
  description = "The domains to use for the SSL certificate"
  type        = list(string)
  default     = ["example.com"]
}

variable "service_port_name" {
  description = "The name of the port to use for the service"
  type        = string
  default     = "http"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "priv-esc"
}

variable "container_image" {
  description = "Container image to deploy"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "run_regions" {
  description = "Regions to deploy the Cloud Run service in"
  type        = list(string)
  default     = ["us-central1", "eu-central2"]
}
