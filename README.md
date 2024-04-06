# Orchestrating a DevSecOps Pipeline for Cloud-Native Reddit Clone


## _Quick Introduction_:-

Our project today is all about the specifics involved while configuring a  **_DevSecOps Pipeline._**   
--> we're not only speeding up releases, but also being security-compliant, from the get-go.    

****Technicalities in the sections that follow.****

--> _What are we trying to achieve?_    
&nbsp; &nbsp; &nbsp; **Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value** 

&nbsp;

## _So, how does the workflow actually look like?_


**_Infrastructure Provisioning_** (Terraform)            
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;     ⬇️             
**_Container Orchestration_** (Elastic Kubernetes Service)       
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;    ⬇️       
**_CI/CD_**  (Jenkins & ArgoCD)      
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;    ⬇️      
**_Security Integrations_** (SonarQube, OWASP & Trivy)      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  ⬇️        
**_Logging, Monitoring & Data Visualization_** (Prometheus, Grafana & EFK Stack)      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 
      =   
      
**_Real-time Insights_** into application health & performance  


</br>

>  _**Okay, so how does DevSecOps augment Business Processes?**_

</br>

## _How does DevSecOps align with my Business Goals?_


_Simple Answer:-_   
**Solid Foundation to quickly realign with changing business requirements**

</br>

_It's more like a ***Strategic Enabler,***_ to boost efficiency & streamline processes.    

▶️ _Quicker product iterations & feedback loops_
 means we're **_market-agile._**     👍👍

</br>

▶️ _Quality Assurance_ + _Reducing post-deployment fixes' costs_   

= **_Averting Data Security incidents / breaches due to security lapses._**

</br>

>  ### **<ins>Agile DevSecOps = Swiftly adapting to evolving Business Requirements.** 


</br>


## _&rarr; Infra-Setup & Tool Configuration_

         
--> Establishing the base for our CI/CD pipeline and security assessments. Next, I've **_configured Jenkins Plugin Installations_**, for integrating Jenkins with other CI/CD tools in our pipeline. 

Please check `updated_main.tf` & `install.sh`

</br>


> I've already installed the foundational plugins --> In short, it's for a **fully functional Jenkins environment**, covering all the necessary aspects from Source Code Management to Pipeline Orchestration

</br>

### **_Plugins I've used:-_**   



| Category               | Plugin/Tool                 | Purpose                                                                                   |
|-------------------------|-----------------------------|-------------------------------------------------------------------------------------------|
| Code Quality & Analysis | **SonarQube Scanner**       | Integrates SQ into Jenkins --> SAST|
|                         | **Sonar Quality Gates**     | Breaks the build based on SonarQube quality gates --> code quality  |
|                         | **OWASP Dependency Check**  | --> Vulnerabilities within the project's dependencies.                                |
| IaC Scanning | **TfSec**  | Scans the IaC for security misconfigurations. |
| Secrets Detection  | **truffleHog**              | Scans the repository for accidentally committed secrets |

--
   

>  Quality gates in SQ ensures that code must meet specific quality standards before it can proceed through the pipeline. Additionally, the webhook feature provides immediate feedback within our CI/CD process --> Quick identification & resolution of issues. 

--

## _Why global tool configurations?_


They're _automatically installed & available to all jobs, it's defined at a global scope_                   
 <ins>**--> In a way, it standardises the environment across all builds, and projects. 👍**</ins>        

</br>

 >  _Once setup, they **eliminate the need of manually configuring specific versions** of these runtimes/environments for each of them separately._

</br>
 

| Category                | Tools                   | Purpose                                                                                   |
|-------------------------|------------------------|-------------------------------------------------------------------------------------------|
| Runtime & Environment   | **Eclipse Temurin Installer** | Automates the installation => Means a specific version of the JDK is available for all jobs. |
|                         | **Nodejs**                 | Ensures the necessary runtime version is available for JavaScript-based applications. |

---

## _Pipeline Configuration_

In Phase 2 of our project, I've focused on pipeline configuration to automate our build and deployment processes.             
The pipeline, scripted in a Jenkinsfile, (Please check `Jenkinsfile` above) utilises both JDK 17 and Node.js 16 tools for a build environment suitable for our Reddit Clone App. 

</br>

<img width="946" alt="Reddit-Clone-App-Jenkins-Pipeline" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/430d0863-09e9-4064-bfc6-4ec2d101d5b0">


</br>

### _CI/CD Pipeline - Key Stages_


1 → Workspace Preparation          
2 →  Fetch the latest code from the repo's main branch         
3 → Static Code Analysis for potential bugs & vulnerabilities.         
4 → Quality Gate → Crucial checkpoint to align with our quality criteria, Decides if changes can be promoted.         
5 → Installing Dependencies         
6 → Scanning both our File system and Docker images.         
7 → Containerization          
8 → Detecting unwanted secrets (checking if they've been exposed)      
9 → IaC Analysis - Securing Tf Configurations
</br>

You can find the application code here :- https://github.com/TanishkaMarrott/Reddit-Clone-App

_**Dependency-Check Results**_ – This screenshot from Jenkins displays the results of the Dependency Check, showcasing the distribution and severity of discovered vulnerabilities in the Reddit Clone App.

</br>


![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/0e9a27ca-158a-4fa4-bfd7-4f82c5f6d30e)


</br>

_**Console Output**_ - This image captures the console output in Jenkins, --> Verbose Logs for execution of the pipeline stages for the Reddit Clone App.

</br>

![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/cc0a6fbd-245c-49c4-9144-b0a6c41e7c80)

</br>

_**SonarQube Dashboard**_ - This screenshot shows a successful Quality Gate with overview of code analysis for the Reddit project

</br>

<img width="958" alt="Reddit-Clone-App-SonarQubeServer" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/698eaff4-1db7-4938-b711-2a3141543b88">



_**Docker Hub Repository: 'tanishkamarrott/reddit'**_ – The third screenshot shows the Docker Hub repository page for the 'reddit' image, ready for Image pushes

</br>

![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/395f374d-9dbd-4436-9f73-c18848d40ccf)

</br>

Now that we're done with the continuous integration part, we'd move to the deployment part.  Continuous deployment is geared towards automating the deployment of code from dev to prod, post a successful build, that's post passing the necessary code quality and security tests. 

</br>

--> Means a faster deployment velocity, accelerated software releases = Faster time-to-market 

</br>

### _Is Testing a part of both CI and CD?_

         
True.....But the kind and the emphasis of testing differs.....

What does this mean...? Testing in CI is primarily about running tests against the code to ensure the codebase is stable and functional throughout. Integrating multiple code changes into the main-stream, won't break production. It mostly revolves around **Unit testing** & **Integration testing**.   

</br>

> The goal here is frequent, incremental updates - (**Immediate feedback** = **Quicker Iterative loops**)

</br>

When I talk about CD, it's not only about a "bug-free" code. You need some other types of testing too, **Security testing**, **Performance Testing**, **UAT testing**. Making my software production-ready, considering all non-functional aspects as well. 

</br>

> *Is my software production ready? Can this be delivered to my users? Does it meet the overall high quality standards?* CD answers such questions.

</br>

Let's start with the Terrform Configurations...

</br>

Please check my code here:- https://github.com/TanishkaMarrott/AWS-EKS-TF/tree/main'

</br>

---

## _Tf Configurations - Non functional Aspects:-_

### _Multi-AZ NAT Gateway Setup + Multi-AZ Worker node deployment configuration:-_ 

In this architecture, I've deployed **three NATs each with its own Elastic IP**, to ensure **high availability** and **fault tolerance**.

</br>

> We can thus ensure that our architecture can withstand an AZ Failure. If one NAT gateway becomes unavailable due to some issue in an AZ, we can still route outbound traffic to the internet, ensuring continuous access to our resources. Also, failure/outage of an AZ does not impact the availability of our application, hence **fault-tolerant**.   

</br> 

▶ **High Availability** + **Fault Tolerance** = 👍

</br>

There's one more advantage to it, **Performance Optimization**.  

</br>   

>  By optimizing network paths, traffic from the instances do not necessarily need to cross inter-AZ for reaching the internet, = reducing **Latency** 👍. It does help in the scalability aspect as well since resources in each AZ can scale out independently. We can add new subnets and add new instances in each AZ, without worrying NAT Gateway being a potential bottleneck.

</br>

➡ However, this is a **cost vs. fault tolerance trade-off**. The decision to implement this architecture is based on prioritizing the application's availability and performance over the cost considerations.

</br>

### _Are we utilising both public and private subnets. Why?_

</br>

> My public subnets host the Load Balancers and NAT Gateways (the resources which are intended to be public), so, they'll distribute incoming internet traffic to the pods running the application. This setup simplifies and centralizes traffic management while keeping our backend pods secure. Also, in case the applications in the private subnet wish to connect to the internet, for example for updates, APIs etc., it can be done via the NAT deployed in each public subnet = **secure outbound-only internet access** 👍.

</br>

### _Granular Access controls for EKS_

I've pruned down the **public access CIDR**. They're crucial for defining which IP Addresses are allowed to access the Kubernetes API Server. Having centralized control over access and management. = **Security** and **resilience** 👍

</br>

> By doing so, we're adopting a **principle of least privilege**, ensuring that only necessary access is granted and reducing the surface area for potential cyber threats. I've ensured flexibility and automation, as the list of EC2 Instance Connect IPs can change, and fetching them dynamically ensures our access controls are always up-to-date without manual intervention.

</br>

I'd advise to **tighten up security** to the **Corporate IP Address Range** as an ingress rule for the node group, that's something we might need for troubleshooting or administrative access - (We might need to SSH into the VMs to check if everything's alright)

I've made sure the **IAM Policies** attached to the cluster and the node group are tied down - in lines with **Principle of Least Privilege**. So, even in case of a compromise, chances of privilege escalation will be low.

Plus, we have **endpoint access restrictions**, and **secured SSH Access** - limited SSH access to worker nodes by specifying source security group IDs and SSH keys.

</br>

### _Terraform State Backend - S3 + DynamoDB -> Concurrency + State Locking_

</br>

> Eliminating potential chances of State Corruption that might happen during multiple Terraform applies. Terraform locks the state, preventing multiple concurrent Terraform runs from multiple users, + DynamoDB is a secure and durable storage for State Locking as well.

</br>

Enabling **S3 Versioning** on your backend S3 bucket to keep a history of your state files,▶️ for recovery from unintended changes.

Using **S3 Bucket Encryption** for added security. While your state files are encrypted due to the encrypt attribute, ensuring the bucket itself is also encrypted. ▶ **Additional Security Layer** 👍👍

</br>

### _How did I optimise on costs while still maintaining a level of fault-tolerance?_

Mix of both On-demand and Spot Instances 👍🏁
</br>

> We wanted to achieve a certain level of cost optimization as well while still retaining our fault tolerance capabilities. Hence, I've decided to go in for:-
Two separate node groups: one for critical workloads (on-demand), and Spot for cost optimization.          
**Multiple Instance groups** specified to increase chances of Spot Instances fulfillment.

</br>

This means we have an **On-Demand capacity** to handle **Baseline Application Performance** + a **Spot Allocation strategy** as a **Cost Optimization strategy**. 👍 ☑️

</br>

---

## _Why ArgoCD?_

It's actually a brilliant declarative, GitOps CD Tool. 

I've used Argo for its capability to **automate deployments** across various environments. _**It ensures that my actual state of the Kubernetes matches the configuration manifests in the Git repo**_, (That's the **desired state** of the cluster).

>   _Automated, Repeatable and most importantly Reliable Deployments_ 👍

</br>

So, that's something I like.... ArgoCD automatically checks for differences between your current state of K8s cluster and what's in the manifest files, means that my changes are **automatically deployed** and reflected in the live environment, as soon as they're pushed.

</br>

>  **Every change's versioned**, just in case changes don't go as planned, you can always **rollback to a previous state**

</br>

Here's the link to my K8s manifest files:- https://github.com/TanishkaMarrott/Reddit-Clone-K8s-Manifests

</br>

---

</br>

## _Quick Dive into the k8 manifests + Key Design Considerations_


1- **`deployment.yaml`** 

My Deployment for the Reddit-Clone application. Contains a blueprint for the pods it'll create 

</br>

_How did I improvise the deployment to be available and fault tolerant?_

☑ I've increased the number of Pod Replicas, K8s would then ensure that we'll have 2 instances of our application running at any given time. -> Availability, Load Distribution                  

☑ I've also specified the CPU and Memory Requests and Limits for the container. Requests would be guranteed by the kuberenetes scheduler, while limits would ensure that none of our pods is inadvertently consuming excessive resources ▶️ Efficient resource Utilisation and High Availability 🏁 👍

</br>

> I'd been observing that there was an uneven scheduling of pods across the nodes. Hence, I had to utilise the `topologySpreadConstraint` parameter, to ensure we're utilising our resources evenly. And a `maxSkew` parameter, this means resilient scheduling of pods across Nodes.


</br>

---

</br>

2- **`service.yaml`** 

We're exposing the set of pods running the containerised application through the Service of type loadBalancer. It listens for traffic on port 80 and forwards it to port 3000 - the port the application listens on within the container.

</br>

_The non-functional aspects I've included:-_

☑ I've made use of K8s annotations for Cross-Zone Load Balancing = High Availability - Distributes Traffic evenly across pods in multiple Availability Zones 
Network Load Balancer naturally does ensure scalability - ➡️ NLB means Super-low Latency + Super High Performance 👍

☑ Also, client source ips are preserved to ensure a better security, --> this will later help us in implementing WAF NACls that could be associated with the API Gateway fronting the LB --> Enhanced Security ☑️ 

</br>

---

</br>

3- **`ingress.yaml`**

I'm using this alongside the service object. In general, an Ingress would be used for its path-routing capabilities, -- you could actually host multiple applications on just a single IP, and route traffic to different backend service based on the path.

</br>

> At times, when you're having multiple services, I'd not advise creating multiple services of type `LoadBalancer` , That wouldn't be a wise decision, Use an Ingress Controller to distribute / route the traffic based on the path in the URL. You'll simplify your network setup, while saving on extra infra costs.

</br>

In my case, I'd be utilising an ingress controller for its advanced traffic management + SSL termination capabilities. A standard way for exposing Services with a single external access point Provides scope, to maybe use some ACLs for IP Whitelisting, Geo-restrictions in conjunction with an AWS API Gateway/ WAF for an eve better security posture. 👍

☑️ I've limited the connections and requests per second, helps prevent resource exhaustion and overwhelming of backend services 🏁 ✔

</br>

---

</br>

4 - **`cluster-autoscaler.yaml`** & 5. **`hpa-manifest.yaml`** 

_Scaling via Cluster Auto-Scaler and Horizontal Pod Scaler_

</br>

> We wanted something that could adapt both at the pod and the node level. Something that can help us scale effectively in Kubernetes and manage workload fluctuations as well. Hence we added cluster-autoscaler.yaml and hpa-manifest.yaml

</br>

Hence, I've used both **Cluster Auto-scaler** and **Horizontal Pod Autoscaler**, And how're they different? **Cluster auto-scaler** scales the nodes up and down in the event of a lack of sufficient resources to schedule pods or due to node utilization.              
**Horizontal Pod Autoscaler** is about adjusting the number of pod replicas in a deployment, based on current demand, (We're considering **CPU Utilization** as our target metric here). This helps maintain an optimal application performance level as the workload changes.


</br>

---

</br>

6. **`rbac-config.yaml`**

I've also included a template for `rbac-config.yaml`. Why? That's Kubernetes native way of Role Based Access Control. Finetuning Access Control to Kubernetes resources, either through User Accounts or Service Accounts

> Usually, pods make use of a Default Service Account, for performing all Kuberenetes API Operation. But, that's way too broad. If we're looking for a much more auditable, and secure K8s environment wherein permissions are scoped, we must create a specific SA, bind necessary permissions to the role -- (the one's I need for the application's proper functioning). This Role would then be attached to the SA... 

There's one more advantage to it. I'm not only adhering to the principle of Least privilege, We can also _scope_ permissions to a specific namespace, if we're looking for granular access control. User Accounts too can be granted specific permissions for the resources they need to access (pods etc.)

> Even in case of a compromise, chances of Privilege Escalation are minimized greatly

In our case, I've created a specific SA -> `app-service-account` and attached the `app-role` to it, comprising the `get` , `watch` , and `list` permissions inherited the pods running the application.

---

</br>

7. **K8s Network Policies** - A side note

I haven't created a manifest specifically for network-policies, my current use-case doesn't require a policy restricting communication between pods running multiple applications.

> Basically, we make use of Network Policies in K8s for controlling the ingress, and egress at a pod level. You can have a `deny-all` policy`, restricting any ingress to all the pods (as specified by the selector) within a namespace. Or maybe have a specific Network Policy allowing inbound traffic from pods of a certain application within the same namespace. = Controlling Ingress/Egress , but at the pod level!

</br>


ArgoCD has been exposed via the LoadBalancer Endpoint. Here are a couple of snapshots:-

</br>

<img width="949" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/77c0230f-4b32-4b7f-8c20-e44f7035f58d">

</br>

--

<img width="949" alt="image" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/78b7dab5-93ac-42a3-8677-ee20420b0e46">


</br>

_ArgoCD Pods:-_

</br>

<img width="923" alt="Reddit-App-Clone-ArgoCD-pods-running" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/b108c6f0-3bce-499d-a556-ca6fc3dd8d67">

</br>

--

<img width="929" alt="reddit-clone-argocd-pods" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/70767d77-bc23-4181-bda5-11819b265d11">

</br>

--

_My Application's frontend:-_

--

</br>

<img width="952" alt="Reddit-App-Clone-App-FrontEnd" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/bc4d8f79-1ce2-48c2-ae37-b878796d528a">


## Helm, Prometheus & Grafana - Monitoring + Visualisation

Helm - It's a package manager for kubernetes, It actually streamlines the process of deploying applications on K8s clusters

> I'd give a quick acronym here, Heard about Docker? What does it actually do? It packages the application code, libraries, necessary dependencies, and runtime environments into a single package (that's called an artifact). In the same way, Helm would package all K8s resources, like deployments, services. This means it more like a directory structure, packaging all K8s manifests, templates and config values.

**Key pointers about Helm:-**

Helm lets you manage complex K8s applications, It lets you template charts as well, That mean's it'll enable us to inject values and configurations at runtime. == Reproducibility and Reusability of K8 manifests

> Helm shares some similarity from a conceptual standpoint with GitOps Practices. Each time I install a new chart, it creates a new "release". So, this is a versioned snapshot, Helm keeps track of changes to your deployments. Just in case, the release isn't as well as it had been planned, you can rollback to a previous stable version. GitOps could extend this to a more broader sense, with both infrastructure provisioning / configuration plus the application deployment aspect...

We've added the Helm Repo `Prometheus-kube-stack.` This repo is a collection of all the k8s resources pertaining to Prometheus and Grafana. It lets you setup these tools in your cluster in a way that's fully integrated and easy to manage.  

## Prometheus and Grafana

--> Our monitoring and observability tool suite.

> Prometheus, it's actually a time- series database. It's like a multi-dimensional model, with metric and some key-value pairs. It collects data from a wide array of sources, be it, infra-components, applications or  services. That's through Exporters. Exporters expose metrics in a way that can be easily consumed by Prom. You can then make use of PromQl, to query the data, or have an Alerting manager setup / integrated with it, to trigger off notifications for anomalies.

A quick flow diagram to help you ingest this idea better:-

            Application/Service/
           Infrastructure Component
                   |
                   v
                 Exporter
            (Exposes Metrics)
                   |
                   v
               Prometheus
           (Time-Series Database)
                   |
                   v
         Querying with  PromQL /
      Alerting with Alert Manager


The prometheus stack, we installed using Helm, comes with the Grafana Deployment embedded.


So, what's Grafana?

Grafana is more of a Data Visualisation tool, you can actually fetch data from any of your Data sources, Prometheus in our case, and create dashboards, create graphs, heatmaps. You can have interactive dashboard with dynamic filtering cpabailities

> I've seen folks utilising it's ingrained alerting mechanism, it gels well with notification and reporting tools like email, slack, etc.



#### _Prometheus + Grafana = A powerful combo for monitoring and observability into application health & performance_


We've exposed these via a LoadBalancer Endpoint, not NodePort or ClusterIP

> Why? To make Prometheus and Grafana accessible from outside the Kubernetes cluster, you should opt for NodePort or LoadBalancer services. NodePort can be suitable for smaller setups or environments where specific port access is manageable. Also, I wouldn't recommend it from a Security perspective. However, LoadBalancer offers a more scalable and user-friendly way to expose services, --> It distributes traffic and ensures service reliability and availability. ClusterIP is more suited for internal communications within the cluster and does not facilitate external access directly.

Couple of snaps wrt Prometheus and Grafana:-

</br>

<img width="940" alt="Reddit-App-Clone-App-Pods-prometheus-running" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/b06486ad-8e2a-43c3-a88f-a5f8337a4be3">

<img width="960" alt="Reddit-App-Clone-prometheus-console" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/d2c4d253-da78-422c-a576-f785095def5e">

<img width="960" alt="Reddit-App-Clone-App-Prometheus-Node-Disk-Info" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/1d185daf-14b0-47cd-8906-985da83a0d76">

</br>

Attached - Grafana snaps:-

<img width="959" alt="reddit-clone-grafana-dash" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/6dc81ab4-770e-49b3-8418-56cc883ac6d8">

<img width="956" alt="Reddit-clone-app-grafana-pod-monitoring-dash" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/840314e9-233f-4e84-a3a3-efbde7a28ecc">

<img width="959" alt="reddit-clone-grafana-network-io" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/b8d82504-ea19-4a8e-b90f-2877c73fd26c">

<img width="960" alt="reddit-clone-grafana-completemonitoring-dashboard" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/98b3cf79-001a-4ae0-883e-a713acc54c9e">

</br>

We've imported three dashboards here:-
&rarr; Pod Monitoring dashboard
&rarr; Cluster Node Monitoring dashboard
&rarr; Complete Monitoring dashboard

### What do these dashboards represent?

1-> _**The Pod monitoring dashboard**_ provides us with metrics + data specifically for individual  pods, Meaning Pod Status, the CPU Memory Usage , the ntwrok usage, the volume of logs produced, the number of restarts etc, _So these are indicative of underlying issues with the pods_

2-> _**The Cluster Monitoring dashboard**_ indicate the overall health of a cluster with all its components, whether they're nodes, deployments, services etc. It more like a comprehensive dahsboard, covering the workload distribution, the number of deployments, nodes etc, Resource Utilisation, the health and status of nodes + alerting and monitoring notifications etc

3-> _**The Node Monitoring dashboard**_ is around pod allocation to the nodes, checks for Memory pressure, out of Disk or any such conditions for the nodes, the node utilisation metrics (over-utilised and underutilised), the health and status of the nodes, etc

---

## _The Logging Suite -EFK Stack_

- Since we're done with the monitoring and alerting aspect, let's turn to collecting, aggregating and analysing &  visualising our logs

You can check out my EFK manifests here:- https://github.com/TanishkaMarrott/EFK-Stack

</br>

### _Quick dive into what's EFK, and into its workflow_

EFK is a popular option for Log Collection, Aggregation and Visualisation.

#### ElasticSearch

> ElasticSearch is a very typical option when we're talking about a search and analytics engine , Not only does it store data collected from various data sources, it also has indexing, querying and seraching capabilities, over a huge volume of loga data. Filtering and aggregating the logs as well

#### FluentD

It's our _**Data Collector and Shipper,**_
open source data collector + aggregator, for unified logging layers, it fetches, collects data from various sources, and them transforms into a unified format, forwards to elasticsearch.

#### Kibana

Role:- Data Visualisation and UI

**_Expore + Analyse + Visualise Log Data = Making sense of the collected log data in real-time_**

</br>

### _The EFK Workflow_

   ****
 **_Data Sources_** - (They could be log files, shippers, etc)                           
 &nbsp;     |                           
 &nbsp;     v                           
 **_Fluentd_** (Data Aggregation and Transformation - Enriching it with metadata, transforming the data into a format suitable for ElasticSerach)               
  &nbsp;     |                           
 &nbsp;     v                           
 **_Elasticsearch_** (Storage/Index - Storing, indicing the data, --> Search and alaytics engine)                     
   &nbsp;     |                           
 &nbsp;     v                           
 **_Kibana_** (Visualization - gaining insights into patterns & trends)                  

****

 Now let's discuss about our EFK Manifests, Apply the K8s manifests to create the EFK Deployment

> I'd like to clarify on a few points here. Why did we create an EFK Stack, when we had Prometheus and Grafana alreday 











   











