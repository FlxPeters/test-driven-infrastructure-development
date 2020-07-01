from diagrams import Diagram, Cluster, Edge


from diagrams.onprem.container import Docker
from diagrams.onprem.iac import Terraform, Ansible
from diagrams.custom import Custom


graph_attr = {"fontsize": "45", "bgcolor": "transparent", "dpi": "300"}

with Diagram("", show=False, filename="value_stream", graph_attr=graph_attr):

    image = Docker("Docker Image")
    docker_role = Ansible("Ansible Role Docker")
    app_role = Ansible("Ansible Role App")
    packer_ami = Custom("AMI", "packer.png")

    terrafor_module = Terraform("Module")
    terrafor_stack = Terraform("Deployment")

    image >> app_role >> packer_ami
    docker_role >> packer_ami >> terrafor_module >> terrafor_stack

