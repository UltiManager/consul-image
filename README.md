# Consul Image

Packer template for generating an AMI running Hashicorp's [Consul][consul].

Specifically, the template builds an AMI based on the Ubuntu 16.04 base image that runs a Consul server instance.


## Using the Image

### Requirements

The created image requires additional configuration in order to run. Notably:

- The [`bootstrap_expect`][consul-bootstrap-expect] or [`bootstrap`][consul-bootstrap] parameter must be set.
- To listen on addresses other than `localhost`, the [`client_addr`][consul-client-addr] parameter must be set.

To accomplish this, create a file in the `/opt/consul/config` directory with the desired options. One solution for this is to use the user data parameters available when launching an EC2 instance.

### Usage with Terraform

This repository is configured to create an image named `consul-server-<consul version>-<timestamp>`. This can be used in Terraform through the following:

```hcl
data "aws_ami" "consul-server" {
    most_recent = true
    owner       = ["self"]

    filter {
        name   = "name"
        values = ["consul-server-*"]
    }
}
```


## License

This project is licensed under the MIT License. More information can be found in the [`LICENSE`](LICENSE) file.


[consul]: https://www.consul.io/
[consul-bootstrap]: https://www.consul.io/docs/agent/options.html#bootstrap
[consul-bootstrap-expect]: https://www.consul.io/docs/agent/options.html#bootstrap_expect
[consul-client-addr]: https://www.consul.io/docs/agent/options.html#client_addr
