provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-1"
}


resource "aws_autoscaling_group" "worker" {
  availability_zones = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e"]
  name = "worker"
  min_size = 1
  max_size = 5
  launch_configuration = "${aws_launch_configuration.worker.id}"
}


resource "aws_launch_configuration" "worker" {
    name = "worker"
    image_id = "ami-aa7ab6c2"
    instance_type = "t1.micro"
}
