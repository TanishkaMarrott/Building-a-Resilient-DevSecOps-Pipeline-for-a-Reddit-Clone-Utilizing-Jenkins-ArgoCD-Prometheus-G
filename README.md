# Implementing a Secure & Scalable Reddit Clone within a cloud-native Architecture


## _Quick Introduction:-_

Our project revolves around _**DevSecOps**_ that streamlines, and secures development & deployment phases of a typical SDLC.   
> => Speeding up Time-to-Market + Having Robust Security Measures throughout = Dual Focus

Intent here is to ensure high-quality, rapid software releases; _but with Security at its forefront._  



> Instead of tackling Security at the very end of projects with penetration tests after deploying the code, **"DevSecOps bakes security in every stage."** Includes building, testing, and deploying software where security was often an afterthought.

### How does the workflow look like?
- We've automated _Infrastructure Deployment through Terraform._  Container Orchestration has been optimised through **_EKS - Elastic Kubernetes Service._**   
- Incorporated **_Jenkins & Argo CD_** to _accelerate the Continuous Integration and Deployment lifecycles._    
- Security is an intrinsic part here with  - **_SonarQube_** = for Static Analysis Security Testing, **_OWASP_** = Security Vulnerabilities ; **_Trivy_** = Container Image Scanning
- Integration of **_Prometheus_** **_Grafana_** & **_EFK stack_** provides with comprehensive Logging, Monitoring and Data Visualisation Capabilities   

--

Setting some context...


### _Transition from DevOps to DevSecOps_

Before we actually dive deep, I'd like to quickly set the context as to how DevSecOps emerged:-

-  ** Why DevOps? Primary target is to _improvise the quality & pace at which Applications & Services are delivered throughout._ 

-  _Everything's automated in the development and deployment cycle_ -->  Infrastructure Provisioning, Code Integration, Builds, Tests to Continuous Deployment

-  When you've got your build and test phases well-integrated, errors are detected way early, reducing the impact & costs incurred due to fixing errors post deployment. Automated tests prevent any regressions, or changes that might break your code.


####  _Key Takeaway:- Faster Release Cycles + Increased Deployment Velocity + Faster Time-to-Market = Fluid Transition from Dev to Prod._

</br>

>  _Okay; So, what spurred up DevSecOps?_

</br>

**Higher the speed, higher the risk of security vulnerabilities being introduced** in the process...   


   
Security Analysis, particularly SAST, should be embedded early on, specifically at the pre-commit phase of the development pipeline.It analyses the code from inside out its architecture, and configurations from the inside out. --> Detecting errors early, and aiding in it subsequent remediation

Being a member of a former CloudSec Team, I _know_ the kind of time and effort that goes into fixing Security Bugs post Deployment. (Leave alone the braking production deployments!)
Continuous Monitoring and Security Assessments _should_ be an intrinsic part of our workflows. This leads to increased compliance rates, better risk management. 

> It's more of a premptive approach towards Security, making it a shared responsibility for both the developers and the SecOps Team. 


#### This ingrains an essence of Shift-Left Security, "Baking In Security" in the CI/CD Workflows itself.


## Core Services involved:-

  1 - **Terraform:-** Infra-As-a-Code --> Helps manage and provision Infrastructure in a predictable and consistent manner. Brings repeatability into the process of defining and deploying infrastructure

  2 - AWS :- Our Infrastructure backbone wherein we've hosted our application

  3 - Elastic Kubernetes Service (EKS) :- AWS' Managed Service for Kubernetes, allows for orchestration of containerized applications --> Automating the deployment, scaling and management of these containers across a cluster of hosts

  4 -  Jenkins - Continuous Integration / Continuous Deployment (CI/CD) tool for automating the build, test and deployment processes.



