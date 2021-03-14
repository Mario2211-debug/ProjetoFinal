require 'faker'

=begin
Admin.create(nome:'Mario Afonso', email:'marioafonso1997@gmail.com', password:'123456', password_confirmation:'123456')



a = User.create(nome:'Julio Watica', email:'Vitorinocanga@gmail.com',  B_I:'567687HUIUIUHIUHIE', kind:'Consumidor', password:'123456', password_confirmation:'123456')
a.endereco = Endereco.create(cidade:'Luanda', bairro:'Petrangol', destrito:'Sambizanga', rua:'Paz', numero:'115')
a.contacto = Contacto.create(tipo:'Pessoal', valor:'909998979898')


b = User.create(nome:'Paulo Agostinho', email:'PauloQuarta@gmail.com',  B_I:'ERTTRTRTREEEW567576', kind:'Consumidor', password:'123456', password_confirmation:'123456')
b.endereco = Endereco.create(cidade:'Luanda', bairro:'Nelito Soares', destrito:'Rangel', rua:'Do goa', numero:'87')
b.contacto = Contacto.create(tipo:'Pessoal', valor:'67878787872')


c = User.create(nome:'Braulio Miguel', email:'brauliomiguel@gmail.com', B_I:'GJHKM657689809DSCDC', kind:'Consumidor',  password:'123456', password_confirmation:'123456')
c.endereco = Endereco.create(cidade:'Luanda', bairro:'São Paulo', destrito:'Sambizanga', rua:'Americo boa vida', numero:'825')
c.contacto = Contacto.create(tipo:'Pessoal', valor:'762762762323')


d = User.create(nome:'Alexandre Pato', email:'alexandrepato@gmail.com',  B_I:'455667TRYTUYIUHGVBDJH', kind:'Consumidor', password:'123456', password_confirmation:'123456')
d.endereco = Endereco.create(cidade:'Luanda', bairro:'Cheguevara', destrito:'Cazenga', rua:'Cubanos', numero:'090')
d.contacto = Contacto.create(tipo:'Pessoal', valor:'5770679787868')


e = User.create(nome:'Ana Manuel', email:'anamanuelo@gmail.com',  B_I:'ABSKS6889SMSDNMSND', kind:'Consumidor', password:'123456', password_confirmation:'123456')
e.endereco = Endereco.create(cidade:'Luanda', bairro:'Luanda Sul', destrito:'Viana', rua:'Sangue de pomba', numero:'55')
e.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


f = User.create(nome:'Eudrice Silva', email:'eudricesilva@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
f.endereco = Endereco.create(cidade:'Luanda', bairro:'Centralidade', destrito:'Cacuaco', rua:'Mendonça de Sousa', numero:'35')
f.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


g = User.create(nome:'Petra Juliana', email:'petrajuliana@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
g.endereco = Endereco.create(cidade:'Luanda', bairro:'Bairro Azul', destrito:'Maianga', rua:'Mendonça de Sousa', numero:'35')
g.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


h = User.create(nome:'Josué Duda', email:'josueduda@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
h.endereco = Endereco.create(cidade:'Luanda', bairro:'Cruzeiro', destrito:'Ingombotas', rua:'Mendonça de Sousa', numero:'35')
h.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


i = User.create(nome:'Hugo da Costa', email:'hugorenato@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
i.endereco = Endereco.create(cidade:'Luanda', bairro:'Golf 2', destrito:'Kilamba_Kiaxi', rua:'Mendonça de Sousa', numero:'35')
i.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


j = User.create(nome:'Patrícia Pacheco', email:'patriciapacheco@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
j.endereco = Endereco.create(cidade:'Luanda', bairro:'Corimba',  destrito:'Samba', rua:'Mendonça de Sousa', numero:'35')
j.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


k = User.create(nome:'Irina Manuel', email:'irinamanuel@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
k.endereco = Endereco.create(cidade:'Luanda', bairro:'Maculusso', destrito:'Ingombotas', rua:'Mendonça de Sousa', numero:'35')
k.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


l = User.create(nome:'Julio Baptista', email:'adãobaptista@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
l.endereco = Endereco.create(cidade:'Luanda', bairro:'Calemba 2', destrito:'Kilamba_Kiaxi', rua:'Mendonça de Sousa', numero:'35')
l.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')


m = User.create(nome:'Vitor Albino', email:'VitorManuel@gmail.com',  B_I:'TRYUIUOIUYT56789', kind:'Consumidor', password:'123456', password_confirmation:'123456')
m.endereco = Endereco.create(cidade:'Luanda', bairro:'Camama', destrito:'Kilamba_Kiaxi', rua:'Mendonça de Sousa', numero:'35')
m.contacto = Contacto.create(tipo:'Pessoal', valor:'345678908765')



Atividade.create(nome: 'Culinária')
Atividade.create(nome: 'Tecnologia')
Atividade.create(nome: 'Mecânica de Automóveis')
Atividade.create(nome: 'Automóveis')
Atividade.create(nome: 'Mecânica de Maquinas Industriasi')
Atividade.create(nome: 'Telefonia')
Atividade.create(nome: 'Tv e Internet')
Atividade.create(nome: 'Tv')
Atividade.create(nome: 'Entrega Expressa')
Atividade.create(nome: 'Móveis e Decoração')
Atividade.create(nome: 'Jardinagem')
Atividade.create(nome: 'Reparaçãoe e Mnutenção de Frios')
Atividade.create(nome: 'Banco')
Atividade.create(nome: 'Imobiliária')
Atividade.create(nome: 'Vestuários')
Atividade.create(nome: 'Marketing')
Atividade.create(nome: 'Consultoria')
Atividade.create(nome: 'Seguros')
Atividade.create(nome: 'Rentacar')
Atividade.create(nome: 'Conforto e Lazer')
Atividade.create(nome: 'Serviços de Infromação')
Atividade.create(nome: 'Educação')
Atividade.create(nome: 'Saúde')
Atividade.create(nome: 'Construção')
Atividade.create(nome: 'Lazer')

Situacao.create(nome:'Resolvida', escopo:'Queixa')
Situacao.create(nome:'Não resolvida', escopo:'Queixa')

Situacao.create(nome:'Aprovada', escopo:'Solicitacção de perfil')
Situacao.create(nome:'Rescusada', escopo:'Solicitacção de perfil')
Situacao.create(nome:'Em Análise', escopo:'Solicitação de perfil')

Situacao.create(nome:'Aprovada', escopo:'Empresa')
Situacao.create(nome:'Rescusada', escopo:'Empresa')
Situacao.create(nome:'Em Análise', escopo:'Empresa')


 Sentimento.create(nome:'Furioso')
 Sentimento.create(nome:'Satisfeito')
 Sentimento.create(nome:'Calmo')


a = Empresa.create(atividade_id:'2', situacao_id:'1', nome:'Apple', email:'appleCanada33@gmail.com', nif:'56798IOFDERWR65FGER', responsavel:'Steve Jobs')
a.endereco = Endereco.create(cidade:'Canada', bairro:'Massangarala', rua:'Mendonça de Sousa', numero:'35')
a.contacto = Contacto.create(tipo:'Numerico', valor:'345678908765')

b = Empresa.create(atividade_id:'1', situacao_id:'1', nome:'Microsoft', email:'MicrosoftTokio33@gmail.com', nif:'HFY768FDERWR65FGER', responsavel:'Steve Jobs')
b.endereco = Endereco.create(cidade:'Tokio', bairro:'Massangarala', rua:'Mendonça de Sousa', numero:'35')
b.contacto = Contacto.create(tipo:'Numerico', valor:'345678908765')

c = Empresa.create(atividade_id:'5', situacao_id:'2', nome:'Facebook', email:'FacebookParis33@gmail.com', nif:'JHGYUYIURFDERWR65FGER', responsavel:'Steve Jobs')
c.endereco = Endereco.create(cidade:'Paris', bairro:'Massangarala', rua:'Mendonça de Sousa', numero:'35')
c.contacto = Contacto.create(tipo:'Numerico', valor:'345678908765')

d = Empresa.create(atividade_id:'3', situacao_id:'1', nome:'Huawei', email:'HuaweiLisboa@gmail.com', nif:'YTRE34345DERWR65FGER', responsavel:'Steve Jobs')
d.endereco = Endereco.create(cidade:'Lisboa', bairro:'Massangarala', rua:'Mendonça de Sousa', numero:'35')
d.contacto = Contacto.create(tipo:'Numerico', valor:'345678908765')

e = Empresa.create(atividade_id:'6', situacao_id:'1', nome:'Amazon', email:'HuaweiLisboa33@gmail.com', nif:'YTREW000BN65FGER', responsavel:'Steve Jobs')
e.endereco = Endereco.create(cidade:'Shangai', bairro:'Massangarala', rua:'Mendonça de Sousa', numero:'35')
e.contacto = Contacto.create(tipo:'Numerico', valor:'345678908765')


Queixa.create(user_id:'8', sentimento_id:'1', empresa_id:'2', assunto_id:'5', titulo:'Manutenção no automóvel', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'9', sentimento_id:'1', empresa_id:'2', assunto_id:'3', titulo:'compra de carro', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'10', sentimento_id:'1', empresa_id:'5', assunto_id:'1', titulo:'compra de casa', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'11', sentimento_id:'1', empresa_id:'1', assunto_id:'4', titulo:'servico de internet', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'12', sentimento_id:'1', empresa_id:'4', assunto_id:'2', titulo:'Serviço de entrega', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'13', sentimento_id:'1', empresa_id:'2', assunto_id:'2', titulo:'Reparação de telemóvel', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')

Addempresa.create(user_id:'7', situacao_id:'3', nome:'Xiaomi', email:'xiaomi@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'8', situacao_id:'3', nome:'Samsung', email:'Samsung@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'9', situacao_id:'3', nome:'Alibaba', email:'alibaba.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'11', situacao_id:'3', nome:'Gucci', email:'gucci@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'10', situacao_id:'3', nome:'Nike', email:'nike@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'10', situacao_id:'3', nome:'Adidas', email:'adidas@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'8', situacao_id:'3', nome:'Fila', email:'fila@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Addempresa.create(user_id:'12', situacao_id:'3', nome:'Toyota', email:'toyota@gmail.com',  observacao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')


  Assunto.create(nome:'Serviços de entrega')
  Assunto.create(nome:'Reparação de Telefone')
  Assunto.create(nome:'Inatalação de Internet')
  Assunto.create(nome:'Serviços de TV e Internet')
  Assunto.create(nome:'Decoração')
  Avaliacao.create(nome:'Ótimo')
  Avaliacao.create(nome:'Péssimo')
  Avaliacao.create(nome:'Normal')


 300.times do
 a = Empresa.create(
   atividade_id: rand(1..90),
   situacao_id: 6,
   nome: Faker::Company.name,
   email:Faker::Internet.free_email,
   nif: Faker::Company.ein,
   responsavel:Faker::Artist.name,
   created_at: Faker::Date.between(from: '2018-09-23', to: Date.today),
   updated_at: Faker::Date.between(from: '2018-10-23', to: Date.today)
  )

  a.endereco =  Endereco.create(
       cidade: Faker::Address.city,
       bairro: Faker::Address.street_name,
       rua: Faker::Address.street_address,
       numero: Faker::Address.building_number)

     a.contacto = Contacto.create(
       tipo:'Numerico',
       valor: Faker::Address.postcode)
  end



  500.times do
  a =  User.create(
      nome: Faker::TvShows::FamilyGuy.character,
      email: Faker::Internet.email,
      B_I: Faker::IDNumber.valid,
      password: "123456",
      password_confirmation: "123456",
      kind: %w[Consomidor Fornecedor].sample,
      created_at: Faker::Date.between(from: '2018-09-23', to: Date.today),
      updated_at: Faker::Date.between(from: '2018-10-23', to: Date.today)
  )

  a.endereco =  Endereco.create(
       cidade: Faker::Address.city,
       bairro: Faker::Address.street_name,
       rua: Faker::Address.street_address,
       numero: Faker::Address.building_number,

     )

     a.contacto = Contacto.create(
       tipo:'Numerico',
       valor: Faker::Address.postcode)
  end


  1500.times do
  Queixa.create(
     user_id: rand(1..500),
     sentimento_id: rand(1..3),
     situacao_id: rand(1..8),
     empresa_id: rand(1..300),
     assunto_id: rand(1..5),
     titulo:Faker::Movie.title,
     descricao: Faker::Lorem.paragraphs,
     created_at: Faker::Date.between(from: '2018-10-23', to: Date.today),
     updated_at: Faker::Date.between(from: '2018-10-27', to: Date.today)
   )
  end



  2000.times do
  Voto.create(
    empresa_id: rand(1..300),
       created_at: Faker::Date.between(from: '2018-10-23', to: Date.today),
     updated_at: Faker::Date.between(from: '2018-10-27', to: Date.today)
   )
  end
=end



Queixa.create(user_id:'8', sentimento_id:'1', empresa_id:'2', assunto_id:'5', titulo:'Manutenção no automóvel', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'9', sentimento_id:'3', empresa_id:'2', assunto_id:'3', titulo:'compra de carro', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', replica:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', mensagem:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'4', sentimento_id:'3', empresa_id:'2', assunto_id:'1', titulo:'compra de casa', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', replica:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', mensagem:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'11', sentimento_id:'3', empresa_id:'2', assunto_id:'4', titulo:'servico de internet', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', replica:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', mensagem:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'12', sentimento_id:'3', empresa_id:'2', assunto_id:'2', titulo:'Serviço de entrega', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', replica:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh', mensagem:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
Queixa.create(user_id:'6', sentimento_id:'1', empresa_id:'2', assunto_id:'2', titulo:'Reparação de telemóvel', descricao:'wersdtuilçouyktrhtjdkboowohowqiwdqhohoiolihoihoiqhdoiwhoqihowihoqhwoqhowhdqowihdoqiwhdoqhwdoiqhwoiqhwoh')
