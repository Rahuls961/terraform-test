resource "aws_instance" "web" {
    ami = "ami-0cff7528ff583bf9a"
    instance_type="t2.micro"
    key_name = "DevOps_Project_key"
    for_each = toset(["Jenkins-master", "Jenkins-slave"])
    user_data = file("${path.module}/pre-install.sh")
    tags={
        Name="${each.key}"
    }
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
}
