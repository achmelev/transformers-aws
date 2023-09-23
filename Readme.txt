###Basics
- Wir nutzen Terraform zur Anlage der Training VMs
- Zwei Konfigurationen für folgende Instanztypen:
    - c5.large - nur CPU zum Testen der Modelle etc
    - g5.large - VM mit einem GPU fürs "richtige" Training

####Befehle

terraform apply -var-file="<var_file>" - Eine VM mit einer durch <var_file> vorgegebenen Instanz anlegen
terraform destroy -var-file="<var_file>" - Eine VM mit einer durch <var_file> vorgegebenen Instanz anlegen

<var_file>'s:
  cpu.tfvars - EIne c5.large-Instanz mit anschließender Installation von Python, pythorch etc.
  gpu.tfvars - EIne g5.large-Instanz mit anschließender Installation von CUDA, Python, pythorch etc.
  ami.tfvars - EIne VM mit den in der Datei zu konfigurierenden Typ und AMI, ohne Installation. Gedacht für Tests und eigene AMIs 


Am Ende der Anlageskripte wird der Hostname der angelegten Instanz ausgegeben.
Die DNS nutzt man mit dem SSH um sich zur Instanz zu verbinden:

ssh -i Transformers.pem ubuntu@<hostname>
