# Ministério da Saúde API

API Rails que simula uma arquitetura **multitenant** utilizando sharding do PostgreSQL. Cada tenant representa um município diferente, com seu próprio banco de dados isolado.

## Multitenant / Sharding

Os tenants são definidos na constante `TENANTS`, mapeando cada município a um shard e sua respectiva configuração de banco. A classe `TenantRecord` utiliza o método `connects_to` do Rails para distribuir as conexões conforme o tenant da requisição.

O controller de procedimentos (`ProcedimentosController`) valida o `tenant_id` enviado na URL e direciona as queries para o shard correspondente:

```ruby
TenantRecord.connected_to(shard: shard) do
  Procedimento.where(...)
end
```

### Estrutura de tenants

```ruby
TENANTS = {
  1 => { name: "Município A", shard: :municipio_a, database_config: { ... } },
  2 => { name: "Município B", shard: :municipio_b, database_config: { ... } }
}
```

## Pré-requisitos

* Ruby 3.3+
* Rails 8.1+
* PostgreSQL

## Configuração

1. Clone o repositório
2. Execute `bundle install`
3. Configure os bancos de dados dos tenants em `config/database.yml`
4. Execute `rails db:setup`

## Executando

```bash
rails server
```

### Endpoints

| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/api/v1/tenants` | Lista todos os tenants disponíveis |
| GET | `/api/v1/tenants/:tenant_id/procedimentos` | Lista procedimentos de um tenant |
| POST | `/api/v1/tenants/:tenant_id/procedimentos` | Cria um procedimento para um tenant |
| PUT | `/api/v1/tenants/:tenant_id/procedimentos/:id` | Atualiza um procedimento |
| DELETE | `/api/v1/tenants/:tenant_id/procedimentos/:id` | Remove um procedimento |
