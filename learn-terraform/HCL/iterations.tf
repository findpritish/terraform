# iteration 
# HCL has a 'for' synatx for iterating over list values
locals {
  l          = ["one", "two", "three"]
  upper_list = [for item in local.l : upper(item)]
  upper_map  = { for item in local.l : item => upper(item) } # where item in lowe case is key and ite in uper is value
}

output "iterations" {
  value = local.upper_list
}

locals{
    n = [1,2,3,4,5,6,8,9,10,11,12,13,17,18,20]

    evens = [for i in local.n: i  if i % 2 == 0]
}

output "iterations_even" {
  value = local.evens
}