# DevSecOps Pipeline for a Secure & Scalable Reddit Clone on Cloud-Native Architecture


## _Quick Introduction_:-

Our project today is all about the specifics involved while configuring a  **_DevSecOps Pipeline._**   
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.

--> _What are we trying to achieve?_    
&nbsp; &nbsp; &nbsp; **Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value** 

&nbsp;

## _So, how does the workflow actually look like?_
</br>

 > **_It's more like an iterative workflow, with continuous feedback loops._ _That's important when you're aiming for scalability & security..._**  

</br>

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
---

 _Okay, so how does DevSecOps augment Business Processes?_

</br>

## _How does DevSecOps align with my Business Goals?_


_Simple Answer:-_   
**Solid Foundation to quickly realign with changing business requirements**

</br>

_It's more like a ***Strategic Enabler,*** to boost efficiency, streamline processes._    

**_Quicker Product Iterations & feedback loops_** through continuous integration and deployment   
--> means we're **_market-agile_**

</br>

> **<ins>Agile DevSecOps = Swiftly adapting to the fast-evolving business requirements.**  

</br>

 **_Quality Assurance (due to Automated Testing) + Reducing costs due to post-deployment fixes._**  

=> Mitigating Security risks early means **_averting Data Security incidents / breaches due to security lapses._**

</br>

## _Phase 1 --> Infrastructure Setup and Tool Configuration_

</br>

> _Establishing the foundation for our DevSecOps Pipeline here --> Setting up the necessary infrastructure and configuring essential tools...._


**_---> VM Setup & Terraform Provisioning:_-**  


 - The EC2 instance hosting our tools has been initialized with necessary EC2 User Data.    
(Please check files above)

**--->  Tool Setup:-**      

- We've installed Jenkins, SonarQube and Trivy on the provisioned VM.   

**---> Plugin Installation + Configuration:-**   

<ins>**Purpose:-**</ins> It's essentially something that enhances the functionality of Jenkins, while allowing for seamless integration with some other tools in the Ci/CD Pipeline.   

Not going too deep into the nitty-gritties, but giving an holistic overview,   

**Source Code Management:**
- Git: Integrates Jenkins with Git version control.
- GitHub Branch Source: Allows Jenkins to build branches from a GitHub repository.

**Build Enhancements:**
- Ant: Ant + Jenkins.
- Gradle: Gradle + Jenkins.
- Build Timeout: Allows Jenkins to terminate a build if it takes too long.
- Credentials Binding: Allows jobs to authenticate with external systems using secured credentials.
- OWASP Markup Formatter: Escapes the output of console logs to prevent cross-site scripting vulnerabilities.

**Security and User Management:**
- LDAP: Integrates Jenkins with LDAP for user authentication and authorization.
- SSH Build Agents: Enables Jenkins to launch build agents over SSH.
- PAM Authentication: Integrates Pluggable Authentication Module (PAM) authentication with Jenkins.
- Matrix Authorization Strategy: Provides a fine-grained access control mechanism to manage user permissions.

**Notifications and Reporting:**
- Mailer: Allows Jenkins to send notification emails upon build completion or other configured events.
- Email Extension: Extends the mail capabilities of Jenkins with additional features like triggering emails on build statuses.

**General Utilities and Enhancements:**
- Timestamper: Adds timestamps to the console output of Jenkins jobs.
- Workspace Cleanup: Deletes the workspace before the build starts or when a build finishes, to maintain a clean build environment.
- Folders: Allows Jenkins jobs to be organized into folders.

**Pipeline Management and Orchestration:**
- Pipeline: Provides the fundamental Pipeline functionalities in Jenkins to support continuous delivery pipeline processes.
- Pipeline: GitHub Groovy Libraries: Enables the use of shared Groovy libraries from GitHub within Pipeline jobs.
- Pipeline: Stage View: Provides a visualization of Pipeline build stages in Jenkins.

**Testing Frameworks:**
- JUnit (likely, though not explicitly listed): Integrates JUnit test reports with Jenkins, a common plugin used for unit test reporting in Java projects.

Each plugin is selected for its ability to enhance Jenkins' functionality in the areas of project management, building, testing, deploying, and automating various aspects of the software development lifecycle.





