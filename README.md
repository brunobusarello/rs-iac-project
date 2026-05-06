# Topologia de Rede
Esta seção irá demonstrar a topologia de rede utilizada
## Endereços IP e seus atributos

Os enderaçamentos IPs ficaram configurados da seguinte forma:

| Endereço principal                 | 10.0.0.0/24  |
| ---------------------------------- | ------------ |
| Endereço público - Load Balancer A | 10.0.0.0/27  |
| Endereço público - Load Balancer B | 10.0.0.32/27 |
| Endereço privado - EC2 A           | 10.0.0.64/27 |
| Endereço privado - EC2 B           | 10.0.0.96/27 |

Para estas configurações foram utilizadas os seguintes recursos da AWS:
- aws_vpc -> para criar a VPC
- aws_subnet -> para criar as subnets
- aws_internet_gateway -> para criar um gateway externo
- aws_route_table -> para criar uma rota pública (com gateway) e uma rota privada
- aws_route_table_association -> para associar a rota pública as subnets públicas e a rota privada as subnets privadas

❓Por que não utilizar um módulo pronto de vpc para esse cenário básico? Configurar manualmente exige atenção em todas as partes e isso é ótimo. Certamente que quando eu utilizar um módulo pronto vou saber o que cada linha dele faz

## Estrutura dos arquivos

Para este cenário organizei os arquivos da seguinte forma:
- Cada um dos recursos da aws estão em um módulo separado
- Para os módulos de rede foi criado um módulo de network para centralizar a lógica de criação da rede nele
- No arquivo main somente é feita uma chamada do módulo network