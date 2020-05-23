# HCL suppports more complex string templating that can be used to generate full descriptive paragarphs too.

output "heredoc" {
  value = <<-EOT
     This is called here 'heredoc' its ia string literal
     that can have multiple lines
 EOT
}

locals {
  person = {
    name = "george"
    age   = 27
  }
}

output "directive" {
  value = <<-EOT
        This is 'heredoc' with directives
        %{if local.person.name == ""}
        Sorry , i dont know your name.
        %{else}  
        Hi ${local.person.name}
        %{endif}
    EOT
}


output "iterated" {
    value = <<-EOT
    Directives can also iterate 
    %{ for i in local.evens }
    $(i) is even
    %{ endfor }
    EOT
}