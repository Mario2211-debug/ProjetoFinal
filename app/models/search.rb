class Search < ApplicationRecord
  self.inheritance_column = "not_sti"



def search_queixa
    queixa = Queixa.all
    queixa = queixa.where(['lower(descricao) LIKE ? OR lower(titulo) LIKE ? OR lower(empresa_nome) LIKE ? OR lower(assunto_nome) LIKE ? OR lower(sentimento_nome) LIKE ?', descricao, descricao, descricao, descricao, descricao]) if descricao.present?
    #queixa = queixa.where(['empresa_nome LIKE ?', descricao]) if descricao.present?
  #  queixa = queixa.where(['assunto_id LIKE ?', assunto]) if assunto.present?
  #  queixa = queixa.where(['lower(titulo) LIKE ?', titulo]) if titulo.present?
    return queixa
end


end
