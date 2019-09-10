provider "google" {
  credentials = file(var.credentials_file_path)
  version = "~> 2.7.0"
}

provider "google-beta" {
  credentials = file(var.credentials_file_path)
  version = "~> 2.7.0"
}
