provider "aws" {
  region = "us-east-2"
  profile = "sandbox-eng-enablement"
}

resource "aws_iam_user" "my-user" {
  name = "Wheeler"
}

resource "aws_iam_policy" "custom-policy" {
  name = "WheelerPolicy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "ec2:ResetInstanceAttribute",
                "ec2:CreateIpamPool",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:ModifyVpnConnectionOptions",
                "ec2:ReleaseIpamPoolAllocation",
                "ec2:CreateCoipPoolPermission",
                "ec2:DeleteNetworkInsightsAnalysis",
                "glacier:PurchaseProvisionedCapacity",
                "ec2:UnassignPrivateIpAddresses",
                "ec2:DisableImageDeprecation",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:CancelCapacityReservationFleets",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:ModifyInstanceMaintenanceOptions",
                "ec2:DeleteNatGateway",
                "ec2:CancelCapacityReservation",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "glacier:ListVaults",
                "ec2:ModifyVpcEndpoint",
                "ec2:ModifyInstanceCapacityReservationAttributes",
                "ec2:CreatePublicIpv4Pool",
                "ec2:DeleteSpotDatafeedSubscription",
                "ec2:ImportVolume",
                "ec2:ModifyFleet",
                "ec2:RequestSpotFleet",
                "ec2:CreateSubnetCidrReservation",
                "ec2:DeleteTransitGatewayMulticastDomain",
                "ec2:ModifyReservedInstances",
                "ec2:ReleaseAddress",
                "ec2:CreateTrafficMirrorTarget",
                "ec2:ModifyTrafficMirrorFilterRule",
                "ec2:CreateClientVpnRoute",
                "ec2:CreateLocalGatewayRoute",
                "ec2:SendSpotInstanceInterruptions",
                "ec2:ProvisionByoipCidr",
                "ec2:DisableSerialConsoleAccess",
                "ec2:DeprovisionIpamPoolCidr",
                "ec2:DeleteIpamScope",
                "ec2:DeleteVpcEndpointConnectionNotifications",
                "ec2:RestoreAddressToClassic",
                "ec2:DeleteCustomerGateway",
                "ec2:AssociateTransitGatewayPolicyTable",
                "ec2:ModifyVpcTenancy",
                "ec2:ApplySecurityGroupsToClientVpnTargetNetwork",
                "ec2:ConfirmProductInstance",
                "elasticfilesystem:DescribeBackupPolicy",
                "ec2:EnableEbsEncryptionByDefault",
                "ec2:PurchaseHostReservation",
                "ec2:ReplaceIamInstanceProfileAssociation",
                "ec2:DisassociateEnclaveCertificateIamRole",
                "ec2:CreateTransitGatewayPrefixListReference",
                "ec2:ModifyTrafficMirrorSession",
                "ec2:CreateTransitGatewayPeeringAttachment",
                "ec2:DeleteTransitGatewayVpcAttachment",
                "ec2:AssociateTrunkInterface",
                "ec2:ReplaceNetworkAclEntry",
                "ec2:ModifyVpcPeeringConnectionOptions",
                "ec2:CreateTransitGatewayMulticastDomain",
                "ec2:CreateTrafficMirrorFilterRule",
                "ec2:ImportImage",
                "ec2:DeleteVpnConnection",
                "ec2:RejectVpcEndpointConnections",
                "ec2:ModifyEbsDefaultKmsKeyId",
                "ec2:ResetImageAttribute",
                "ec2:SendDiagnosticInterrupt",
                "ec2:DisableTransitGatewayRouteTablePropagation",
                "ec2:CreateVpcEndpointConnectionNotification",
                "ec2:CreateTransitGatewayRouteTableAnnouncement",
                "ec2:CreateCustomerGateway",
                "ec2:CreateIpam",
                "ec2:DeleteTransitGatewayRouteTable",
                "ec2:DeleteTransitGatewayRoute",
                "ec2:DeleteVpc"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy-bind" {
  name       = "attachment"
  users = [aws_iam_user.my-user.name]
  policy_arn = aws_iam_policy.custom-policy.arn
}
