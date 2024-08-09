resource "aws_iam_role" "lab" {
  name = "${var.source_bucket_name}_replication_role"

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "s3.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  POLICY
}

resource "aws_iam_policy" "lab" {
  name = "${var.source_bucket_name}_replication_policy"

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ],
        "Effect": "Allow",
        "Resource": [
          "${var.source_bucket_arn}"
        ]
      },
      {
        "Action": [
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ],
        "Effect": "Allow",
        "Resource": [
          "${var.source_bucket_arn}/*"
        ]
      },
      {
        "Action": [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ],
        "Effect": "Allow",
        "Resource": "${var.dest_bucket_arn}/*"
      }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "lab" {
  role       = aws_iam_role.lab.name
  policy_arn = aws_iam_policy.lab.arn
}

resource "aws_iam_policy" "lab_replication" {
  name = "${var.dest_bucket_name}_replication_policy"

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ],
        "Effect": "Allow",
        "Resource": [
          "${var.dest_bucket_arn}"
        ]
      },
      {
        "Action": [
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ],
        "Effect": "Allow",
        "Resource": [
          "${var.dest_bucket_arn}/*"
        ]
      },
      {
        "Action": [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ],
        "Effect": "Allow",
        "Resource": "${var.source_bucket_arn}/*"
      }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "lab_replication" {
  role       = aws_iam_role.lab.name
  policy_arn = aws_iam_policy.lab_replication.arn
}



