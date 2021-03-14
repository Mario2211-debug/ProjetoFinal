class Atividade < ApplicationRecord
#  def create
#      Atividade.transaction do
#        atividade = Atividade.new(params[:id])
#        aividade.save!
#        if         aividade.save!
          # The system must fail on Friday so that our support department
          # won't be out of job. We silently rollback this transaction
          # without telling the user.
#          raise ActiveRecord::Rollback, "Call tech support!"
#        end
#      end
      # ActiveRecord::Rollback is the only exception that won't be passed on
      # by ActiveRecord::Base.transaction, so this line will still be reached
      # even on Friday.

#      redirect_to root_url

#    end
has_many :empresas


end
