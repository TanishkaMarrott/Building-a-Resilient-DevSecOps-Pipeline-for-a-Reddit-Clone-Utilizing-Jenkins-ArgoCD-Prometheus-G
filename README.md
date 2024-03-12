# Implementing a Secure & Scalable Reddit Clone within a cloud-native Architecture


## _Quick Introduction:-_

Our project today is all about the specifics involved while configuring a  _**DevSecOps Pipeline.**_     
Ensures we're not only speeding up releases, but also being security-compliant, from the get-go.    

Technicalities in the sections that follow.


--> _What are we trying to achieve?_   
**Optimized QA + Speedy Delivery + Security Ingrained = Real Business Value**

</br>

_It's more like an iterative workflow, with continuous feedback loops..._

</br>

### _How does the workflow actually look like?_
</br>

 > _That's actually important when you're aiming for scalability, resilience and security._  

- **Infrastructure Provisioning** &rarr;    
   We've used **Terraform** for automating infra-setup

- **Container Orchestration &rarr;    
  Elastic Kubernetes Service** has been used for managing application lifecycle

- **CI/CD &rarr; Jenkins & ArgoCD**     
   **-->** Automated builds and tests make sure every change's verified.       
   Argo CD would then facilitate continuous deployment of the application to the Kubernetes environment

- Security Integrations we've made
   -  **Static Analysis Security Testing - SAST &rarr; SonarQube**
   -  **Vulnerability Assessments &rarr; OWASP**
   -  **Container Image Scanning &rarr; Trivy**

-  Deployed **Prometheus, Grafana and EFK Stack** - (ElasticSearch, Fluentd, Kibana)      
   --> Configured Logging, Monitoring & Data Visualization    
   --> **Real-time Insights** into Application's health and performance.
   
</br>

> _Okay, so how does DevSecOps augment Business Processes?_

</br>

## _How does DevSecOps align with Business Objectives?_


_Simple Answer:-_   
Solid Foundation to quickly realign with changing business requirements

_It's more like a ***Strategic Enabler,*** to boost efficiency, streamline processes._    

**_Quicker Product Iterations & feedback loops_** through continuous integration and deployment --> means we're _**market-agile**_

</br>

> **<ins>Agile DevSecOps = Swiftly adapting to the fast-evolving business requirements.**  

</br>

Helps in both **Quality Assurance (due to Automated Testing)** &  **reducing costs due to post-deployment fixes.**  

=> Mitigating Security risks early means **averting Data Security incidents / breaches due to security lapses.**









