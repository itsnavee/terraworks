# Provisioning a Virtual Server Instance (VSI) in IBM Test Cloud using Terraform

This is what you will be provisioning in this example:

1. 1x VPC where you provision your VPC virtual server instance
1. 1x security group and a rule for this security group to allow SSH connection to your virtual server instance
1. 1x subnet to enable networking in your VPC
1. 1x VPC virtual server instance
1. 1x Floating IP address that you use to access your VPC virtual server instance over the public network

### Notes:
For test.cloud.ibm.com endpoint, you have to set the following environmental variables before running `terraform plan` command. You can also put them in your `.bashrc` or `.zshrc`:

```
export IC_API_KEY="your api key goes here"
alias ic="ibmcloud"
alias iclogin="ibmcloud login -a test.cloud.ibm.com --apikey $IC_API_KEY -r us-south -g Default"
export IBMCLOUD_API_ENDPOINT=https://test.cloud.ibm.com
export IBMCLOUD_IS_NG_API_ENDPOINT=https://us-south-stage01.iaasdev.cloud.ibm.com/v1
export IBMCLOUD_IAM_API_ENDPOINT=https://iam.test.cloud.ibm.com
export IBMCLOUD_RESOURCE_MANAGEMENT_API_ENDPOINT=https://resource-controller.test.cloud.ibm.com
export IBMCLOUD_GT_API_ENDPOINT=https://tags.global-search-tagging.test.cloud.ibm.com
export IBMCLOUD_RESOURCE_CATALOG_API_ENDPOINT=https://globalcatalog.test.cloud.ibm.com
export IBMCLOUD_RESOURCE_CONTROLLER_API_ENDPOINT=https://resource-controller.test.cloud.ibm.com
export IBMCLOUD_PRIVATE_DNS_API_ENDPOINT=https://api.dns-svcs.test.cloud.ibm.com/v1
```

Also when you run `terraform plan`, it will ask for ssh-key, you should only provide the name of the ssh-key and not the file path.
The ssh-key needs to be uploaded to vpc section using [this guide from IBM Cloud](https://cloud.ibm.com/docs/vpc?topic=vpc-managing-ssh-keys&interface=ui).

