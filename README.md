# Implementing a Secure & Scalable Reddit Clone within a cloud-native Architecture


## _Quick Introduction:-_

Our project today is all about the specifics involved while configuring a  _**DevSecOps Pipeline.**_     
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.


--> _What are we trying to achieve?_   
**Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value**

</br>


### _How does the workflow look like?_

It's more like an iterative worflow, with continuous feedback loops...   

--> _That's actually important when you're aiming for scalability, resilience and security._


- **_Infrastructure Provisioning with Terraform_**    **-->** for automating Infrastructure Setup

- **_Container Orchestration with Elastic Kubernetes Service_**    **-->** For managing the application's lifecycle

- **_Jenkins & ArgoCD as our CI/CD Backbone_**.     
   **-->** Automated builds and tests to make sure every change's verified.       
   Argo CD would then facilitate continuous deployment of the application to the Kubernetes environment

- **_Security Integration_** at every phase in the pipeline.
   -  **_Static Analysis Security Testing (SAST) --> SonarQube_**
   -  **_Vulnerability assessments --> OWASP_**
   -  **_Container image scanning --> Trivy_**

- **_Deployed Prometheus, Grafana, and EFK Stack_** - (ElasticSearch, Fluentd, Kibana)      
   **-->** For **_Comprehensive Logging, Monitoring and Data Visualisation Capabilities_**,      
        Real-time Insights into Application's health and performance.







</br>

### How does DevSecOps align with the Business principles?

> **_From a Business standpoint, it's critical that we position ourselves in a way, that our processes align with Agile DevSecOps Practices_**


Why? We need a robust base to work upon...  

for continous improvement with DevOps Practices, while quickly adapting to changing business requirements. Ultimately, by prioritizing security within our continuous deployment framework, we are working towards minimizing vulnerabilities; Quicker Product Iterations + Security Ingrained = Trust and a better edge amongst competitors



</br>


More on the Technical Aspects subsequently


### How does the workflow look like?

It's more like an orchestrated sequence --> That's actually important when you're aiming for scalability, resilience and security.

Infrastructure Provisioning with Terraform - We're automating the infra-setup aspect --> Consistent and repeatable Environments ready for deployment.

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



