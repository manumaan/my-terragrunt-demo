# my-terragrunt-demo
Terragrunt Demo Repository


Pre-Requisites:
1. Install Terraform (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Install AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. Install Terragrunt (https://terragrunt.gruntwork.io/docs/getting-started/install/)
4. Install Tflint (https://github.com/terraform-linters/tflint)
5. Setup one of the auth methods so Terraform can talk to AWS (https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
6. Setup SSH on your system so that you can download from Github using SSH. (Create SSH Key and add it to config, and Github)
7. Add github.com to the known hosts so that Terragrunt dont choke there.
```
   (host=github.com; ssh-keyscan -H $host; for ip in $(dig @8.8.8.8 github.com +short); do ssh-keyscan -H $host,$ip; ssh-keyscan -H $ip; done) 2> /dev/null >> .ssh/known_hosts
```
