class Api::V1::TenantsController < ApplicationController
  def index #GET
    tenants = TENANTS.map do |id, tenant| #Igual o map do java
      { tenant_id: id, municipio: tenant[:name] }
    end
    render json: tenants #Return como ResponseEntity.ok(tenants) do Spring Boot
  end
end
