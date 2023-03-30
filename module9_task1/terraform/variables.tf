variable "aws_region" {
  description = "The AWS region to use"
  default     = "us-east-2"
}

variable "instance_tags" {
	type = map(string)
	default = {
		production = "Awesome Production Server"
		jenkins = "Jenkins for Awesome Inc."
	}
}