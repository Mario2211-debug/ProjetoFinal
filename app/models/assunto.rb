class Assunto < ApplicationRecord
belongs_to :empresa, dependent: :destroy
belongs_to :atividade, dependent: :destroy
end
