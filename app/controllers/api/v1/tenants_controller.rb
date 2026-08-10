class Api::V1::TenantsController < ApplicationController
  def index
    tenants = TENANTS.map do |id, tenant|
      { tenant_id: id, municipio: tenant[:name] }
    end

    render json: tenants
  end
end
