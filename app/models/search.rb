class Search < ApplicationRecord
  self.inheritance_column = "not_sti"



def search_queixa
    queixa = Queixa.all
    queixa = queixa.where(['lower(descricao) LIKE ? OR lower(titulo) LIKE ?', descricao, descricao]) if descricao.present?
    queixa = queixa.where(['empresa_id LIKE ?', empresa]) if empresa.present?
    queixa = queixa.where(['assunto_id LIKE ?', assunto]) if assunto.present?
  #  queixa = queixa.where(['lower(titulo) LIKE ?', titulo]) if titulo.present?
    return queixa
end


end
