# :man_cook: Open Source MLOps Stack Recipes


When we first created [ZenML](https://zenml.io) as an extensible MLOps framework for
creating portable, production-ready MLOps pipelines, we saw many of our users having to
deal with the pain of deploying infrastructure from scratch to run these pipelines. The
community consistently asked questions like:

- How do I deploy tool X with tool Y?
- Does a combination of tool X with Y make sense?
- Isn't there an easy way to just try these stacks out to make an informed decision?

To address these questions, the ZenML team presents you a series of Terraform-based recipes to quickly
provision popular combinations of MLOps tools. These recipes will be useful for you if:

- You are at the start of your MLOps journey, and would like to explore different tools.
- You are looking for guidelines for production-grade deployments.
- You would like to run your pipelines on your chosen [ZenML Stack](https://docs.zenml.io/user-guide/starter-guide/understand-stacks).

🔥 **Do you use these tools or do you want to add one to your MLOps stack?** At
ZenML, we are looking for design partnerships and collaboration to implement and
develop these MLOps stacks in a real-world setting.

If you'd like to learn more, please [join our
Slack](https://zenml.io/slack-invite/) and leave us a message!

## 📺 See it in action!

If you're a visual learner or just want to quickly get started with stack recipes, we have a video that might interest you. It introduces the concept of stack recipes, and shows you the entire flow of going from scratch to having a full-fledged MLOps stack that you can run your ZenML pipelines on. 

Watch it below:

[<img src="https://user-images.githubusercontent.com/37150991/188932346-1b36680f-7187-4576-942c-9b42a8cb1084.png" width="650" height="400">](https://drive.google.com/file/d/1CA5SyV1EXCNpoc4l_N8R90D0UL78gn1T/view?usp=sharing)

## 📜 List of Recipes

| Recipe               | Tools installed                                                | Description                                                                       |
|----------------------|------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [aws-kubeflow-kserve](https://github.com/zenml-io/mlops-stacks/tree/main/aws-kubeflow-kserve) | Kubeflow on EKS, S3, ECR, MLflow Tracking, KServe | A recipe that creates a Kubeflow pipelines cluster as orchestrator, S3 artifact store, ECR container registry,  MLflow experiment tracker and KServe model deployer |
| [aws-minimal](https://github.com/zenml-io/mlops-stacks/tree/main/aws-minimal) | EKS, S3, ECR, MLflow Tracking, Seldon  | AWS specific recipe to showcase a production-grade MLOps Stack with an EKS orchestrator, S3 artifact store, ECR container registry,  MLflow experiment tracker and Seldon Core model deployer |
| [aws-stores-minimal](https://github.com/zenml-io/mlops-stacks/tree/main/aws-stores-minimal) | S3, ECR | A simple recipe to spin up an S3 artifact store and an ECR container registry |
| [azure-minimal](https://github.com/zenml-io/mlops-stacks/tree/main/azure-minimal) | AKS, Blob Storage, ACR, MLflow Tracking, Key Vault, Seldon | Azure specific recipe that creates an MLOps stack with an AKS cluster as orchestrator, Azure Blob Storage container artifact store. ACR container registry, MLflow experiment tracker and Seldon Core model deployer |
| [azureml-minimal](https://github.com/zenml-io/mlops-stacks/tree/main/azureml-minimal) | AzureML Workspace, Blob Storage, ACR, MLflow Tracking, Key Vault | A recipe that creates a AzureML workspace with MLflow Tracking enabled and adds a compute cluster with access to Blob Storage, and Key Vault |
| [gcp-airflow](https://github.com/zenml-io/mlops-stacks/tree/main/gcp-airflow) | Managed Airflow using GCP Cloud Composer, GCS Bucket, GCR | A recipe that creates a Cloud Composer environment that enables a managed Airflow environment as orchestrator, a GCS artifact store and a GCR container registry |
| [gcp-kubeflow-kserve](https://github.com/zenml-io/mlops-stacks/tree/main/gcp-kubeflow-kserve) | Kubeflow on GKE, GCS Bucket, GCR, MLflow Tracking, KServe, Vertex | A recipe that creates a Kubeflow pipelines cluster as orchestrator, GCS artifact store, GCR container registry,  MLflow experiment tracker, KServe model deployer and option for Vertex AI as a step operator |
| [gcp-minimal](https://github.com/zenml-io/mlops-stacks/tree/main/gcp-minimal) | GKE, GCS Bucket, GCR, MLflow Tracking, Seldon | GCP specific recipe to showcase a production-grade MLOps Stack with a GKE orchestrator, GCS artifact store, GCR container repository, MLflow experiment tracker and Seldon Core model deployer |
| [gcp-vertexai](https://github.com/zenml-io/mlops-stacks/tree/main/gcp-vertexai) | Vertex AI Pipelines, GCS Bucket, GCR and (optional) MLflow Tracking | A stack with a Vertex AI orchestrator, GCS artifact store, GCR container registry and an optional MLflow experiment tracker |

## 🙏 Association with ZenML

[![maintained-by-zenml](https://user-images.githubusercontent.com/3348134/173032050-ad923313-f2ce-4583-b27a-afcaa8b355e2.png)](https://github.com/zenml-io/zenml)

It is not necessary to use the MLOps stacks recipes presented here alongside the
[ZenML](https://github.com/zenml-io/zenml) framework. You can simply use the Terraform scripts
directly.

However, ZenML works seamlessly with the infrastructure provisioned through these recipes. The ZenML CLI has an integration with this repository that makes it really simple to pull and deploy these recipes. Detailed steps are available in the READMEs of respective recipes but a simple flow could look like the following:

1. 📃 List the available recipes in the repository.

    ```shell
    zenml stack recipe list
    ```
2. Pull the recipe that you wish to deploy, to your local system.

    ```shell
    zenml stack recipe pull <STACK_RECIPE_NAME>
    ```
3. 🎨 Customize your deployment by editing the default values in the `locals.tf` file.

4. 🔐 Add your secret information like keys and pass into the `values.tfvars.json` file which is not committed and only exists locally.

5. 🚀 Deploy the recipe with this simple command.

    ```
    zenml stack recipe deploy <STACK_RECIPE_NAME>
    ```

    > **Note**
    > If you want to allow ZenML to automatically import the created resources as a ZenML stack, pass the `--import` flag to the command above. By default, the imported stack will have the same name as the stack recipe and you can provide your own with the `--stack-name` option.
    

6. You'll notice that a ZenML stack configuration file gets created after the previous command executes 🤯! This YAML file can be imported as a ZenML stack manually by running the following command.

    ```
    zenml stack import <STACK_NAME> -f <PATH_TO_THE_CREATED_STACK_CONFIG_YAML>
    ```

To learn more about ZenML and how it empowers you to develop a stack-agnostic MLOps solution, head
over to the [ZenML docs](https://docs.zenml.io).

## ⚗️ Using recipes with Terraform

Running a recipe is a matter of two simple commands. You can clone the repository, and for a chosen
recipe of your choice execute:

```
terraform init
```

```
terraform apply
```

> **Note**
> You need to have credentials for a chosen cloud provider set up before running.

## Create your own recipe 🧑‍🍳

If you want to don the chef's hat and create a new recipe to cover your specific use case, we have just the ingredients you need!

- Check out this video that goes through the process of creating a new recipe by extending recipes that already exist on this repository. It's useful when you want to mix and match components across recipes.

    [![Extend a stack recipe](https://img.youtube.com/vi/lNnWaKjP3I4/0.jpg)](https://www.youtube.com/watch?v=lNnWaKjP3I4)

- Learn more about the design principles behind a recipe, and more information on testing in the [CONTRIBUTING.md guide](./CONTRIBUTING.md)

## 🎉 Acknowledgements

Thank you to the folks over at [Fuzzy Labs](https://www.fuzzylabs.ai/) for their support and
contributions to this repository.

We'd also like to acknowledge some of the cool inspirations for this project:

- [FuseML](https://fuseml.github.io/)
- [Combinator.ML](https://combinator.ml/)
- [Building a ML Platform From Scratch](https://www.aporia.com/blog/building-an-ml-platform-from-scratch/)
