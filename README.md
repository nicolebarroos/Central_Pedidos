# Central de Pedidos

## Objetivo 

Criar uma API REST simples usando Ruby on Rails, através dessa plataforma podemos receber pedidos de outros sistemas, agrupá-los em lotes e seguir os pedidos no pipeline de produção até a expedição.

Outros sistemas podem controlar quando um Pedido ou Lote está pronto para avançar para o próximo estágio usando alguns pontos finais para sinalizar o progresso no pipeline de produção.

### Tecnologias

* Ruby - 2.6
* Rails - 6.0
* PostgreSQL

### Ruby Gems

* Has scope
* Rails Admin
* Rspec
* Cancancan (Para futuras implementações de usuários)

### Implementações em andamento

* Validações customizadas
Permitir que um pedido seja designado a um determinado lote, apenas se este tiver o mesmo canal de compra e serviço de entrega.

* Conclusão dos testes automatizados

### Instalação

>git clone https://github.com/Nicolenewsoft/Central_Pedidos.git

>bundle install

>rails db:migrate

>rails s

### Links

* [Documentação](https://web.postman.co/collections/11755710-91affed9-75bb-40b6-aa9e-908de3b28de9?version=latest&workspace=71e5c54c-7aa9-4739-8bc3-c518376b6765)
