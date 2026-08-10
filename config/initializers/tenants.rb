TENANTS = {
  01 => {
    id: "01",
    name: "Pato Branco",
    shard: :pato_branco,
    isConsorcio: false,
    database_config: {
      adapter: "postgresql",
      host: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_HOST_01") { "localhost" },
      port: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_PORT_01") { 5432 },
      username: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_USERNAME_01") { "postgres" },
      password: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_PASSWORD_01") { "karen0407" },
      database: "pato_branco_development",
    },
  },
  02 => {
    id: "02",
    name: "Joacaba",
    shard: :joacaba,
    isConsorcio: false,
    database_config: {
      adapter: "postgresql",
      host: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_HOST_02") { "localhost" },
      port: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_PORT_02") { 5432 },
      username: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_USERNAME_02") { "postgres" },
      password: ENV.fetch("MINISTERIO_SAUDE_API_DATABASE_PASSWORD_02") { "karen0407" },
      database: "joacaba_development",
    },
  },
}.freeze
