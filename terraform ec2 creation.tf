#Cloud Provider and Region on which Creating the Instance
provider "aws" {
    region = "us-east-1"
}

#Describe the Instance Type & Instance Image(AMI)
resource "aws_instance" "my_ec2_instance" {
    ami = "ami-0e1bed4f06a3b463d"
    instance_type = "t2.micro"

    #Attach the Storage Volume Size & it's Volume type
    root_block_device {
        volume_type = "gp2"
        volume_size = 10
    }

    #Instance Name
    tags = {
        Name = "code-pipeline"
    }

    #Key Pair Name
    key_name = "n.virginia-11"
}

#These Instance ID and Public Ip Assign after the Instance Created
output "instance_id" {
    value = aws_instance.my_ec2_instance.id
}

output "public_ip" {
    value = aws_instance.my_ec2_instance.public_ip
}
