# Consul Image

Configuration for generating an AMI running Hashicorp's Consul.

## Using the Image

### Requirements

When deploying the image, additional configuration data must be applied for the server to run properly. Namely, the `bootstrap_expect` parameter must be given. This can be done by creating another config file in the `/opt/consul/config` directory with the desired parameters.

### Usage with Terraform

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
