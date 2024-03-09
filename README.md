# Deploying a Scalable Reddit Clone in a Secure Cloud-Native Ecosystem


## _Quick Introduction_

In this project, we're **_building a DevSecOps Pipeline_**, with a focus on integrating Security into the the Software Development and Deployment lifecycle. 
   
Through **_Terraform_** for Infrastructure as Code, AWS for cloud services and **_Elastic Kubernetes Service_**, we aim to **_automate and streamline Infrastructure Provisioning and Application Deployment._** Utilising **_Jenkins and ArgoCD_** into our CI/CD processes ensures continuous integration and delivery --> rapid & reliable software releases. SonarQube, OWASP guidelines and Trivy enable continuous security assessments. Incorporating **_Security tools like SonarQube, OWASP and Trivy_** directly into the pipeline allows for continuous Security Assessment.

--

Setting some context...


### _Transition from DevOps to DevSecOps_

Before we actually dive deep into the nitty-gritties, I'd like to quickly set the context as to how DevSecOps emerged:-


-  Why DevOps? DevOps targets _improvising the quality & pace at which applications & services are delivered throughout the development cycle._ 

-  Everything's automated, _Right from Code Integration, builds, tests to continuous Deployment. Infrastructure Provisioning is no excusion._

-  When you've got your build and test phases integrated into the CI/CD Pipelines, errors are detected way early, reducing the impact & costs incurred due to fixing errors post deployment. Automated prevent any regressions, or changes that might break your code.


####  _Key Takeaway:- Faster Release Cycles + Increased Deployment Velocity + Faster Time-to-Market = Fluid Transition from Dev to Prod._

</br>

>  _Okay; So, what spurred up DevSecOps?_

</br>

**Higher the speed, higher the risk of security vulnerabilities being introduced** in the process...   
_Security is not an afterthought_, it need to be integrated in the pipeline
   

Security Analysis, particularly Static Analysis Security Testing (SAST), should be embedded early on, specifically at the pre-commit phase of the development pipeline. SAST delves into the code, its architecture, and configurations from the inside out, ensuring thorough scrutiny for potential vulnerabilities.

Being a member of a former CloudSec Team, I _know_ the kind of time and efforts that go into fixing Security Bugs post Deployment.
Continuous Monitoring and Security Assessments _should_ be an intrinsic part of our workflows. This leads to increased compliance rates, better risk management. 

> It's more of a premptive approach towards Security, making it a shared responsibility for both the developers and the SecOps Team. 


#### This ingrains an essence of Shift-Left Security, "Baking In Security" in the CI/CD Workflows itself.


## Core Services involved:-

  1 - **Terraform:-** Infra-As-a-Code --> Helps manage and provision Infrastructure in a predictable and consistent manner. Brings repeatability into the process of defining and deploying infrastructure

  2 - AWS :- Our Infrastructure backbone wherein we've hosted our application

  3 - Elastic Kubernetes Service (EKS) :- AWS' Managed Service for Kubernetes, allows for orchestration of containerized applications --> Automating the deployment, scaling and management of these containers across a cluster of hosts

  4 -  Jenkins - Continuous Integration / Continuous Deployment (CI/CD) tool for automating the build, test and deployment processes.



