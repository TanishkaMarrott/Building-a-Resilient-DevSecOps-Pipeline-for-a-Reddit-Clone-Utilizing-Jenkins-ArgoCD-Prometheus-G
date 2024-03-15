# DevSecOps Pipeline for a Secure & Scalable Reddit Clone on Cloud-Native Architecture


## _Quick Introduction_:-

Our project today is all about the specifics involved while configuring a  **_DevSecOps Pipeline._**   
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.

--> _What are we trying to achieve?_    
&nbsp; &nbsp; &nbsp; <>**Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value** 

&nbsp;

## _So, how does the workflow actually look like?_
</br>

 > _It's more like an iterative workflow, with continuous feedback loops._ _That's important when you're aiming for scalability, resilience and security..._  

-  Step one, as always - **_Infrastructure Provisioning_**.  --> Automating through **_Terraform_**
 
- **_Elastic Kubernetes Service_** for orchestrating **_containerised applications_**.      
     --> Managing the application lifecycle.

- **_CI/CD --> Jenkins & ArgoCD_**     
  &nbsp; &nbsp; &nbsp; - Making sure every change's verified --> **_automated builds and tests_**      
  &nbsp; &nbsp; &nbsp; - Argo CD --> **_continuous deployment_** of the application to the Kubernetes environment


- _**Security Integrations**_
  

|               | _SonarQube_   | _OWASP_     | _Trivy_    |
|---------------|-------------|-----------|----------|
| Static Analysis (SAST)  | ✓           | ✓         |          |
| Dependency Check       |             | ✓         |          |
| Container Image Scanning |             |           | ✓        |


-  _**Prometheus + Grafana + EFK Stack**_:-     
  &nbsp; &nbsp; &nbsp; --> **Logging, monitoring & Data Visualization**_    
 &nbsp; &nbsp; &nbsp;  --> Real-time Insights into application's health and performance.
   
</br>

> _Okay, so how does DevSecOps augment Business Processes?_

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

&nbsp; &nbsp; &nbsp; &nbsp; - Post provisioning a VM, we've utilized Terraform to automate the infrastructure setup.    
Terraform Files have been shared above. The EC2 instance hosting our tools has been initialized with necessary EC2 User Data.    
(Please check files above)

**--->  Tool Setup:-**      

We've installed Jenkins, SonarQube and Trivy on the provisioned VM.   
Additionally, we've configured Jenkins with the required plugins to enable seamless integration with other tools in our pipeline. 

**---> Plugin Installation + Configuration:-**   

<ins>**Purpose:-**</ins> It's essentially something that enhances the functionality of Jenkins, while allowing for seamless integration with some other tools in the Ci/CD Pipeline.   

Not going too deep into the nitty-gritties, but giving an holistic overview:-

  1- SCM Plugins:- They allow jenkins to fetch source code from Git, in our case. (Version Control Systems) for building and testing change.    
  2- Build Tools Integration Plugins:- Jenkins integrates with the build tools, through these plugins. We've used plugins for Gradle and Ant     
  3- Testing Framework Plugins:- Allows for Jenkins integrations with Testing frameworks.      
  4- Deployment and Delivery Plugins:- Plugins for deployment tools, like Docker, AWS. Allows jenkins to automate deployment to 
wide variety of environments, including staging and production.     
  5- Notification Plugins:- Jenkins notifes users about build status,  test results through plugins such plugins, We've used      
  
We've downloaded and configured the following plugins for Jenkins to enhance its functionality and enable smoother integration with our CI/CD processes.







