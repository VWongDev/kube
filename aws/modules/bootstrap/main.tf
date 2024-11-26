data "aws_caller_identity" "current" {}

resource "aws_iam_openid_connect_provider" "github_oidc_provider" {
    url = "https://token.actions.githubusercontent.com"
    client_id_list = [ "sts.amazonaws.com" ]
    thumbprint_list = [ "D89E3BD43D5D909B47A18977AA9D5CE36CEE184C" ]
}

resource "aws_iam_role" "kube_pipeline_role" {
    name = var.repo_name

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect    = "Allow",
                Principal = {
                    Federated = "${aws_iam_openid_connect_provider.github_oidc_provider.arn}"
                },
                Action    = "sts:AssumeRoleWithWebIdentity",
                Condition = {
                    StringLike   = {
                        "token.actions.githubusercontent.com:sub" = "repo:${var.org_name}/${var.repo_name}:environment:${var.environment}"
                    },
                    StringEquals = {
                        "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
                    }
                }
            }
        ]
    })
}