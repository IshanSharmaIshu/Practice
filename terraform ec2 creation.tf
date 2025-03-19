# 1. Install Terraform from the Terraform.io site 
# 2. sudo apt install python3-pip
# 3. For Credentials save: mkdir -p ~/.aws
# 4. nano ~/.aws/credentials
# 5. mkdir terraform
# 6. cd terraform/
# 7. main.tf




#Cloud Provider and Region on which Creating the Instance
provider "aws" {
    region = "region.name.type.here"
}

#Describe the Instance Type & Instance Image(AMI)
resource "aws_instance" "my_ec2_instance" {
    ami = "ami.id.in(x86).paste.here"
    instance_type = "t2.micro"

    #Paste Your Creted Security Group ID
    vpc_security_group_ids = ["paste.sg.id.after.creting.the.sg.by.tf.code"]

    #Attach the Storage Volume Size & it's Volume type
    root_block_device {
        volume_type = "gp2"
        volume_size = type.storage.which.you.want
    }

    #Instance Name
    tags = {
        Name = "type.instance.name.here"
    }

    #Key Pair Name
    key_name = "type.key-pair.name.here"
}

#Security Group Name
resource "aws_security_group" "web_sg" {
    name = "type.sg.name.here.which.you.want.to.create"
    description = "Allow HTTP and HTTPS traffic"

    #Attach SSH Port
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #Attach HTTP Port
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #Attach HTTPS Port
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#These Instance ID and Public Ip Assign after the Instance Created
output "instance_id" {
    value = aws_instance.my_ec2_instance.id
}

output "public_ip" {
    value = aws_instance.my_ec2_instance.public_ip
}