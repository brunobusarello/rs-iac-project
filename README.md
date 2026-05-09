# Projeto de IAC (Infrastructure as Code)
Este repositório visa armazenar o projeto de IAC da formação de devops da RocketSeat

## Desafio
Estruturar um projeto terraform para construir uma instância de EC2 básica na AWS, sendo necessário configurar um balanceador de carga e uma estrutura de rede para o correto funcionamento.

## Finalidade do README
Este README visa mostrar o que foi desenvolvido para atender essa demanda, explorando as particularidades do projeto

---
# Estrutura do Projeto
Este projeto do terraform foi estruturado em módulos na seguinte estrutura:

Módulos:
```
rs-iac-project
|-- modules
|   |-- ec2
|   |-- loadbalancer
|   |-- network
|   |-- security
|-- main.tf
```
Nesta estrutura foram separados as maiores grandezas (VPC, EC2, LoadBalancer e Security) e após isso este módulos são chamados no `main.tf`

---
# Topologia de Rede
Esta seção irá demonstrar a topologia de rede utilizada.
Uma VPC com a rede 10.0.0.0/24 foi criada para este projeto, sendo projetado subredes /27 para conter até 8 redes distintas com 30 IPs válidos cada uma
## Endereços IP e seus atributos
Os enderaçamentos IPs ficaram configurados da seguinte forma:

| Endereço principal | 10.0.0.0/24  |
| ------------------ | ------------ |
| Endereço público   | 10.0.0.0/27  |
| Endereço público   | 10.0.0.32/27 |
## Características da arquitetura da rede

- As duas subredes possuem um gateway de acesso a internet
- Essas subredes são utilizadas para duas instâncias de EC2 e para o LoadBalancer

Para estas configurações foram utilizadas os seguintes recursos da AWS:
- aws_vpc -> para criar a VPC
- aws_subnet -> para criar as subnets
- aws_internet_gateway -> para criar um gateway externo
- aws_route_table -> para criar uma rota pública (com gateway) e uma rota privada
- aws_route_table_association -> para associar a rota pública as subnets públicas e a rota privada as subnets privadas

❓Por que não utilizar um módulo pronto de vpc para esse cenário básico? Configurar manualmente exige atenção em todas as partes e isso é ótimo. Certamente que quando eu utilizar um módulo pronto vou saber o que cada linha dele faz

---

# Security

Para previnir ataques indesejados a aplicação um módulo de segurança foi criado. Nele as seguintes configurações foram aplicadas:
- Qualquer pessoa na internet poderá, pela porta 80, acessar a porta 80 do **Loadbalancer**
- Saída do Loadbalancer e EC2 totalmente liberada
- Na EC2 a porta 80 pode ser acessada somente pelo Loadbalancer
- Qualquer ip pode acessar a porta 22 do loadbalancer

# Próximos passos

Este foi um "MVP" do projeto, atendendo a principal demanda

> Implementar uma arquitetura básica de EC2, VPC e Loadbalancer

Os próximos passos deste projeto seriam:

- [ ] Abstrair mais o módulo de EC2
- [ ] Abstrair mais o módulo de loadbalancer
- [ ] Abstrair mais o módulo de security
- [ ] Isolar as instâncias de EC2 em redes privadas. Configurar um natgateway para as subnets
- [ ] 

