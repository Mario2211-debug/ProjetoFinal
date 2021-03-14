class Addempresa < ApplicationRecord
  belongs_to :situacao, optional: true
belongs_to :empresa, optional: true
belongs_to :user, optional: true

end
