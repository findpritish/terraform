## Terraform console 

terraform console command provides an interactive console for evaluating 

Examples:
```
terraform console

!var.my_boolean

var.my_boolean && true

var.my_boolean && false

var.my_boolean || false

var.my_boolean && var.my_int

var.my_boolean && var.my_string

var.my_boolean && var.my_string == ""

var.my_int * 100 > 1000

```

terraform console command can be used in non-interactive scripts by piping newline-separated commands to it. 

```

$ echo "10 + 5" | terraform console
15

```
