# Deploying a Scalable Reddit Clone in a Secure Cloud-Native Ecosystem

</br>

## _Quick Introduction_

This project aims at **_deploying a Reddit Clone Application_** in the AWS environment, with a prime focus on the non-functional aspects.       
We've leveraged the flexibility of **Kubernetes for orchestration** + **Docker for containerization** + **a CI/CD pipeline for automated testing and deployment**. More on **Jenkins & ArgoCD** subsequently...

As always, my project seeks to ensure **scalability**, **resilience**, and seamless updates. That's actually because it provides a robust foundation for the application's growth and evolution.      

The deployment strategy is designed to **maximize uptime and efficiency**, while **security** measures are integrated at every step to protect against vulnerabilities and threats, 
--> making the application reliable and super-secure



### Why DevSecOps?

Setting some context...

--

Before actually diving deep into the project at hand, I'd like to quickly set the context as to how DevSecOps emerged.

--> DevOps: It's actually a set of practices, methodologies. It's absolute aim is **improvising the quality &  pace at which applications and services are delivered**, right from development to Operations. (Encompasses the Entire Software Development Cycle).
Faster 

--> Everything's automated, Right from **Code Integration, builds, tests, to continuous Deployment. This e** 
    **Infrastructure Provisioning** too is automated, making things consistent, predictable, and reliable

--> Code Integration, simply means merging various code changes into the mainline. We've got tools that aid in validating those changes. The build and test phases are integrated into the CI/CD Pipelines.

 This enables automated tests to prevent any regressions, breaking changes, in case of modifications to the source code. This enables th Developers to relaese new features 

**Faster Release Cycles + Increased Deployment Velocity + Faster Time-to-Market = Smoother Transition from Dev to Prod...!**


--> Errors are detected way early. **Reducing the impact and costs incurred due to fixing errors post deployment**. 

####  _Key Takeaway_:- 
More frequent & reliable deployments, reducing the time from ideation to deployment.

</br>

>  _Okay, So, what spurred up DevSecOps?_

</br>

Higher the speed, higher the risk of security vulnerabilities being introduced...

Considering Security Design later in the lifecycle, means you're lagging behind. Security Analysis,especially the Static Analysis Security testing (SAST),for analysing it from inside out,--> its code, structure, misconfigurations and vulnerabilities, must be ingrained in the initial pre-commit stages of the pipeline, This helps identify potential security issues in the beginning itself.

#### This ingrains an essence of Shift-Left Security, "Baking In Security" in the CI/CD Workflows itself.


## Core Services involved:-

  1 - Terraform:- Infra-As-a-Code --> Helps manage and provision Infrastructure in a predictable and consistent manner. Brings repeatability into the process of defining and deploying infrastructure

  2 - AWS :- Our Infrastructure backbone wherein we've hosted our application

  3 - Elastic Kubernetes Service (EKS) :- AWS' Managed Service for Kubernetes, allows for orchestration of containerized applications --> Automating the deployment, scaling and management of these containers across a cluster of hosts

  4 -  Jenkins - Continuous Integration / Continuous Deployment (CI/CD) tool for automating the build, test and deployment processes.



