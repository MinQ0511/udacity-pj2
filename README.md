# Overview

This project is the second project in the "Cloud DevOps using Microsoft Azure" of Udacity - "Building a CI/CD pipelines"  

The project contains a Python application that predicts housing prices in Boston provided by Udacity. The repository has the following features:

1. Creating Makefile for Build Automation
2. Creating CI/CD pipelines using Github Action
3. Deploying a Web App Services manually in Azure
4. Creating CI/CD pipelines using Azure DevOps

The project focuses on establishing a continuous integration and continuous deployment (CI/CD) pipeline to streamline the development and deployment process for the application.

## Project Plan
A [Trello](https://trello.com/b/n9WapJUQ/udacity-pj2-demo) board for the project has been created to keep track of deadlines for all of the tasks.

A [spreadsheet](https://github.com/MinQ0511/udacity-pj2/blob/main/project-management-template.xlsx) that includes the original and final project plan.

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>
* 
Below is the guide with step-by-step instructions on how to run a Python project:
## Deploy the app in Azure Cloud Shell

1. Setup an Azure Cloud Shell and open, then clone the repository by SSH:
``` bash
git@github.com:MinQ0511/udacity-pj2.git
```
![clone the repository pictures](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/cloned-repo.jpg)
2. Change the directory to the directory that contains the cloned repository :
``` bash
cd udacity-pj2
```
3. Create a Python virtual environment
``` bash
python -m venv <your environment name goes here>
```
4. Activate the virtual environment created above to start.
``` bash
source <your environment name goes here>/bin/activate
```
5. Run Makefile to install all needed dependencies in the virtual environment and run the tests:
``` bash
make all
```
![make all pictures](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/make-all-cmd.jpg)
6. Run the application:
``` bash
python -m flask run
```
7. Open Cloud Shell and check that the application is working:
``` bash
./make_predicttion.sh
```
![make prediction](link)
8. Create CI by GitHub Actions
- Enable Actions for the repository and set up a workflow.
![GitHub Actions]((https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/github-action.jpg))

## Deploy the app to an Azure App Service

1. Change the directory to the directory that contains the cloned repository:
``` bash
cd udacity-pj2
```
2. Deploy this repository to App Service in Azure:
``` bash
az webapp up --name <your webapp goes here> --resource-group <your resource group goes here> --sku B1 --logs --runtime "PYTHON:3.9"
```
3. Create Azure Pipeline for the app in Azure DevOps. The steps to set up the pipeline following :
* Access to https://dev.azure.com and sign in.
* Create a new public project.
* Select Project Settings and create a new service connection to Azure Resource Manager and an Agent Pool.
* Next, back to Azure create a VM and config Agent (VM). Then add the self-hosted agent to the agent pool that you created in the step above.
* Finally, create a new Azure pipeline linked to the GitHub repo and use the existing azure-pipelines.yml. 
* 
Pipeline jobs list:

![pipeline](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/azure-pipeline-success.jpg)
Pipeline job success details:

![pipeline](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/list-azure-pipelines-jobs.jpg)
App Service in Azure:

![App Service](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/app-details.jpg)

3. Check app is working:
* Access to the web app's domain via the browser
![webapp page](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/webapp-run.jpg)

* Run prediction against Azure Application.
``` bash
./make_predict_azure_app.sh 
```
Note: Make sure edit the make_predict_azure_app.sh file to match the deployed URL
-X POST https://<yourappname>.azurewebsites.net:$PORT/predict
![prediction](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/run-after-deploy-azure-cd.jpg)
* Trace streamed log files from the deployed application
``` bash
az webapp log tail -g <your resource group goes here> --name <your webapp goes here>
```
![webapp log tail](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/log-tail.jpg)

* Load test using locust
![locust](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/locust.jpg)
![locust](https://github.com/MinQ0511/udacity-pj2/blob/main/Screenshots/locust-ouput.jpg)

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 
You can watch a short demo of the project on Youtube at [here](https://youtu.be/SEG4vM-Dt3w)
