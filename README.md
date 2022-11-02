# Jenkins-Master-GKE
First the tools we used to build this infrastructure
1- Terraform 

2- GCP

3- Jenkins

4- Helm 

5- Kubernetes 
----------------
Terraform ==>
1- we build a network module and also contain the firewall rule to allow ssh connection on VM.
2- we build a 2 Subnets one to have the VM and the Other was for Cluster.
3- commands

             $ cd GCP-Infra
             
             $ terraform init
             
             $ terraform apply
---------------------------------------------------------------------------------------------------------------
GCP ==> 1- connect to your VM by --> gcloud compute ssh --zone "zone" "vm-name"  --tunnel-through-iap --project "project-name"

        2- setup the reqierments on vm 
        
           a- # install gcloud-sdk and initialize gcloud
              $ curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-394.0.0-linux-x86_64.tar.gz
              $ tar -xf google-cloud-cli-394.0.0-linux-x86_64.tar.gz
              $ ./google-cloud-sdk/install.sh
              $ ./google-cloud-sdk/bin/gcloud init
              
           b- install auth plugin
              $ sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
              
           c- install kubectl 
              $ sudo apt install kubectl
              
           d- establish the connection between VM and cluster by --> gcloud container clusters get-credentials "cluster name" --zone "zone" --project "project-name"
           
           e- check the nodes exists on cluster 
              $ kubectl get no
              
-----------------------------------------------------------------------------------------------------------------
Helm ==> 1- install Helm -->

$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

$ chmod 700 get_helm.sh

$ ./get_helm.sh

2- Create Helm Chart For deploy Jenkins on the cluster 

            $ kubectl create namespace jenkins-ns
            $ helm create Jenkins
            $ cd Jenkins
            $ cd templates
            $ #put your deployment files
            $ heml install "your release name" Jenkins
----------------------------------------------------------------------------------------------------------------------------
5- Kubernetes ==> 

 $ kubectl get all
 
 get your svc external ip 
 
 $ kubectl exec -it "pod name" bash
 
 $ cat /var/jenkins_home/secrets/initialAdminPassword
 
 Now you are accessing your master jenkins
