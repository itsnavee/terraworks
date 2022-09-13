from diagrams import Cluster, Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS, RDSMysqlInstance
from diagrams.aws.network import (
    ELB,
    ElbApplicationLoadBalancer,
    InternetGateway,
    VPC,
    PublicSubnet,
    PrivateSubnet,
)

graph_attr = {
    "fontsize": "15",
    "bgcolor": "white"
}

az_attr = {
    "area": "5"
}

with Diagram("AWS 3-tier Architecture", show=True, graph_attr=graph_attr):
    with Cluster("AWS Cloud"):
        with Cluster("VPC"):
            igw = InternetGateway("Internet Gateway")
            with Cluster("/// Availability Zone 1 ///", graph_attr=az_attr):
                with Cluster("Public Subnet"):
                    ec2_az1 = EC2("EC2 Instance")
                
                with Cluster("Private Subnet"):
                    pass

                with Cluster("Private Subnet"):
                    rds_pri = RDS("AWS RDS")
            
            app_lb = ElbApplicationLoadBalancer("Application\nLoad\nBalancer")
                
            with Cluster("/// Availability Zone 2 ///", graph_attr=az_attr):
                with Cluster("Public Subnet"):
                    ec2_az2 = EC2("EC2 Instance")
    
                with Cluster("Private Subnet"):
                    pass

                with Cluster("Private Subnet"):
                    rds_sec = RDSMysqlInstance("RDS DB Instance\nstandby (Multi-AZ)")
    
    
    ec2_az1 >> app_lb >> ec2_az2
    rds_pri >> rds_sec