resource aws_instance "jumpserver" {
  for_each                    = local.instances
  ami                         = var.jumpserver_ami
  instance_type               = each.value.type
  subnet_id                   = data.terraform_remote_state.networking.outputs.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags                        = merge({ "Name" = each.value.env })
}


resource "aws_security_group" "jumpserver_sg" {
  name        = var.jumpserver_sg_name
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "app_test_sg" {
    name = var.app_test_sg_name
    dynamic "ingress" {
        for_each = var.app_test_sg_ingress_rule
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
  
}