# Instructions

Copy `terraform.tfvars.example` in a `terraform.tfvars` and compile the mandatory variables.

    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars

This configuration will be ignored by the git repository.

### Deploy the benchmark

Test the configuration with:

    terraform plan

Deploy the instance:

    terraform apply

Remove the instance:

    terraform destroy

###

Example of amazon EC2 instance types

|description|vCPU| RAM  |StorageType|Mem(GiB)|
|---|---|---|---|---|
|c4.large   | 2  | 3.75 | EBS-Only  | 500  |
|c4.xlarge  | 4  | 7.5  | EBS-Only  | 750  |
|c4.2xlarge | 8  | 15   | EBS-Only  | 1,000|
|c4.4xlarge | 16 | 30   | EBS-Only  | 2,000|

The terraform description defines and instantiates the full deployment for the benchmark.

## Set up ssh connection

Set up local ssh connection for convenience:  

    vim ~/ssh/config
    
Adding:  

``` 
Host aws
    Hostname *IP*
    CheckHostIP=no
    StrictHostKeyChecking=no
    UserKnownHostsFile=/dev/null
    IdentityFile ~/.ssh/aws
```
