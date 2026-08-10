class Api::V1::ProcedimentosController < ApplicationController
  before_action :validate_tenant! #Tipo um before each do JUnit

  def index
    limit = (params[:limit] || 10).to_i
    offset = (params[:offset] || 0).to_i
    start_date, end_date = parse_competencia(params[:competencia])     #Transforma a competencia em Date.new (1, 1, 2023) e Date.new (31, 12, 2023)
    shard = @tenant[:shard] #Tenant foi setado pelo validate_tenant!

    procedimentos = TenantRecord.connected_to(shard: shard) do #connect_to = troca o bacno para o shard do tenant
      Procedimento
        .where(data_realizacao: start_date..end_date) #.. é o range em ruby
        .limit(limit)
        .offset(offset)
        .order(:data_realizacao)
    end
    render json: procedimentos #Equivalente a um return ResponseEntity.ok(procedimentos) do Spring Boot
  rescue ArgumentError => e #Resue é tipo um try catch, caso ocorra algum erro, ele vai para o rescue e retorna o erro
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def parse_competencia(comp)
    raise ArgumentError, "competencia deve ter formato YYYYMM" unless comp&.match?(/\A\d{6}\z/)
    year = comp[0..3].to_i
    month = comp[4..5].to_i
    start_date = Date.new(year, month, 1)
    end_date = start_date.end_of_month
    [start_date, end_date]
  end

  def validate_tenant!
    tenant_id = params[:tenant_id].to_i
    @tenant = TENANTS[tenant_id] #acessa o hash pela chave
    render json: { error: "Tenant não encontrado" }, status: :not_found unless @tenant
  end
end
