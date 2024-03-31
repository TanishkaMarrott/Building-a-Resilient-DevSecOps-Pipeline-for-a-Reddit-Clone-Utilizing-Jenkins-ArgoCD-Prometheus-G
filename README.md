# Orchestrating a DevSecOps Pipeline for Cloud-Native Reddit Clone


## _Quick Introduction_:-

Our project today is all about the specifics involved while configuring a  **_DevSecOps Pipeline._**   
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.

--> _What are we trying to achieve?_    
&nbsp; &nbsp; &nbsp; **Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value** 

&nbsp;

## _So, how does the workflow actually look like?_


**_Infrastructure Provisioning_** - Terraform   
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;     ↓     
**_Container Orchestration_** - Elastic Kubernetes Service       
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;    ↓      
**_CI/CD_** - Jenkins & ArgoCD      
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;   ↓     
**_Security Integrations_** - SonarQube, OWASP & Trivy      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  ↓       
**_Logging, Monitoring & Data Visualization_** - Prometheus, Grafana & EFK Stack      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;   ↓     
**_Real-time Insights_** into application health & performance       

--
</br>

>  _**Okay, so how does DevSecOps augment Business Processes?**_

</br>

## _How does DevSecOps align with my Business Goals?_


_Simple Answer:-_   
**Solid Foundation to quickly realign with changing business requirements**

</br>

_It's more like a ***Strategic Enabler,***_ to boost efficiency, streamline processes.    

--> _Quicker product iterations & feedback loops_ through continuous integration and deployment   
 means we're **_market-agile._**     
</br>

> #### **<ins>Agile DevSecOps = Swiftly adapting to evolving Business Requirements.**

</br>

--> _Quality Assurance_ (due to Automated Testing) + _Reducing costs_ due to post-deployment fixes.   
 Mitigating Security risks early means **_averting Data Security incidents / breaches due to security lapses._**
</br>

</br>



## _Phase 1 &rarr; Infra-Setup & Tool Configuration_

-->Setting up the necessary infrastructure and configuring essential tools in this phase
         
--> Establishing the base for our CI/CD pipeline and security assessments. Next, we've **_configured Jenkins Plugin Installations_**, --> Aid in integrating Jenkins with other CI/CD tools in our pipeline. 

Please check `updated_main.tf` & `install.sh`

</br>

### _Segregating the kind of plugins we've used:-_

--

### **_✔️ Foundational Plugins - The Core for setting up Jenkins:-_**     

--> These include the SCM Plugins, the ones used for integrating build tools with Jenkins; Notification & reporting, General Utilities. the ones around User management, plugins for testing Frameworks or for orchestrating pipeline workflows (the pipeline plugin)

</br>

> In short, it's for a **fully functional Jenkins environment**, covering all the necessary aspects from Source Code Management to Pipeline Orchestration

</br>

### **_✔️ The Specialised Ones:-_**   



| Category                | Plugin/Tool                 | Purpose                                                                                   |
|-------------------------|-----------------------------|-------------------------------------------------------------------------------------------|
| **Code Quality & Analysis** | **SonarQube Scanner**       | Integrates SQ into Jenkins --> SAST|
|                         | **Sonar Quality Gates**     | Breaks the build based on SonarQube quality gates --> code quality  |
|                         | **OWASP Dependency Check**  | --> Vulnerabilities within the project's dependencies.                                |
| **IaC Scanning** | **TfSec**  | Scans the IaC for security misconfigurations. |
| **Dynamic Application Security Testing - DAST** | **OWASP ZAP**              | Dynamic analysis of running web applications |
| **Secrets Detection**  | **truffleHog**              | Scans the repository for accidentally committed secrets |
| **Performance Testing** | **JMeter**                  | Load testing - Application's resilience            |

--

_**Quick Steps on SQ + Jenkins:-**_       
            
We've integrated SonarQube with our Jenkins pipeline using a security authentication token. By configuring SonarScanner in Jenkins and securely managing credentials, we've enabled automated code inspections.        

--> Quality gates in SQ ensures that code must meet specific quality standards before it can proceed through the pipeline. Additionally, the webhook feature provides immediate feedback within our CI/CD process --> Quick identification & resolution of issues. 

--

## _Why global tool configurations?_

Specialised plugins are like  _add-ons to enhance the functionality of Jenkins..._                
--> Allow for _**integration of Jenkins with other tools in the pipeline**_                                   

</br>

Global tool configurations are slightly different....   
_It's all about defining development tools at a global scope_     

So, they're _automatically installed & available to all jobs_                   
 <ins>**--> In a way, it standardises the environment across all builds, and projects.**</ins>        

</br>

 >  _Once setup, they **eliminate the need of manually configuring specific versions** of these runtimes/environments for each of them separately._

</br>

### **_Global Tool Configurations we've utilised:-_**   

| Category                | Tools                   | Purpose                                                                                   |
|-------------------------|------------------------|-------------------------------------------------------------------------------------------|
| Runtime & Environment   | **Eclipse Temurin Installer** | Automates the JDK's installation => Means a specific version of the JDK is available for all jobs. |
|                         | **Nodejs**                 | Ensures the necessary runtime version is available for JavaScript-based applications. |



## _Phase 2 --> Pipeline Configuration_

In Phase 2 of our project, we've focused on pipeline configuration to automate our build and deployment processes.             
The pipeline, scripted in a Jenkinsfile, (Please check `Jenkinsfile` above) utilises both JDK 17 and Node.js 16 tools for a build environment suitable for our Reddit Clone App. 

</br>

<img width="946" alt="Reddit-Clone-App-Jenkins-Pipeline" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/430d0863-09e9-4064-bfc6-4ec2d101d5b0">


</br>

### _CI/CD Pipeline - Key Stages_
1 --> _<ins>Workspace Preparation</ins>_: Ensures a clean workspace               
 --> No interference from previous builds.

2 --> _<ins>Code Checkout</ins>_: We fetch the latest code from the main branch of our Git repository to maintain up-to-date integration.

3 --> _<ins>Static Code Analysis</ins>_:            
Through SonarQube, we've scrutinized the code for potential bugs, vulnerabilities, and maintainability concerns.

4 --> _<ins>Quality Gate</ins>_: Crucial checkpoint - aligns with our quality criteria             
--> Decides if changes can be promoted.

5 --> _<ins>Dependency Installation</ins>_:          
We then install the necessary dependencies / components for our application.

6 --> _<ins>Security Scans</ins>_:  OWASP's Dependency-Check and Trivy, scanning both our file system and Docker images.

7 --> _<ins>Containerization</ins>_:          
The application is containerized using Docker --> consistent deployment and scalability.

8 --> _<ins>Secrets Detection</ins>_:             
We employ TruffleHog to detect any unintentional secret exposures.

9 --> _<ins>Infrastructure as Code Analysis</ins>_:                         
Lastly, we analyze our Terraform configurations with tfsec to ensure our infrastructure is defined securely.

</br>

You can find the application code here :- https://github.com/TanishkaMarrott/Reddit-Clone-App

_**Dependency-Check Results**_ – This screenshot from Jenkins displays the results of the Dependency Check, showcasing the distribution and severity of discovered vulnerabilities in the Reddit Clone App.


![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/0e9a27ca-158a-4fa4-bfd7-4f82c5f6d30e)


</br>

_**Console Output**_ - This image captures the console output in Jenkins, --> Verbose Logs for execution of the pipeline stages for the Reddit Clone App.

![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/cc0a6fbd-245c-49c4-9144-b0a6c41e7c80)

</br>

_**SonarQube Dashboard**_ - This screenshot shows a successful Quality Gate with overview of code analysis for the Reddit project

<img width="958" alt="Reddit-Clone-App-SonarQubeServer" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/698eaff4-1db7-4938-b711-2a3141543b88">



_**Docker Hub Repository: 'tanishkamarrott/reddit'**_ – The third screenshot shows the Docker Hub repository page for the 'reddit' image, ready for Image pushes

![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/395f374d-9dbd-4436-9f73-c18848d40ccf)

</br>

Now that we're done with the continuous integration part, we'd move to the deployment part.  Continuous deployment is geared towards automating the deployment of code from dev to prod, post a successful build, that's post passing the necessary code quality and security tests. 

</br>

--> Means a faster deployment velocity, accelerated software releases = Faster time-to-market 

</br>

### _Is Testing a part of both CI and CD?_

**Yes.**             
But the kind and the emphasis of testing differs.....

What does this mean? Testing in CI is primarily about running tests against the code to ensure the codebase is stable and functional throughout. Integrating multiple code changes into the main-stream, won't break production. It mostly revolves around **Unit testing** & **Integration testing**.          

The goal here is frequent, incremental updates - (**Immediate feedback** = **Quicker Iterative loops**)

When I talk about CD, it's not only about a "bug-free" code. You need some other types of testing too, **Security testing**, **Performance Testing**, **UAT testing**. Making my software production-ready, considering all non-functional aspects as well. 

> *Is my software production ready? Can this be delivered to my users? Does it meet the overall high quality standards?* CD answers such questions.

</br>

Let's start with the Terrform Configurations involved...

</br>

## _Phase 3 ---> Provisioning the EKS Cluster through Terraform_

Please check my code here:- https://github.com/TanishkaMarrott/AWS-EKS-TF/tree/main'


### _What're we doing here?_

We've got two modules here:- `vpc` and `eks`

Here **_we're provisioning a Kubernetes cluster using Elastic Kubernetes Service, for running our containerised application._**

#### _A --> The VPC Module_

Generic requisistes here, --> Setting up the VPC environment where our EKS cluster will live. Public Subnets + IG for the cluster's connectivity externally + creation of route tables + association with the subnets for routing the traffic.


> Importantly, it configures the network infrastructure to **_support high availability by deploying resources across multiple AZs_** when possible.

#### _B --> The EKS Module_

The `eks` module takes care of creating the EKS cluster within the VPC created by the `vpc` module. This includes specifying the cluster name, associating an IAM role that EKS can assume for creating AWS resources on our behalf and configuring the VPC settings like subnet IDs and access controls for the Kubernetes API server.

Furthermore, it creates a managed node group, which is a group of EC2 instances that serve as worker nodes for the Kubernetes cluster. The node group configuration includes specifying the instance type, the desired number of nodes and scaling settings to automatically adjust the number of nodes based on load.

Security and Access
Security groups are defined to control inbound and outbound traffic to the nodes in the cluster. IAM roles and policies are attached to grant the necessary permissions for the EKS cluster and its nodes to interact with other AWS services securely.

Outputs
The configuration defines several outputs, such as the EKS cluster endpoint, cluster ID, and certificate authority data required for configuring kubectl to communicate with the cluster. These outputs are essential for integrating the EKS cluster with external tools and services or for providing information needed for manual configuration steps.

Workflow Summary
The entire development workflow revolves around provisioning a robust, scalable, and secure Kubernetes environment on AWS. By modularizing the setup into VPC and EKS components, it offers flexibility, reusability, and clearer separation of concerns. The VPC module sets the foundation with a well-configured network, while the EKS module leverages that network to run Kubernetes workloads effectively. Together, these modules automate the creation of a Kubernetes cluster that's ready to deploy containerized applications, providing a scalable and highly available platform that adheres to AWS best practices.


<img width="949" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/77c0230f-4b32-4b7f-8c20-e44f7035f58d">


<img width="515" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/78b7dab5-93ac-42a3-8677-ee20420b0e46">




