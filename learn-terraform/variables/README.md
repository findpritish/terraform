## Input Variables

### Variables from file
variable.tf
```
variable "region" {
  default = "us-east-1"
}

```
main.tf
```
provider "aws" {
  region     = var.region
}
```
### variables from command line 

```
terraform apply -var 'region=us-east-2'
```

## From file 

terraform.tfvars
```
region = "us-east-2"
```

terraform apply -var-file="terraform.tfvars" 

Note: multiple files can be passed as well 

## From environment variables

Terraform will read environment variables in the form of TF_VAR_name to find the value for a variable. For example, the TF_VAR_region variable can be set to set the region variable.

```
set TF_VAR_region=us-east-2
terraform apply
```

## Lists

Defnition
```
# implicitly by using brackets [...]
variable "cidrs" { default = [] }

# explicitly
variable "cidrs" { type = list }
```

terraform.tfvars
```
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
```

## Maps

Maps are a way to create variables that are lookup tables. An example will show this best. Let's extract our AMIs into a map and add support for the us-west-2 region as well

```
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
```

```
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}
```

The square-bracket index notation used here is an example of how the map type expression is accessed as a variable, with [var.region] referencing the var.amis declaration for dynamic lookup.