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


