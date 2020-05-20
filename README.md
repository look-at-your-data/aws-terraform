# aws-terraform

The code rolls out AWS infrastructure which includes ec2 server and security group assigned to it.
Security rules allow only ssh access via 22 port and any outbound traffic out.
Please, have a closer look at their definition and how security group
is called in ```main.tf``` file

# Provision Role
This terraform code uses the provided provision_role to create infrastructure  and it should have administrative access.
Replace with the correct role under the following directive in _variable.tf_ file:
```
variable "provision_role_arn"{
    #default     = "arn:aws:iam::NNNN:role/NNNN"
}
```

# Instance profile
Apart from security groups which regulate inbound and outbound traffic, 
once ec2 instance gets provisioned, it usually requires a certain access to be able
to function in AWS environment - for instance, to connect to s3 bucket or AWS queue (SQS).
The access is usually given by assigning to
an instance a profile/policy with the required access.
In order to do that define a policy in
AWS by following the guide:
https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html
and then place the name of created policy under:
```
variable "twdu_server_instance_profile" {
  #default     = "arn:aws:iam::NNNN:policy/NNNNN"
}
```
in ```variable.tf``` file.

# User data file
It is very common to have an executable file called ```user_data``` to be run just after instance gets provisioned and started.
It may contains certain user creation or establishing connection to a service and so on.
In this example we have just a simple ```user_data.sh``` file which contains
echoing of "Hello world" string. The output of it can be found in local instance logs or in the cloudwatch logs.

# Run Terraform code to roll out infrastructure
Once steps above completed, please, run the following sequence of commands
in the terraform/ec2-server directory:
```
terraform init
terraform plan
```

If plan is successful it should show similar string:
```
Plan: 2 to add, 0 to change, 0 to destroy.
```

Then run:
```
terraform apply
```

and once asked:
```
Do you want to perform these actions?
```

type:
```
yes
```
and press enter.

Notice whether infrastructure is successfully provisioned.

If so try to connect to the instance. Is it possible? How?

# Destroy infrastructure
If you dont need provisioned ec2 instance and security group anymore,
then destroy them to reduce billing:
```
terraform destroy
```