#service-role-dev-core-001-kube-deployments
resource "aws_iam_role" "service_role_dev_core_001_kube_deployments_role" {
  name = var.service_role_dev_core_001_kube_deployments_role_name
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : [
              for name in var.service_role_dev_core_001_kube_deployments_username : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${name}"
            ],
            "Service" : "eks.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        },
        {
          "Effect" : "Allow",
          "Principal" : {
            "AWS" : [
              "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.cb_apps_role_name}"
            ],
            "Service" : "eks.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "service_role_dev_core_001_kube_deployments_policy" {
  name = var.service_role_dev_core_001_kube_deployments_policy_name
  role = aws_iam_role.service_role_dev_core_001_kube_deployments_role.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : "eks:DescribeCluster",
        "Resource" : "*"
      }
    ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "service_role_dev_core_001_kube_deployments_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.service_role_dev_core_001_kube_deployments_role.name
}

resource "aws_iam_role_policy_attachment" "service_role_dev_core_001_kube_deployments_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.service_role_dev_core_001_kube_deployments_role.name
}

