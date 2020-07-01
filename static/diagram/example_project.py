from diagrams import Diagram, Cluster, Edge
from diagrams.custom import Custom
from urllib.request import urlretrieve

from diagrams.aws.compute import EC2, AutoScaling
from diagrams.aws.network import ELB
from diagrams.onprem.container import Docker
from diagrams.programming.language import Python

from diagrams.onprem.iac import Terraform, Ansible

graph_attr = {"bgcolor": "transparent", "dpi": "300"}

with Diagram(
    "Example Project",
    show=True,
    filename="clustered_web_services_example",
    graph_attr=graph_attr,
):
    with Cluster("Multi-Region"):

        lb = ELB("ELB")

        with Cluster("Services"):
            autoscaling = AutoScaling("autoscaling-group")
            svc_group = [EC2("web-01"), EC2("web-02")]

        lb >> autoscaling >> svc_group

        with Cluster("AMI"):

            docker = Docker("Docker")

            with Cluster("Docker Image"):
                app = Python("App")

        svc_group - docker
        docker - Edge(style="dotted") - app
