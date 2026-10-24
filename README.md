# terraform-jenkins-remote-backend

This is a follow on from a previous repo created. 
One of the main issues with previous project is the inflexibility of the Statefile. For typical organizations we need to have central location for the Statefile so that different teams and developers can reference it when creating resources.
At the moment the Statefile is being stored on the Jenkins server itself. This is fine for small personal projects but quickly becomes problematic when the project or organization infrastructure needs grows.

One solution recommended is to store the Statefile as a remote backend, in this project I will be using an Azure storage account for this. 

Once this remote backend is completed I will create additional resources to demonstrate referencing this backend Statefile.

## Prerequisites

- Existing Jenkins pipeline configured to use included Jenkinsfile.
- Storage account manually created in Azure to store backend Statefile.