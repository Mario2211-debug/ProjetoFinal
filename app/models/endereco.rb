class Endereco < ApplicationRecord
  enum cidade: [:Luanda]
  enum destrito: [
    :Sambizanga,
     :Rangel,
     :Ingombotas,
     :Cacuaco,
     :Viana,
     :Cazenga,
     :Samba,
     :Maianga,
     :Kilamba_Kiaxi,
     :Icolo_e_Bengo
   ]


end
