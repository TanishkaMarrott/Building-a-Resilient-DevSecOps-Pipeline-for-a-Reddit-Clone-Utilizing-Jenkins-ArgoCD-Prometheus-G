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



## _Phase 1 --> Infrastructure Setup & Tool Configuration_

We'll be setting up the necessary infrastructure and configuring essential tools in this phase

We've provisioned an EC2 instance using Terraform, incorporating the necessary user data, and on this VM, we've **_installed Jenkins, SonarQube, and Trivy,_** --> establishing the base for our CI/CD pipeline and security assessments. Next, we've **_configured Jenkins Plugin Installations_**, --> Aid in integrating Jenkins with other CI/CD tools in our pipeline   

### _Plugins we've utilised_


**_&rarr; Foundational Plugins for setting up Jenkins:-_**     

These include the SCM Plugins, the ones used for integrating build tools with Jenkins; Notification & reporting, General Utilities. the ones around User management, plugins for testing Frameworks or for orchestrating pipeline workflows (the pipeline plugin)

</br>

> Long story short, it's for a fully functional Jenkins environment, covering all the necessary aspects from Source Code Management to Pipeline Orchestration

</br>

**_Plus some specialised ones..._**   

Quick Segregation:-


| Category                | Plugin                 | Purpose                                                                                   |
|-------------------------|------------------------|-------------------------------------------------------------------------------------------|
| Runtime & Environment   | **Eclipse Temurin Installer** | Automates the installation of the JDK           |
|                         | **Nodejs**                | Enables Jenkins to set up Node.js environments, crucial for projects requiring Node.       |
| Code Quality & Analysis | **SonarQube Scanner**     | Integrates SonarQube analysis into Jenkins --> SAST        |
|                         | **Sonar Quality Gates**    | Breaks the build based on SonarQube quality gates --> code meets quality standards.  |




