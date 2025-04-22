# lab_tf
Terraform lab with private and public instances
The aim of this lab, is implement a scalable, secure cloud network architecture using Terraform for a company called FridayHITT. 
FridayHITT delivers High-Intensity Interval Training (HIIT) running routes every Friday, for each user specific to each users’ location. The FridayHITT company requires an extensible cloud-based infrastructure, as they expect to have rapid growth.
 The aims were:
  1.	A scalable, secure design was created from cloud formation and an infrastructure created. It must meet the business requirements of a network with public and private subnets, EC2 instances, security groups, routing tables, and other AWS services.
  2.	The infrastructure has a public EC2 instance and a private EC2 instance. The private instance should only be accessed securely, through a jump box (bastion host).
  3.	Security groups allow only essential traffic between components and from IP ranges.
  4.	Routing tables and an Internet Gateway were configured to allow controlled access to the internet and block any unauthorised communication.
  5.	A jump box was to be deployed in the public subnet, to securely connect to the EC2 instance in the private subnet using SSH.
  6.	 The design supports multiple Availability Zones (AZs) for high availability.
