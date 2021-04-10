# Project-13
Azure Cloud 
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK-Diagram](https://github.com/kmamin95/Project-13/blob/main/Diagrams/Week%2013%20Project%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

 ![pentest.yml](https://github.com/kmamin95/Project-13/blob/main/Ansible/pentest.yml)
 ![ELK.yml](https://github.com/kmamin95/Project-13/blob/main/Ansible/install-elk.yml)
 ![metricbeat-playbook.yml](https://github.com/kmamin95/Project-13/blob/main/Ansible/metricbeat-playbook.yml)
 ![filebeat-playbook.yml](https://github.com/kmamin95/Project-13/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting suspicious inbound traffic to the network.
Load Balancers protect against Denial of Service attacks by redirecting traffic to all servers equally so that not one single server is
overloaded with traffic which could possibly result in a crash, halt of service and loss of revenue. Having a jump box is advantageous because a jump box server is regularly monitored and is also hardened. Administrators first connect to the jump box and then proceed to perform tasks which might involve accessing unsecure environments.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
Filebeat acts as an agent on the servers, it monitors logs files, collects logs events and then redirects them to Elasticsearch or logstash.
Metricbeat is used to keep record of the metrics and statistics of the operating system and other services which are running on the server.
The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](https://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name              | Function   | IP Address | Operating System |
|-------------------|------------|------------|------------------|
| JumpBox-RedTeamVM | Gateway    | 10.0.0.4   | Linux            |
| Web1              | Web Server | 10.0.0.5   | Linux            |
| Web2              | Web Server | 10.0.0.6   | Linux            |
| ELK-VM            | Elk Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
- 142.116.63.100

Machines within the network can only be accessed by the RedTeamVM JumpBox machine.
The JumpBox machine was allowed access to the ELK VM through SSH Port 22, and its IP address is 10.0.0.4 (Private IP of Jumpbox VM) and my personal workstation has access to the ELK-VM through port 5601 with the IP address 142.116.63.100 (Public IP Address).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                  |
|----------|---------------------|---------------------------------------|
| Jump Box |         Yes         |             142.116.63.100            |
|   Web 1  |          No         |                10.0.0.4               |
|   Web 2  |          No         |                10.0.0.4               |
|    ELK   |         Yes         | 10.0.0.4 & 142.116.63.100 (Port 5601) |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because
it gives administrators spare time which can be spent on more important tasks such as improving business values.
The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Install Docker module (default - pip3)
- Increase virtual memory
- Use more memory
- download and launch a docker elk container
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 10.0.0.5
- Web2 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log data about the file system, it collects log events and forwards them to Elasticsearch.
- Metricbeat collects machine metrics such as uptime.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK.yml file to /etc/ansible directory in the ansible container.
- Update the hosts file to include Elk servers along with Webservers and input the specific IP connected to the Elk server.
- Run the playbook, and navigate to the ELK server through ssh to check that the installation worked as expected. Navigate to http://104.40.8.246:5601/app/kibana#/home URL to see all data and metrics in a visual interface. 

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
