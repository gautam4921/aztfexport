# aztfexport
Azure Terrafy – Import your existing Azure infrastructure into Terraform HCL
Azure Terrafy allows you to easily and quickly import your existing Azure infrastructure into Terraform HCL AND import it into your Terraform state (Learn about state files
Create a new directory in which to generate the Terraform code into
To start using the aztfy tool, we need to install it locally.
https://github.com/azure/aztfexport/releases   installer URL choose latest 
Suggestion : Rather Installing it extract it in a folder and put the installer in the folder 
I Have faced so weired things ....which is given below 

D:\aztfexport>aztfexport resource-group az-eastus
'aztfexport' is not recognized as an internal or external command,
operable program or batch file.

D:\aztfexport>aztfexport -v
'aztfexport' is not recognized as an internal or external command,
operable program or batch file.

D:\aztfexport>ls
'ls' is not recognized as an internal or external command,
operable program or batch file.

D:\aztfexport>dir
 Volume in drive D is New Volume
 Volume Serial Number is AA2E-0900

 Directory of D:\aztfexport

23-02-2024  23:08    <DIR>          .
23-02-2024  23:08    <DIR>          ..
               0 File(s)              0 bytes
               2 Dir(s)  247,395,266,560 bytes free

               
After that i put the installer in D drive and put it in folder D:\aztfexport
After above steps put below command to check the version and working 

D:\aztfexport>aztfexport -v
aztfexport version v0.14.0(fb772ba)

Once installed, run the aztfy command and specify the Azure resource group that you want to import 

D:\aztfexport>aztfexport resource-group az-eastus

The output directory is not empty. Please choose one of actions below:

* Press "Y" to overwrite the existing directory with new files
* Press "N" to append new files and add to the existing state instead
* Press other keys to quit

> N

D:\aztfexport>terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Using previously-installed hashicorp/azurerm v3.77.0

Aztfy will now begin the import process:
It will show you the importing resources as it run, along with a progress bar:

<img width="400" alt="aztfexport01" src="https://github.com/gautam4921/aztfexport/assets/45917285/393894c7-21d6-436f-ab22-01cb85967e6d">


Press w to run the export.

Verify the results

After the tool has finished exporting your Azure resources, run the following commands in the same directory that contains the generated files.

 Run terraform init.
 terraform init --upgrade
 Run terraform plan.
 terraform plan

If the terminal outputs No changes needed, then congratulations!
Microsoft Article : https://learn.microsoft.com/en-us/azure/developer/terraform/azure-export-for-terraform/export-first-resources?tabs=azure-cli
<img width="963" alt="aztfexport02" src="https://github.com/gautam4921/aztfexport/assets/45917285/b998e777-98d9-4816-b5ea-af87d1f6d6ce">


