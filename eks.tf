module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-prueba"
  cluster_version = "1.27"
  subnets         = [aws_subnet.private_subnet.id]
  vpc_id          = aws_vpc.vpc_prueba.id

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_types   = ["t3.medium"]
    }
  }

  tags = {
    Environment = "Dev"
    Name        = "EKS Cluster"
  }
}
