# == Schema Information
#
# Table name: procedimentos
# Database name: primary
#
#  id               :bigint           not null, primary key
#  data_agendamento :date
#  data_realizacao  :date
#  exame            :string
#  paciente         :string
#  quantidade       :integer
#  status           :string
#  valor            :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Procedimento < TenantRecord
  self.table_name = "procedimentos"
end
