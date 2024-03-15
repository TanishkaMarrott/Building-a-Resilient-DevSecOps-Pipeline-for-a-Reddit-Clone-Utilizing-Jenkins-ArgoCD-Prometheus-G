# Orchestrating a DevSecOps Pipeline for Cloud-Native Reddit Clone


## _Quick Introduction_:-

Our project today is all about the specifics involved while configuring a  **_DevSecOps Pipeline._**   
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.

--> _What are we trying to achieve?_    
&nbsp; &nbsp; &nbsp; **Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value** 

&nbsp;

## _So, how does the workflow actually look like?_


**_Infrastructure Provisioning_** (Terraform)  
                  ↓     
**_Container Orchestration_** (EKS)     
                  ↓      
**_CI/CD_** (Jenkins + ArgoCD)   
                  ↓     
**_Security Integrations_** (SonarQube + OWASP + Trivy)   
                  ↓       
**_Logging, Monitoring & Data Visualization_** (Prometheus + Grafana + EFK Stack)   
                  ↓     
**_Real-time Insights_** into Application Health & Performance   


   
</br>

>  _**Okay, so how does DevSecOps augment Business Processes?**_

</br>

## _How does DevSecOps align with my Business Goals?_


_Simple Answer:-_   
**Solid Foundation to quickly realign with changing business requirements**

</br>

_It's more like a ***Strategic Enabler,***_ to boost efficiency, streamline processes.    

-->_Quicker Product Iterations & feedback loops_ through continuous integration and deployment   
 means we're **_market-agile_**

</br>

> **<ins>Agile DevSecOps = Swiftly adapting to the fast-evolving business requirements.**  

</br>

 _Quality Assurance (due to Automated Testing) + Reducing costs due to post-deployment fixes._    
=> Mitigating Security risks early means **_averting Data Security incidents / breaches due to security lapses._**

</br>

## _Phase 1 --> Infrastructure Setup & Tool Configuration_

<ins>**Purpose:-**</ins> _Establishing the foundation for our DevSecOps Pipeline here --> Setting up the necessary infrastructure and configuring essential tools...._

### Configuring Jenkins Plugins

We've provisioned an EC2 instance using Terraform, incorporating the necessary user data, and on this VM, we've **_installed Jenkins, SonarQube, and Trivy,_** --> establishing the base for our CI/CD pipeline and security assessments.       

Next, we've **_configured Jenkins Plugin Installations_**, --> Aid in integrating Jenkins with other CI/CD tools in our pipeline   

--

In our project's DevSecOps pipeline, we've integrated a selection of Jenkins plugins.    

Not going too deep, but giving an holistic overview of the kind of plugins we've used:


**i) _Foundational Plugins for Jenkins Setup:-_**     

The first set of plugins are revolving around the ones that are generic and implicit, meaning they _need_ to be insalled, for ensuring a fully functional setup (Something that Jenkins calls as "Suggested"). These include the SCM Plugins, the ones used for integrating build tools with Jenkins; Notification & reporting, General Utilities. the ones around User management, plugins for testing Frameworks or for orchestrating pipeline workflows (the pipeline plugin)

> _These plugins are essential for a fully functional, comprehensive Jenkins environment, covering all the necessary aspects from source code management to pipeline orchestration and user management._

