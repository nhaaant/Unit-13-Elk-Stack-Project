# Unit-13-Elk-Stack-Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly stable, in addition to restricting access to the network.
- Load balancers help server stablity by distributing network traffic which prevents overload failures that could occur due to a DDoS attack for instance. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitor systems by capturing log data and events. 
- Metricbeat collects the metric data from systems and includes data such as CPU, memory, etc. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function   | Ip Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.7   | Linux            |
| DVWA 1   | Web Server | 10.0.0.6   | Linux            |
| DVWA 2   | Web Server | 10.0.0.5   | Linux            |
| ELK      | Monitor    | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My public ip: 172.250.94.112

Machines within the network can only be accessed by SSH.
- We allowed the JumpBoxProvisoner(10.0.0.4) to our ELK VM

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Address |
|----------|---------------------|--------------------|
| Jump Box | No                  | 172.250.94.112     |
| DVWA 1   | No                  | 10.0.0.4           |
| DVWA 2   | No                  | 10.0.0.4           |
| ELK VM   | No                  | 10.0.0.4           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It allows us to easily configure new machines along with configuing hundreds of machines at once. Also since it's the same ruleset, we won't have to worry about errors as long as it works once; Infrastructure as code.

The playbook implements the following tasks:
- Installed Docker
- Installed python3-pip
- Increased virtual memory w/ sysctl -w vm.max_map_count=262144
- Installed ELK container 
- Enabled docker to start on boot. 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 (10.0.0.6)
- Web-2 (10.0.0.5)

We have installed the following Beats on these machines:
- Filebeat   
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: allows us to monitor log files that include audit logs, deprecation logs, gc logs, server logs, and slow logs on our VM
- Metricbeat: allows us to view the metric data from our VMs and includes information such as CPU, memory and other processes running on our system.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the /etc/ansible/files/filebeat-config.yml to /etc/filebeat/filebeat.yml.
- Update the configuration files to include elasticsearch and the elkserver IP for setup.kibana
- Run the playbook, and navigate to (http://[ELKPublicIp]:5601/app/kibana#)Kibana to check that the installation worked as expected.

