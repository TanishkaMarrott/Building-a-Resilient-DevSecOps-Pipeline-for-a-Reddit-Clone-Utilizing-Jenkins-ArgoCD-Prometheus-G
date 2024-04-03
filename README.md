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

Please check my code here:- https://github.com/TanishkaMarrott/AWS-EKS-TF/tree/main'

## _Key Design Considerations:-_


### _Multi-AZ NAT Gateway Setup + Multi-AZ Worker Node Deployment:-_ 

In this architecture, we've deployed **three NATs each with its own Elastic IP**, to ensure **high availability** and **fault tolerance**.

</br>

> We can thus ensure that our architecture can withstand an AZ Failure. If one NAT gateway becomes unavailable due to some issue in an AZ, we can still route outbound traffic to the internet, ensuring continuous access to our resources. Also, failure/outage of an AZ does not impact the availability of our application, hence **fault-tolerant**.   

</br> 

▶ **High Availability** + **Fault Tolerance** = 👍

There's one more advantage to it, **Performance Optimization**.  

</br>   

>  By optimizing network paths, traffic from the instances do not necessarily need to cross inter-AZ for reaching the internet, = reducing **Latency** 👍. It does help in the scalability aspect as well since resources in each AZ can scale out independently. We can add new subnets and add new instances in each AZ, without worrying NAT Gateway being a potential bottleneck.

</br>

➡ However, this is a **cost vs. fault tolerance trade-off**. The decision to implement this architecture is based on prioritizing the application's availability and performance over the cost considerations.

### _Strategic Mix of Public and Private Subnets_

</br>

> We've got a strategic mix of public and private subnets in our VPC. The public subnets host the Load Balancers and NAT Gateways (the resources which are intended to be public), so, they'll distribute incoming internet traffic to the pods running the application. This setup simplifies and centralizes traffic management while keeping our backend pods secure. Also, in case the applications in the private subnet wish to connect to the internet, for example for updates, APIs etc., it can be done via the NAT deployed in each public subnet = **secure outbound-only internet access** 👍.

</br>

### _Granular Access Control for the EKS Cluster_

We've pruned down the **public access CIDR**. They're crucial for defining which IP Addresses are allowed to access the Kubernetes API Server. Having centralized control over access and management. = **Security** and **resilience** 👍

</br>

> By doing so, we're adopting a **principle of least privilege**, ensuring that only necessary access is granted and reducing the surface area for potential cyber threats. We've ensured flexibility and automation, as the list of EC2 Instance Connect IPs can change, and fetching them dynamically ensures our access controls are always up-to-date without manual intervention.

</br>

I'd advise to **tighten up security** to the **Corporate IP Address Range** as an ingress rule for the node group, that's something we might need for troubleshooting or administrative access - (We might need to SSH into the VMs to check if everything's alright)

I've made sure the **IAM Policies** attached to the cluster and the node group are tied down - in lines with **PLP**. So, even in case of a compromise, chances of privilege escalation will be low.

Plus, we have **endpoint access restrictions**, and **secured SSH Access** - limited SSH access to worker nodes by specifying source security group IDs and SSH keys.

### _Terraform State Backend - S3 + DynamoDB - Concurrency + State Locking_

> Eliminating potential chances of State Corruption that might happen during multiple Terraform applies. Terraform locks the state, preventing multiple concurrent Terraform runs from multiple users, + DynamoDB is a secure and durable storage for State Locking as well.

</br>

**Enabling S3 Versioning** on your backend S3 bucket to keep a history of your state files,▶️ for recovery from unintended changes.

**Using S3 Bucket Encryption** for added security. While your state files are encrypted due to the encrypt attribute, ensuring the bucket itself is also encrypted. ▶ **Additional Security Layer**

### _Cost Optimization through a Mix of On-Demand Instances and Spot Instances_

</br>

> We wanted to achieve a certain level of cost optimization as well while still retaining our fault tolerance capabilities. Hence, I've decided to go in for:-
Two separate node groups: one for critical workloads (on-demand), and Spot for cost optimization.          
**Multiple Instance groups** specified to increase chances of Spot Instances fulfillment.

</br>

This means we have an **On-Demand capacity** to handle **Baseline Application Performance** + a **Spot Allocation strategy** as a **Cost Optimization strategy**. 👍 ☑️

### _Scaling via Cluster Auto-Scaler and Horizontal Pod Scaler_

</br>

> We wanted something that could adapt both at the pod and the node level. Something that can help us scale effectively in Kubernetes and manage workload fluctuations as well.

</br>

Hence, we've used both **Cluster Auto-scaler** and **Horizontal Pod Autoscaler**, And how're they different? **Cluster auto-scaler** scales the

 nodes up and down in the event of a lack of sufficient resources to schedule pods or due to node utilization.              
**Horizontal Pod Autoscaler** is about adjusting the number of pod replicas in a deployment, based on current demand, (We're considering **CPU Utilization** as our target metric here). This helps maintain an optimal application performance level as the workload changes.

<img width="949" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/77c0230f-4b32-4b7f-8c20-e44f7035f58d">

## _Why ArgoCD?_

Why Argo? It's a brilliant declarative , GitOps CD Tool.             
We've used Argo for its capability to automate deployments across various environments. It ensures that my actual state of the kubernetes matches the configuration manifests in the Git repo, (That's the desired state of the cluster)

= Automated, Repeatable and most importantly Reliable Deployments 🙂 👍

So, that's something I like. ArgoCD automatically checks for differences between your current state of k8s cluster and what's in the manifest files, means that my changes are automatically deployed and reflected in the live environment, as soon as they're pushed.

The Best Part:- Every change's versiones, just in case changes don't go as planned, you can always rollback to a previous stae, --> Reliable!

Here's the link to my K8s manifest files:- https://github.com/TanishkaMarrott/Reddit-Clone-K8s-Manifests




<img width="515" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/78b7dab5-93ac-42a3-8677-ee20420b0e46">




