variable "resource_group_name" {
  default = "flaskAppRg"
}

variable "app_service_plan_name" {
  default = "dfern-flaskAppServicePlan"
}

variable "web_app_name" {
  default = "dfern1978"
}

variable "resource_group_location" {
  default = "westus3"
}

variable "docker_image_name" {
  default = "dkfern/flask-web-app:latest"
}
