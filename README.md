# iaas_as_docker


The goal of this project is to let go of old-fashioned virtual machines and transition to Docker containers to cut infrastructure costs. We will be offering infrastructure as a service (IaaS) in the form of extremely cheap and tiny servers. Each of these servers is powered by an underlying complete virtual machine. The clients have minimal use cases, and that's why they like the affordable proposal of small servers. Access to these servers is provided via SSH to the clients that provide a new VM. To create the servers, we will be writing a script that allows users to customize their SSH access.

We will consider this implementation successful when a client runs the script and the following happens under the hood:

a) SSH keys are generated.

b) A Docker container is created with the SSH keys that were generated.

c) The same Docker container allows login with the username and password provided by the client.


To understand or learn more about the script visit the following blog page

https://0xpranav.hashnode.dev/building-a-iaas-infrastructure-as-a-service-using-docker
