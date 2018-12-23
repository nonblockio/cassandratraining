resource "aws_security_group" "cassandra_elb_sg" {
  vpc_id = "${aws_vpc.cassandra_vpc.id}"
  name   = "cassandra_elb_sg"

  tags {
    Name = "${var.tag}"
  }
}

resource "aws_security_group_rule" "elb_ingress_9042" {
  type              = "ingress"
  from_port         = 9042
  to_port           = 9042
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.cassandra_elb_sg.id}"
}

resource "aws_security_group_rule" "elb_ingress_9160" {
  type              = "ingress"
  from_port         = 9160
  to_port           = 9160
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.cassandra_elb_sg.id}"
}

resource "aws_security_group_rule" "elb_egress_9042" {
  type              = "egress"
  from_port         = 9042
  to_port           = 9042
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = "${aws_security_group.cassandra_elb_sg.id}"
}

resource "aws_security_group_rule" "elb_egress_9160" {
  type              = "egress"
  from_port         = 9160
  to_port           = 9160
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = "${aws_security_group.cassandra_elb_sg.id}"
}
