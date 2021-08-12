# Switching between different accounts for AWS CLI, Terraform, etc

# Instructions 
1. git clone this repo in your ~/.aws directory
2. change the settings in the customer sub-directories cust1, cust2 etc
3. use the set-acct.sh to set the desired customer related config 
to be used by AWS CLI , python , Terraform etc.


# Background 
If you are working with different AWS customers or accounts on commandline its often a good idea
to have to be able to store the account specific profiles in subdirectories under ~/.aws directory like this : 

`.aws 
  - cust1
  - cust2
`
And then use this helper script to source and switch between account profiles 

## Working with multiple sets of Access Keys
-----------------------------------------

If you have multiple sets of Access Keys (e.g., for multiple IAM Users in different AWS accounts), you can create a separate Named Profile for each one in your Credentials File in ~/.aws/credentials:

[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
[user2]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY

### And similarly, you can have multiple Named Profiles in your Config File in ~/.aws/config:
[default]
region=us-west-2
output=json

[profile user2]
region=us-east-1
output=text

## To tell your CLI tools to use something other than the default profile, you have to do one of the following:
  1. Set the AWS_PROFILE environment variable. For example, in Linux, you’d run export AWS_PROFILE=user2. After that, you can run any AWS CLI tool (e.g., terraform apply), and it should use your Named Profile.

  2. Some tools let you specify the profile as a command-line parameter or an argument in code. For example, the aws CLI lets you specify --profile: aws ec2 describe-instances --profile user2. In Terraform, you can set the profile parameter in a provider block:


provider "aws" {
  profile = "user2"
}


