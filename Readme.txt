###Basics
- Wir nutzen Terraform zur Anlage der Training VMs
- Zwei Konfigurationen für folgende Instanztypen:
    - t2.medium - nur CPU zum Testen der Modelle etc
    - g5.xlarge - Instanz mit einem GPU fürs "richtige" Training




####Befehle

terraform apply -var-file="cpu.tfvars" - CPU instanz anlegen
    Die Instanz wird angelegt und anschließend der Skript cpu_install.sh ausgeführt
terraform apply -var-file="gpu.tfvars" - GPU instanz anlegen
    Die Instanz wird angelegt und anschließend der Skript gpu_install.sh ausgeführt
terraform destroy -var-file="gpu.tfvars" - Enfernt die GPU Instanz inkl. des Volume
terraform destroy -var-file="cpu.tfvars" - Enfernt die CPU Instanz inkl. des Volume

Am Ende der Anlageskripte wird der Hostname der angelegten Instanz ausgegeben.
Die DNS nutzt man mit dem SSH um sich zur Instanz zu verbinden:

ssh -i Transformers.pem admin@<hostname>
