# Orchestrating a DevSecOps Pipeline using Jenkins & ArgoCD +  </br>  Logging & monitoring solutions incorporated

</br>

## Quick Introduction:-

Our project today is all about the specifics involved while setting up an automated  **_DevSecOps Pipeline._**   
--> we're not only speeding up releases, but also being security-compliant, from the get-go. 💡

</br>

👉 _What are we trying to achieve?_  

&nbsp; **Optimized QA + Speedy Delivery + Security Ingrained = REAL Business Value** 

&nbsp;

## So, how does the workflow actually look like?

</br>

**_Infrastructure Provisioning_** (Terraform)            
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;     ⬇        
**_Container Orchestration_** (Elastic Kubernetes Service)       
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;    ⬇️       
**_CI/CD_**  (Jenkins & ArgoCD)      
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;    ⬇️      
**_Security Integrations_** (SonarQube, OWASP & Trivy)      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  ⬇️        
**_Logging, Monitoring & Data Visualization_** (Prometheus, Grafana & EFK Stack)      
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;      =   
**_Real-time Insights_** into application health & performance  


</br>

>  **Okay, so how does DevSecOps augment Business Processes?**

</br>

## How does DevSecOps align with my Business Goals?

</br>

_Simple Answer:-_   
**Solid Foundation to quickly realign with changing business requirements**

</br>

> _It's more like a ***Strategic Enabler,*** to boost efficiency & streamline processes._    

</br>

➡️ Quicker product iterations & feedback loops             
--> means we're **_market-agile._** 👍👍

➡️ Quality Assurance + reducing post-deployment fixes' costs
= Averting Data Security Incidents

</br>

>   **Agile DevSecOps = Swiftly adapting to evolving Business Requirements.**

</br>


##  &rarr; Jenkins Setup & Tool Configuration_

### **What sort of plugins & global tool configurations have we used?**   

</br>

|     **The plugins we've used &rarr;**    |                 |                                                                                   |
|-------------------------|-----------------------------|-------------------------------------------------------------------------------------------|
| The ones for code quality & analysis | SonarQube Scanner       | SQ + Jenkins --> SAST|
|                         | Sonar Quality Gates     | It breaks the build based on the quality thresholds |
|                         | OWASP Dependency Check  | --> Vulnerabilities in project dependencies.                                |
| IaC Scanning | TfSec  | Scans the IaC from a security standpoint |
| Secrets Detection  | truffleHog              |  Helps detect accidentally committed secrets |

</br>


 Please check out these files:- `updated_main.tf` & `install.sh`

</br>

 

|   Global tools  to standardise environments all across &rarr;      | |                                                                                   |
|-------------------------|------------------------|-------------------------------------------------------------------------------------------|
| Runtime & Environment   | Eclipse Temurin Installer | ➡️ Means a specific JDK version is available for all jobs. |
|                         | Nodejs                 | Once setup, the necessary runtime is available for JS applications. 👍 |

</br>

## &rarr; _Pipeline Configuration_
     
</br>

<img width="946" alt="Reddit-Clone-App-Jenkins-Pipeline" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/430d0863-09e9-4064-bfc6-4ec2d101d5b0">


</br>

--

### _CI/CD Pipeline - Key Stages_


Cumulating the steps ⤵️

Workspace Preparation → **Fetch** the Latest Code → **Static Code Analysis** →
**Quality Gate** Checkpoint → Installing **Dependencies** → **Scanning File System & Docker Images** →
**Containerization** → **Detecting Unwanted Secrets** → **IaC Analysis** for Security


</br>

--

_Snapshots:-_

_**Dependency-Check Results**_ –->  Distribution & severity of vulnerabilities in the Reddit Clone App.
![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/0e9a27ca-158a-4fa4-bfd7-4f82c5f6d30e)

--

</br>

_**Console Output**_ -  --> Logs for execution of the pipeline stages
![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/cc0a6fbd-245c-49c4-9144-b0a6c41e7c80)

--

</br>

_**SonarQube Dashboard**_ --> Successful Quality Gate with an overview of code analysis
<img width="958" alt="Reddit-Clone-App-SonarQubeServer" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/698eaff4-1db7-4938-b711-2a3141543b88">

--

</br>

_**Docker Hub Repo: 'tanishkamarrott/reddit'**_ – 'reddit' image &rarr; ready for pushes
![image](https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/395f374d-9dbd-4436-9f73-c18848d40ccf)

</br>

## The Continuous Deployment Part

_**Intent:-**_ Automating the deployment of code from dev to prod, post a successful build ▶️                
> **Continuous Deployment** ➡️ Means a faster deployment velocity = Accelerated releases = Faster Time-to-market 👍

</br>

### _On a side note :- Is testing a part of both CI and CD?_

         
True.                
But the kind and the emphasis of testing differs...

</br>

What does this mean?                   
➡️ Testing in CI is primarily about running tests against the code to ensure the codebase is stable and functional throughout.

<ins>**Crucial:-**</ins>        
Integrating multiple code changes into the main-stream, shouldn't break production. --> **_Unit testing_** & **_Integration testing_**.

</br>

>  🎯 My goal here is frequent, incremental updates - (Immediate feedback** = Quicker Iterative loops) 

</br>

--

When I talk about CD, it's not only about a "bug-free" code...   

We need some other types of testing too, **Security testing**, **Performance Testing**, **UAT testing**. Making my software production-ready, considering the non-functional aspects as well. 

</br>

> #### 👉 *Is my software production ready? Can this be delivered to my users? Does it meet the overall quality standards?* CD answers such questions.

</br>


## Non-functional aspects of the the application infrastructure:-


Check out my TF code here:- https://github.com/TanishkaMarrott/AWS-EKS-TF/tree/main'   <-- IMP
You can find the Reddit Clone Application code here :- https://github.com/TanishkaMarrott/Reddit-Clone-App

### _Multi-AZ NAT Gateway Setup + Multi-AZ Worker node deployments:-_ 

In this architecture, I've deployed **three NATs each with its own Elastic IP**, for **high availability** and **fault tolerance**.

</br>

>  If one NAT gateway becomes unavailable, we can still route outbound traffic to the internet. We're fault-tolerant to AZ Failure. There's no impact on our operational efficiency.

</br> 

▶ **High Availability** = **Fault Tolerance** = 👍

</br>

 Second, **Performance Optimization**.  

</br>   

>  I didn't want any SPOFs or performance bottlenecks in my architecture. **Multi -NAT ensures that traffic from the instances do not necessarily need to cross inter-AZ for reaching the internet, = reducing Latency** 👍.
>  It does help me in the scalability aspect as well since resources in each AZ can scale out independently. We can add new subnets, add new instances in each AZ, without worrying NAT Gateway being a potential bottleneck. 💡

</br>

➡ However, this is a **cost vs. fault tolerance trade-off**. 

➡️ My decision here was prioritizing availability and performance over the cost considerations.

</br>

#### _Are we utilising both public and private subnets. Why?_

</br>

> My public subnets host the Load Balancers and NAT Gateways (the resources which are actually intended to be public), so, they'll distribute incoming internet traffic to the pods running the application. ➡️ This setup will **help us simplify and centralize traffic management** while keeping our backend pods secure. Also, **in case the applications in the private subnet wish to connect to the internet, for example :- for updates, APIs etc., it will be done via the NAT deployed in each public subnet**

**Secure outbound-only internet access** 👍.

</br>

### _Granular Access controls for EKS_

**I've pruned down the public access CIDR** allowed to access the Kubernetes API Server. Having centralized control over access and management.

</br>

> **I'd advise to tighten up security to the Corporate IP Address Range** as an ingress rule for the node group, that's something we might need for troubleshooting or administrative access

Plus

**We've  got endpoint access restrictions, and secured SSH Access** - to the worker nodes by specifying source security group IDs and SSH keys; made sure the **IAM Policies** attached to the cluster and the node group are tied down. Chances of privilege escalation will be low.


</br>

### _Terraform State Backend - S3 + DynamoDB --> State Locking_

</br>

> **I wanted to eliminate potential chances of State Corruption that might happen during multiple Terraform applies**. + DynamoDB will be used as a durable data-store for State Locking.

</br>

> Topping it up with **S3 Versioning** on our backend S3 bucket to keep a history of our state files,▶️ for recovery from unintended changes. + **S3 Encryption** 👍

</br>

### _How did I optimise on costs while still maintaining a level of fault-tolerance?_

Mix of both On-demand and Spot Instances 👍

</br>

**We've decided to go in for:-**          

**1- Two separate node groups:-                                 
One for critical workloads (on-demand) and second, Spot for cost optimization.***
     
**2 - Multiple Instance groups have been specified ➡ Increasing chances of Spot Instances fulfillment.**

</br>

> ↪️ This means we have an On-Demand capacity to handle Baseline Application Performance + a Spot Allocation strategy as a Cost Optimization strategy. 👍 ☑️

</br>

---

## _Why ArgoCD?_

👉 A Brilliant "declarative, GitOps CD Tool." 

</br>

So, that's something I like.... So, what Argo does is , it **automatically reconciles differences** between the cluster's current state and what's in the manifest files, means that my changes are automatically **deployed and reflected in the live environment, as soon as they're pushed.**
</br>

>  **Every change's versioned**, just in case changes don't go as planned, you can always **rollback to a previous state**

</br>

Here's the link to my K8s manifest files:- https://github.com/TanishkaMarrott/Reddit-Clone-K8s-Manifests

</br>

---

</br>

## _Quick Dive into the k8 manifests + Key Design Considerations_


### 1- **`Deployment.yaml`** 

Blueprint for the Reddit-Clone pods we'll be creating

</br>

_**How did I improvise the deployment to be available and fault tolerant?**_

☑ I've **increased the number of Pod Replicas**, K8s would then ensure that we'll have 2 instances of our application running at any given time. -> Availability, Load Distribution                  

☑ I've also **specified the CPU and Memory Requests and Limits for the container**. Requests would be guranteed by the kuberenetes scheduler, while limits would ensure that none of our pods is inadvertently consuming excessive resources

</br>

▶️ **_Efficient resource Utilisation + High Availability_** 🏁 👍

</br>

> **IMP:-** I'd been observing that there was an uneven scheduling of pods across the nodes. Hence, I had to utilise the `topologySpreadConstraint` parameter, to ensure we're utilising our resources evenly. And a `maxSkew` parameter, this means resilient scheduling of pods across Nodes.


</br>

---

</br>

### 2- **`Service.yaml`** 

We're exposing the set of pods running the containerised application through the Service of type loadBalancer.             
**It listens for traffic on port 80 and forwards it to port 3000** - the port the application listens on within the container.

</br>

_**The non-functional aspects I've included:-**_

☑ **I've made use of K8s annotations for Cross-Zone Load Balancing = HA Configuration** - Distributes Traffic evenly across pods in multiple AZs                
Network Load Balancer naturally does ensure scalability - ➡️**NLBs = Reducing latency + Improving performance 👍**

☑ Also, **we'll be preserving client source ips are preserved** to ensure a better security, --> this will later help us in implementing WAF NACls that could be associated with the API Gateway fronting the LB --> Enhanced Security ☑️ 

</br>

---

</br>

### 3- **`Ingress.yaml`**

I'm using this alongside the service object. 

</br>

> ➡️ At times, when you're having multiple services, I'd not advise creating multiple services of type `LoadBalancer` , That wouldn't be a wise decision, **Instead, I'd advise to use an Ingress Controller to distribute / route the traffic based on the path in the URL**. **You'll simplify your network setup, while saving on extra infra costs.**

</br>

In my case, **we will be utilising an ingress controller for its advanced traffic management + SSL termination capabilities.** A standard way for exposing Services with a single external access point Provides scope, to maybe use some ACLs for IP Whitelisting, Geo-restrictions in conjunction with an AWS API Gateway/ WAF for an eve better security posture. 👍

☑️ **We've limited the connections and requests per second, helps prevent resource exhaustion and overwhelming** of backend services 🏁 ✔

</br>

---

</br>

### 4 - **`Cluster-autoscaler.yaml`** & 5. **`HPA-manifest.yaml`** 

_Scaling via Cluster Auto-Scaler and Horizontal Pod Scaler_

</br>

 💡 **We wanted something that could adapt at both at the pod and the node level... Something that can help us scale effectively in Kubernetes and manage workload fluctuations as well.** And, hence we've added `cluster-autoscaler.yaml` and `hpa-manifest.yaml`

</br>
        
Cluster auto-scaler. 👉 Scales the nodes up and down when there's a lack of sufficient resources to schedule pods or due to node utilization.              
Horizontal Pod Autoscaler 👉 Adjusting the number of pod replicas in a deployment, based on current demand,                


 **We're considering **CPU Utilization** as our target metric here**. This helps us maintain an optimal Application performance irrespective of the fluctuations


</br>

---

</br>


### 6. **`RBAC-config.yaml`**

Why? &rarr; **We need to finetune Access Control to Kubernetes resources**, either through User Accounts or Service Accounts

--

 ### **_Rationale for RBAC:-_**            

  **If we're looking for a much more auditable, and secure K8s environment wherein permissions are scoped, we must create a specific SA**, bind necessary permissions to the role 👍 -- (the one's I need for the application's proper functioning  ). This Role would then be attached to the SA... 

✔ Advantage A --> We're adhering to the **principle of Least privilege,**

✔ Advantage B --> **We can also _scope_ permissions to a specific namespace,** if we're looking for granular access control. User Accounts too can be granted specific permissions for the resources they need to access (pods etc.)

</br>

### 7. _**K8s Network Policies** - A side note_


➡️ How you could implement it?

_Option 1_ - **You can have a `deny-all` policy`, restricting any ingress to all the pods** (as specified by the selector) within a namespace. 

_Option 2_ - Or maybe have a specific Network Policy allowing inbound traffic from pods of a certain application within the same namespace. = This is what is predominantly done when you've got multiple applications --> **We're controlling Ingress/Egress , but at the pod level!**

</br>

**My current use-case doesn't require a policy restricting communication between pods running multiple applications.** And hence, I haven't created a manifest specifically for network-policies 

---

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

---

</br>

## Helm, Prometheus & Grafana - Monitoring + Visualisation combined

</br>

> 🤔 I'll give an acronym here, heard about Docker? What does it actually do? It packages the application code, libraries & necessary dependencies into a single package (that's called an artifact). In the same way, Helm would package all K8s resources, like deployments, services. This means it more like a directory structure, packaging all K8s manifests, templates and config values.

</br>

## **Is Helm ~ GitOps. How?**

--> Helm lets you manage complex K8s applications

--> It lets you template charts as well, That means it'll enable us to inject values and configurations at runtime.

▶ _**Reproducibility and Reusability of K8 manifests**_

</br>

> 💡 **Helm shares some similarity from a conceptual standpoint with GitOps Practices.** Each time I install a new chart, it creates a new "release". So, this is a versioned snapshot, Helm keeps track of changes to your deployments. Just in case, the release isn't as well as it had been planned, you can rollback to a previous stable version. GitOps could extend this to a more broader sense, with both infrastructure provisioning / configuration plus the application deployment aspect...

</br>

--

</br>

We've added the Helm Repo `Prometheus-kube-stack.` This repo is a collection of all the k8s resources pertaining to Prometheus and Grafana. It lets you setup these tools in your cluster in a way that's fully integrated and easy to manage.  

</br>

## Prometheus and Grafana

--> Our monitoring and observability tool suite.

</br>

> Prometheus, it's actually a time- series database....  **It collects data from a wide array of sources,** be it, infra-components, applications or  services..... That's through Exporters. **--> Expose metrics in a way that can be easily consumed by Prom.**

> **Next step -->** You can then make use of **PromQL, to query the data,** or have an **Alerting manager setup / integrated with it,** to trigger off notifications for anomalies.


</br>

A quick flow diagram to help you ingest this idea better:-

            
           Infrastructure Component
                   |
                   v
                 Exporter
            (Exposes Metrics)
                   |
                   v
               Prometheus
                   |
                   v
         Querying with  PromQL /
      Alerting with Alert Manager


The prometheus stack, we installed using Helm, comes with the Grafana Deployment embedded.


So, what's Grafana? ⏬

Grafana is more of a Data Visualisation tool 📊            
**You can actually fetch data from any of your Data sources, Prometheus in our case,** and create dashboards, create graphs, heatmaps. You can have _interactive dashboard with dynamic filtering capabailities_

</br>

> I've seen folks utilising it's ingrained alerting mechanism, it gels well with notification and reporting tools like email, slack, etc.


</br>

#### 🥇🏁 _Prometheus + Grafana = A powerful combo for monitoring and observability into application health & performance_ 

</br>

We've exposed these via a LoadBalancer Endpoint, not NodePort or ClusterIP

</br>

> Why? To make Prometheus and Grafana accessible from outside the Kubernetes cluster, **In my opinion, you should opt for LoadBalancer services.** NodePort can be suitable for smaller setups or environments where specific port access is manageable. Also, **I wouldn't recommend NodePort from a Security perspective.** However, LoadBalancer offers a more scalable and user-friendly way to expose services, --> It distributes traffic and ensures **service reliability and availability.** 👍


</br>

_Couple of snaps wrt Prometheus and Grafana:-_

</br>

<img width="940" alt="Reddit-App-Clone-App-Pods-prometheus-running" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/b06486ad-8e2a-43c3-a88f-a5f8337a4be3">

--

<img width="960" alt="Reddit-App-Clone-prometheus-console" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/d2c4d253-da78-422c-a576-f785095def5e">

--

<img width="960" alt="Reddit-App-Clone-App-Prometheus-Node-Disk-Info" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/1d185daf-14b0-47cd-8906-985da83a0d76">

</br>

--

_Attached - Grafana snaps:-_

</br>

<img width="959" alt="reddit-clone-grafana-dash" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/6dc81ab4-770e-49b3-8418-56cc883ac6d8">

--

</br>

<img width="956" alt="Reddit-clone-app-grafana-pod-monitoring-dash" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/840314e9-233f-4e84-a3a3-efbde7a28ecc">

--

</br>

<img width="959" alt="reddit-clone-grafana-network-io" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/b8d82504-ea19-4a8e-b90f-2877c73fd26c">

</br>

--

<img width="960" alt="reddit-clone-grafana-completemonitoring-dashboard" src="https://github.com/TanishkaMarrott/Orchestrating-DevSecOps-Pipeline-for-a-Cloud-Native-Architecture/assets/78227704/98b3cf79-001a-4ae0-883e-a713acc54c9e">

--

</br>

We've imported three dashboards here:-               
 💠 Pod Monitoring dashboard            
 💠 Cluster Node Monitoring dashboard               
 💠 Complete Monitoring dashboard               

</br>

### What kind of insights do we get from these dashboards? ⚛️               

 <ins>_Pod monitoring dashboard:-_</ins>             

**Metrics + data --> specifically for individual pods.**          

</br>

> _We'll then be able to gauge underlying issues with the pods👍 ➡️ This will include pod status, CPU / memory usage, network usage, the volume of logs produced, the number of restarts etc._

</br>


 <ins>_Cluster Monitoring dashboard ☸️ :-_</ins>      

&rarr; **Overall health of the k8s cluster with all its components -  nodes, services and deployments**

</br>

>  Helps us cover the following:-
> -  number of deployments & nodes,
> - resource utilisation,
> - health and status of nodes
> -  alerting and monitoring notifications.

</br>


  <ins>_Node Monitoring dashboard:-_</ins>     

It's around **pod allocation to the nodes**, checks for `MemoryPressure` , `OutOfDisk` or any such conditions, **node utilisation metrics** (over-utilised / underutilised), **health and status of the nodes**

</br>

---

## _The Logging Suite - EFK Stack_

- Since we're done with the monitoring and alerting aspect, let's turn to collecting, analysing &  visualising our logs

You can check out my EFK manifests here:- https://github.com/TanishkaMarrott/EFK-Stack ☑️ 

--

### _Quick dive into what's EFK, and into its workflow_

_**Intent:-**_ Log collection, aggregation and visualisation.

</br>

E --> ElasticSearch --> Search & Analytics Engine + Storing, indexing and querying capabilities

F --> FluentD --> Data collector & shipper

K --> Kibana --> Data Viz Tool



**_Expore + Analyse + Visualise Log Data = Making sense of the collected log data in real-time_** 🙂

</br>

## _The EFK Workflow_

                 
                   Data Sources (They could be log files, shippers, etc)                           
                              
                              ⏬                           
                                                         
                   Fluentd (Enriching it with metadata, transforming the data into a format suitable for ElasticSearch)               
                   
                               ⏬                           
                                                       
                   Elasticsearch (Storing, indicing the data)                     
                              
                               ⏬                           
                                                        
                   Kibana (Visualization - gaining insights into patterns & trends)                  

                  

</br>

 Now let's discuss about our EFK Manifests, Apply the K8s manifests to create the EFK Deployment

</br>

>  💡 Let's clarify a few points here.

</br>

### Why did we implement the EFK Stack when Prometheus and Grafana were already in place?

 Our Rationale :-
            
  **Prometheus and Grafana help you with the "what" factor, the 'metrics'.** What's exactly happening in your system, status of your application at this point of time.
                  
  **EFK is more of a logging suite,**                      
 We could get into the details and context around the "root-cause" of the problem through detailed logs, --> specific error message, status codes


➡️ enhanced troubleshooting & incident response 👍 👍

</br>

---



## _Deep-dive into the EFK Manifests:-_

### 1 - **`Namespace.yaml`** :- 

Applying this manifest would create a namespace `efklog` for the EFK stack components. 


> _**I could have users across multiple teams working on a single cluster**, and **I can make use of RBAC - that's namespace scoped**, That means users can access resources they're intended to._

</br>

--

### 2 - **`ElasticSearch_Service.yaml`** :- 

**We've configured the service to listen for requests at port 9200**, TCP Protocol, **And forward these requests to `db` port on the - `elastic-search-logging` pods**


> 🔎 **_Purpose?_** Helps data sources send logs to the underlying pods --> Aggregation of logs to the ElasticSearch application 


</br>

--

### 3 - **`ElasticSearch_StatefulSet.yaml`** :- 


#### <ins> Security + Performance + Data Durability - How? </ins>

I'll quickly recapitulate the pointers / non-functional enhancements we've done.     

</br>

> **We're being very specific in the permissions attached to the SA , to be assumed by the ElasticSearch Application pods -- with permissions to `get` resources like `endpoints` , `services` and `namespaces`.**
>     
> --> limiting the operations ElasticSearch can perform.

</br>

> Next, **I wanted things to scale while still being cognizant of the maintained state** -- Remember, ElasticSearch is a distributed database.
>       
> So, **we've increased the number of replicas.** I had to optimise performance as well, **had to define resource requests and limits**. This enabled me to ensure we've got sufficient resources for ElasticSearch, while not overwhelming / overconsuming system resources.

> Simultaneusly, **I had to focus on Data Persistence to improve durability**. Despite pod restarts. Hence, we utilised **`PersistentVolumeClaim`**            
> **Plus, a rolling update strategy for minimal downtime**

</br>

##  The challenge we faced from a security standpoint

Not going too deep, but this is important. The `vm_max_map_count` defines the maximum number of memory-map areas a process may have. And it's crucial for such databases like ElasticSearch. We need to set a higher `vm.max_map_count` value (at least 262144) than the usual default.

**In a k8s environment, we cannot adjust system-level settings for the nodes from within the pods, by default. 🤔 However, for the application to function optimally, I need to have this modified.**

--

▶️  Interim Solution:- So, we had used an `initContainer` . `InitContainer`  runs to completion before other subsequent ElasticSearch Containers (In this eay, they'll have an environment set up and running.)

It must run in Privileged Mode, nearly equivalent to a root user
**Not Recommended. High risk of Privilege Escalation in case of a VM Compromise. We had to change our approach**

--

➡ What could be the Security Risks? Well, if the container would be compromised by an attacker, he could gain root access to the node, gaining control over other containers and services running on the node. He could access any critical files & configuration settings; could deploy malware, and exfiltrate sensitive data. Endless possibilities, all boiling down to privilege escalation

</br>

## _How did we enhance security while solving this pain-point?_

By using DaemonSet. 💡

I'll explain how.

Consider I'm using the `initContainer` Approach. What does it do? Each time a pod restarts or is redeployed, the initContainer checks if this system-level Configuration `vm-max-map-count` , is 262144 in our case. Once this node-level configuration has been verified or applied if , subsequent ElasticSearch containers would run. 

> This means 1) Multiple `initContainers` in multiple pods = Multiple Containers running in privileged mode = High Risk in terms of security exposure

> 2) Besides a higher attack surface area, it also means a lag in pod startup times, = Operationally inefficient + a performance bottleneck

> This means I'm propagating changes from 'pod-level'. Not an ideal approach.

--

Now, let's shift to approach 2

I'm using a DaemonSet for this purpose. DaemonSet is a K8s object which is responsible for creating a copy of a specific pod across some / all nodes, as the case maybe.

How would it work? The DaemonSet would create a pod in each node, As new nodes are added to the cluster, it'll automatically deploy this pod to the new nodes as well.

There'll be a container within this pod, that'll be responsible for modifying the host kernel parameter - It's the `vm-max-map` count in our scenario. 
So, it's a one-time execution, this container executes once during the startup time, and this change is made once and persists beyond the lifecycle of the pod

> _So, how does it actually help us?_

Advantage 1 &rarr; There's a **consistent application of required system-level settings** across all nodes in a cluster

Advantage 2 &rarr; **Automatic application to new nodes in future**

Advantage 3 &rarr; We're **reducing the overhead that'll be incurred by the application pods,** due to checking or applying system-level settings, as these settings are pre-applied at the node level, reducing startup times and complexity.

 👍🙂


---

#### 4 - **`Fluentd_Config_Map.yaml`** :-

We'll be defining something called a ConfigMap. So, what's a configmap? It's used to store non-confidential data, in a key-value format. In our case, we'll be using a configMap to configure FluentD, our log collector and shipper

Let's make a deep-dive into this ⤵️

Cluster Logs --> Fluentd - Collection & Enrichment -->  Forwarded to ElasticSearch for Storage

1 - First things first, &rarr; system configurations. We'll specify the root directory for our fluentD buffers. Logging level set to info, configured the security settings like shared keys, including hostname verification

2- Next is the input configuration -- configuration for inputting the container logs.

What does this comprise?

We'll configure fluentd to "tail" container logs, With a position file to keep track of the logs that've already been read. 

3- Next up, some Data Enrichment as well. 📇

>  It not only parses JSON logs, but also enriches the logs by adding some context to it - k8s-specific info.  Implementing some sort of filters to transform the log records, and remove sensitive data (like passwords and secret keys). 👍

4 -

## _Specifics into Buffer configuration and overflow management_

</br>

> **We had to ensure there's no data loss during high-volume periods,** or in cases when the downstream system (ES in this case) is temporarily unavailable

</br>

What did we do? 

- **Mixing both memory and file based buffers :-** :bu

  Memory based buffers are suitable for faster data access. It's almost instantaneous. Which is brilliant for faster data ingestion and subsequent processing.
  
</br>

== This ends up reducing ovreall latency in the data ingestion and processing cycle. 💡

We couldn't ignore the data persistence capability as well. File based buffers store data on the disk, ---> Data can persist irrespective of system crashes, or when restarted. Also during spikes, or periods when there're high log volume, or when the downstream service is temporairly unreachable, File-based buffers are used to sustain such backpressure scenarios. It provides us with larger capacity when compared to memory buffers.
</br>

> 👍This means you don't only speed up the data ingestion process but still ensure that we've handled logs reliably in case of any system outages ☑ 

</br>


- Having some **limits on the total buffer size, and the max chunk size** ⤵️

One ➡️ there's an upper bound of 512 MB, of the total memory size of the buffer, prevents fluentd from consuming excessive memory resources

Two ➡️ we've also set a limit on the total chunk size, 16 MB for memory, and 2M for file based buffers. Smaller chunks makes them more manageable and can reduce latency, But we need to cognizant of the overhead that may come along. 16 MB is a good figure though.

</br>

- A **flush interval of 5 seconds** -->  not too short, not too frequent, helps reduce latency in forwarding/flushing the logs

- Our configuration also employs an **exponential retry strategy**, this means that if the logs cannot be directed downstream, for any problem whatsoever, FluentD would retry at increased intervals ☑️        

- Additionally, we've configured **overflow_action of block**, meaning if the buffer reaches its capacity, Fluentd will block new data from being buffered until space becomes available. 

</br>

> ➡️ This ensures that in event of buffer overflows, the action would be to block further buffering and prevent unbounded memory usage. 

</br>

I had to make some provisions for the max queue length limit and max time interval between the two subsequent retries for the file buffers

The logs are now "processed"

5 - We'll now direct these processed logs to the ElasticSearch instance port 9200, protocol https. It configures auth with ES, Also setups up buffering for outoutting the logs (file-based buffering here), I've also customised the naming pattern of ElasticSearch indexing, The indexing would be based on the orginating namespace and the current date.

## _How did we accelerate query and retrieval times in ES?_

We'll be customising ElasticSearch indexing names - being dynamically populated based on:-

- Name of the namespace it originates from.
- Timestamp (Dates in our case)
 

✅ Time-based segmentation helps in implementing lifecycle configurations for storing these logs.

✅ Namespace segragation --> Organised storage of logs and subsequently a faster retrieval. 

<ins> **_Use-case?_** </ins> 

So, in future, **if we'd wish to carry out historical data analysis, we'll be able to clearly delineate logs from different time periods and carry out Trend Analysis / Anomaly Detection**

</br>

## _Security Enhancements we've primarily focused on_:-

-  (FluentD ━ K8s API Server) & (FluentD ━ ElastiSearch) **--> Secured with TLS/SSL**

- (FluentD ━ FluentD) **--> Authentication via the `shared_key`** .

   >  _Why? Because FluentD instances interact with the FluentD log aggregator instance, in such case, we need to verify the authenticity of the connection._

- **Hostname Verifications** :- Prevent man-in-the-middle attacks       

- **Filtering out Sensitive data** before logs aggregation               

  > ➡️ None of the sensitive secrets lie exposed in the cluster logs. 

 -  There've been multiple measures implemented to ensure that **resource usage is bounded, and thus preventing a DDoS Attack.**         

</br>

#### 5. **`Fluentd_DaemonSet.yaml`** :-

Tasks we performed here:- 

1- **Created an SA that will be assumed by the FluentD application pods** to communicate with the K8s API Server         

2- A **Cluster Role consisting fo the permissions that'll be needed by FluentD** for collecting cluster-wide logs     

3- A **role binding that'll be binding this ClusterRole to the SA .** for the pods to inherit these permissions.    

4 - DaemonSet for FluentD

</br>

### Why did we deploy FluentD as a DaemonSet in this stack?



_Reason 1_ --> FluentD is a log forwarder. It doesn't need to be stateful. 

_Reason 2_ --> Moreover, we need to ensure that a FluentD pod runs across all the nodes of the cluster. 

_Reason 3_ --> FluentD needs to collect logs from node-specific paths like `/var/log`. Had it been a StatefulSet we would have been restrained to use stable network ids or maybe a persistent storage, which is out of context, for the use-case at hand.  



</br>

> Running FluentD as a DaemonSet means **I'm comprehensively covering nodes all across the cluster, thus ensuring cluster-wide log collection + forwarding** 👍

</br>

#### 6. `Kibana_Deployment.yaml`

Okay, so let's focus on what are the **non-functional aspects we've tried to incorporate in this deployment**

</br>

💠- **Multiple replicas of Kibana pods,** ▶ **Higher availability.** Minimized downtime 👍

💠- These containers will be running as a non-root user (`runAsUser: 1000`).     

   **We've made it a point to explicitly set `runAsNonRoot: true`** 
    ---> _Low PrivEsc Risks_ 

💠- **We used a seccomp profile to enable admins limit the system calls a container can make.**

> Seccomps profile has wide applications **in protecting against kernel-level exploits.**


💠- **Having specified CPU and memory requests and limits, helps me in a dual manner.** One, we've got sufficient resources for Kibana Containers for maintaining a stable operation, while still preventing them from over-consuming resources, affecting my other services ▶️ Efficient Resource Management

 💠- **Liveness + Readiness Probes.**                        
 Readiness = When a Kibana pod is ready to start accepting traffic, Liveliness = Checks if the pod requires a restart

💠- **Plus a PVC - persistent volume claim to preserve the application's state** across restarts.
 

</br>

#### 7. `Kibana_Service.yaml`

What're we essentially doing? **We're defining a Service for users to access the Kibana dashboard from outside the k8s cluster**... ☑️                

The LoadBalancer type automatically provisions an external load balancer (supported by the cloud provider) & assigns it a public IP that routes to Kibana (port 5601)

</br>

> ➡️ **This means users can interact with Kibana’s UI by visiting `http://<External-IP>:5601`, where `<External-IP>` is the LB's IP Address**

</br>

_Kibana Snapshots:-_

<img width="956" alt="Reddit-App-clone-kibana-1" src="https://github.com/TanishkaMarrott/Orchestrating-a-DevSecOps-Pipeline-with-integrated-Logging-and-Monitoring-Frameworks/assets/78227704/c237f72d-1222-4149-b737-cabcfb2116bc">


--


<img width="956" alt="Reddit-App-Clone-App-Kibana-2" src="https://github.com/TanishkaMarrott/Orchestrating-a-DevSecOps-Pipeline-with-integrated-Logging-and-Monitoring-Frameworks/assets/78227704/97ae9186-c4f6-43e4-bd01-a7a987b05b55">


--


<img width="956" alt="Reddit-App-Clone-App-Kibana-3" src="https://github.com/TanishkaMarrott/Orchestrating-a-DevSecOps-Pipeline-with-integrated-Logging-and-Monitoring-Frameworks/assets/78227704/c42feea1-b905-4723-98d5-3ea90075db3c">

--

## Wrapping it up!


A big thank you for accompanying me on this journey. It was an absolutely amazing experience!! 😊

--

In my humble opinion, by integrating tools like Jenkins & ArgoCD + Security Tool integrations and our logging/monitoring suite --> Prometheus, Grafana and the EFK stack within the k8s eco,       

**We have essentially built something, that:-               
1- Holds a good potential to streamline development and deployment processes**      
2- **Very well aligned with, I'd say, with the fast-paced business requirements**

Also, I've done my best in **improvising this architectural workflow from a non-functional standpoint** ➡️ Security, Scalability, Performance and Fault tolerance &rarr; all have been taken into account while creating this workflow 👍

</br>

<ins> **Key takeaway:-** </ins>
> #### **From an agility and security standpoint, if you actually wish to "_create value_", it is absolutely important to ingrain DevSecOps principles from the very beginning** 💡

</br>

--

I've just scratched the surface, there's a long way to go,  while refining and creating even better, resilent cloud solutions! 😊  


### Suggestions for Potential Improvements:-

Absolutely!!         
**You're warmly invited to contribute via a pull request or reach out directly at tanishka.marrott@gmail.com for any inquiries** or collaboration opportunities. Additionally, **connect with me on LinkedIn - https://www.linkedin.com/in/tanishka-marrott/** to stay updated on my latest projects and professional endeavors.


### Acknowledgments:
Grateful to Mudit Mathur and to Sridhar Modalavalasa for their insightful blogs on DevSecOps. A special thank you to the **AWS Well-Architected documentation** for serving as my de-facto guide throughout this journey. 🙏



