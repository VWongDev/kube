#!/bin/bash
eksctl create iamidentitymapping \
    --cluster kube-cluster \
    --region ${AWS_REGION} \
    --arn arn:aws:iam::${AWS_ACCOUNT}:role/ClusterAccessRole \
    --username eks-general-access \
    --group system:masters

eksctl create iamidentitymapping \
    --cluster kube-cluster \
    --region ${AWS_REGION} \
    --arn arn:aws:iam::${AWS_ACCOUNT}:user/admin \
    --username eks-admin-access \
    --group system:masters