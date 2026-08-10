class TenantRecord < ApplicationRecord # < No rails é como extends do Java
  self.abstract_class = true #Deixa a classe abstrada

  #connects_to é o método, aqui n precisa de parentes
  #shards é um parametro como se fosse um @requestParam
  connects_to shards: TENANTS.to_h {
                |tenant_id, tenant_data|
                [tenant_data[:shard], { writing: tenant_data[:database_config] }]
              }
  #o to_h faz um hash de tudo vai ficar mais ou menos assim
  # 01 => { shard: :pato_branco, database_config: { adapter: "postgresql", host: "localhost", ... } },
  # 02 => { shard: :joacaba,     database_config: { adapter: "postgresql", host: "10.0.5.2", ... } }
end
