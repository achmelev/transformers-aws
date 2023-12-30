###Basics
- Wir nutzen Terraform zur Anlage der Training VMs

####Befehle

terraform apply -var-file="<var_file>" - Eine VM mit einer durch <var_file> vorgegebenen Instanz anlegen
terraform destroy -var-file="<var_file>" - Eine VM mit einer durch <var_file> vorgegebenen Instanz anlegen

<var_file>'s:
  c5.tfvars - EIne c5.large-Instanz mit anschließender Installation von Python, pythorch etc.
  m5.tfvars - EIne m5.large-Instanz mit anschließender Installation von Python, pythorch etc.
  gpu.tfvars - EIne g5.xlarge-Instanz mit anschließender Installation von CUDA, Python, pythorch etc.
  g4dn.tfvars - EIne g4dn.xlarge-Instanz mit anschließender Installation von CUDA, Python, pythorch etc.
  ami.tfvars - EIne VM mit den in der Datei zu konfigurierenden Typ und AMI, ohne Installation. Gedacht für Tests und eigene AMIs 


Am Ende der Anlageskripte wird der Hostname der angelegten Instanz ausgegeben.
Die DNS nutzt man mit dem SSH um sich zur Instanz zu verbinden:

ssh -i Transformers.pem ubuntu@<hostname>
