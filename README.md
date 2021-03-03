## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/RouaDalgamouni/ELK-Project/blob/main/Diagrams/ELK-Network-Diagram.png 

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the elk-1.yml file may be used to install only certain pieces of it, such as Filebeat.

  Elk-1.yml - https://github.com/RouaDalgamouni/ELK-Project/blob/main/Ansible/elk-1.yml 

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly Available, in addition to restricting access to the network.

Loadbalancers are crutial component in any secure network architecture due the security measures they bring to the network architecture. Loadbalancer will protect applications from any emerging threats, DoS attacks, and make sure the traffic is distributed among multiple servers to ensure availability, and enhance security by having the inbound traffic passes through the policies on the loadbalancer before being distibiuted further to the servers in the backend pool of the loadbalance
.
additionally we added a jump-box-provisioner VM which introduces another layer of security to the network architecture. The purpose of this jump box is to prevent any inbound traffic to the Web Vms directly. Any connection to the VMs can only be achived through the jump-box-provisioner VM.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and periodically collect metrics from the operating system and from services running on the server (VM) .

- The filebeat will watch for any changes in the file system of the VMs being monitored, it will centerlaize log data, 
- The metricbeat will record detailed information about the operating system and services running on the VM . It will take all the metrics and statistics it collect and output this a dashboard

The configuration details of each machine may be found below.

| Name                 | Function   | IP Address | Operating System     |
|----------------------|------------|------------|----------------------|
| Jump-Box-Provisioner | Gateway    | 10.0.0.4   | Linux - UbuntuServer |
| Web-1                | Web Server | 10.0.0.7   | Linux - UbuntuServer |
| Web-2                | Web Server | 10.0.0.8   | Linux - UbuntuServer |
| ELK-1                | ELK Server | 10.1.0.5   | Linux - UbuntuServer |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: My_Personal_Machine_IP_Address (60.20.26.168)

Machines within the network can only be accessed by Jump-Box-Provisioner.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
- Jump-Box-Provisioner with Ansible container instaleed on it, is the only machine allowed to access the ELK VMs 

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses            |
|----------------------|---------------------|---------------------------------|
| Jump-Box-Provisioner |         Yes         | 60.20.26.168                    |
| Load Balancer        |         Yes         | Any IP Address from Internet    |
| Web-1                |          No         | 10.0.0.4                        |
| Web-2                |          No         | 10.0.0.4                        |
| ELK-1                |         Yes         | 60.20.26.168 10.0.0.7 10.0.0.8  |

|### Elk Configuration

- _TODO: What is the main advantage of automating configuration with Ansible?_
Ansible is used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is simple, easy to be read by human, easy to write as it does not require coding skills, it is powerful as it helps IT admins to integrate and deploy apps, and mange configuration smoothly and easily, as easy as one click. Which in return increase the productivity and boost productions since it saves a lot of time and effort compared to manual deployment.



The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install Docker.io on ELK VMs using the Apt module
- Install Python3-pip on ELK VMs using the apt module
- Install Docker on ELK VMs using the pip module
- Increase the virtual memory on the ELK VMs to 262144B using sysctl command
- Download, and launch docker, enable docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/RouaDalgamouni/ELK-Project/blob/main/Diagrams/ELK-docker-ps.PNG 

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Web-1: 10.0.0.7
- Web-2: 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- The filebeat will collect logfiles about the operating system and it support structured logs such as auditlogs, server logs, slow logs, and deprecation logs
- The metricbeat is more focused on the system-level metrics. it collects and reports these system-level metrics
Example heartbeat will monitor the uptime of the machine nad auditbeat willgive log data that can help in auditing user and process activity

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk-1.yml file to /etc/ansible directory.
- Update the hosts file to include the hosts/machines you want to run the ansible playbook on. In order to specify which machines the playbook will run on, we need to define groups in the hosts file and list the IP adresses of the machines under each group accordingly. for example the elk-1.yml playbook should be run on Web-1 and Web2 VMs, in the hosts file we add the IP addresses of Web-1 and Web-2 under the [webservers] group. This way when elk-1.yml is executed, only machines under [webserver] group will be effected. same thing applies on the ELK instance/machine.
- Run the playbook, and navigate to the ELK server from your web browser by typing "http://Ip-adress-ELK-Machine:5601/apps/kibana" to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
