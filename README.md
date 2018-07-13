# Consul Image

Configuration for generating an AMI running Hashicorp's Consul.

## Current Limitations

* The image expects a cluster size of 1
* Additional servers are searched for only if they have a tag `Application` that is set to `consul`.

## Using the Image

This repository is configure to create an image named `consul-server-<consul version>-<timestamp>`. This can be used in Terraform through the following:

```hcl-terraform
data "aws_ami" "consul-server" {
    most_recent = true

    filter {
        name   = "name"
        values = ["consul-server-<version>-*"]
    }
}
```

## License

This project is licensed under the MIT License. More information can be found in the [`LICENSE`](LICENSE) file.
