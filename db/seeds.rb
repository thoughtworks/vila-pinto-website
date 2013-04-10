# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if not AdminUser.exists?
  first_user_email = ENV['FIRST_USER_EMAIL'] || 'admin@example.com'
  first_user_password = ENV['FIRST_USER_PASSWORD'] || 'password'
  AdminUser.create!(:email => first_user_email, :password => first_user_password, :password_confirmation => first_user_password)
end

CTVP_PARTNERS = [{:name => "Moinhos Shopping", :url => "http://www.moinhosshopping.com.br/", :image => "moinhosshopping.png"},
                 {:name => "Colégio Bom Conselho", :url => "http://www.bomconselho.com.br/", :image => "cbc.png"},
                 {:name => "Banrisul", :url => "http://www.banrisul.com.br/", :image => "banrisul.png"},
                 {:name => "Sheraton Hotels & Resorts", :url => "http://www.starwoodhotels.com/sheraton/index.html", :image => "sheraton.png"},
                 {:name => "CEEE", :url => "http://www.ceee.com.br/", :image => "ceee.png"},
                 {:name => "Rede de Bancos de Alimentos do Rio Grande Sul", :url => "http://www.bancodealimentos.org.br/", :image => "bancodealimentos.png"},
                 {:name => "DMLU", :url => "http://www2.portoalegre.rs.gov.br/dmlu/", :image => "dmlu.png"},
                 {:name => "EPR Consultoria", :url => "http://www.eprconsultoria.com.br/", :image => "epr.png"},
                 {:name => "Viação Estoril", :url => nil, :image => "estoril.png"},
                 {:name => "FUNDACENTRO", :url => "http://www.fundacentro.gov.br/", :image => "fundacentro.png"},
                 {:name => "Instituto Lojas Renner", :url => "http://www.institutolojasrenner.org.br/", :image => "ir.png"},
                 {:name => "LOMANDO,AITA", :url => "http://www.lomandoaita.com.br/", :image => "lomando.png"},
                 {:name => "Mesa Brasil SESC", :url => "https://www.sesc-rs.com.br/mesabrasil/", :image => "mesabrasil.png"},
                 {:name => "NET IMPACT", :url => "http://netimpactpoa.org/", :image => "netimpact.png"},
                 {:name => "Parceiros Voluntários", :url => "http://www.parceirosvoluntarios.org.br/", :image => "parceirosvoluntarios.png"},
                 {:name => "Prefeitura de Porto Alegre", :url => "http://www2.portoalegre.rs.gov.br/portal_pmpa_novo/", :image => "prefeiturapoa.png"},
                 {:name => "PRO JUST Advogados", :url => "http://www.projust.adv.br/", :image => "projust.png"},
                 {:name => "Receita Federal", :url => "http://www.receita.fazenda.gov.br/", :image => "receitafederal.png"},
                 {:name => "Renner", :url => "http://www.lojasrenner.com.br/", :image => "renner.png"},
                 {:name => "SESC Rio Grande do Sul", :url => "https://www.sesc-rs.com.br/", :image => "sec.png"},
                 {:name => "Tribunal Regional Eleitoral Rio Grande do Sul", :url => "http://www.tre-rs.gov.br/", :image => "tre.png"},
                 {:name => "UFRGS", :url => "http://www.ufrgs.br/", :image => "ufrgs.png"},
                 {:name => "Armazém Ventura", :url => "", :image => "ventura.png"}]

CEJAK_PARTNERS = [{:name => "Fundação de Assistência Social e Cidadania", :url => "http://www.portoalegre.rs.gov.br/fasc", :image => "logofasc.jpeg"},
                  {:name => "De Lage Landen - Partners in Finance", :url => "http://www.delagelanden.com/", :image => "logodelagelanden.png"},
                  {:name => "Ponto de Leitura", :url => "", :image => "logopontodeleitura.png"},
                  {:name => "Banco de Alimentos", :url => "http://www.bancodealimentos.org.br/", :image => "logobancodealimentos.png"},
                  {:name => "Mesa Brasil", :url => "http://www.sesc.com.br/mesabrasil/", :image => "logomesabrasil.png"},
                  {:name => "Fome Zero", :url => "http://www.fomezero.gov.br/", :image => "logofomezero.png"},
                  {:name => "Instituto Nestor de Paula", :url => "http://inestordepaula.org.br/site/", :image => "logonestor.jpg"},
                  {:name => "Governo Rio Grande do Sul", :url => "http://www.rs.gov.br/", :image => "logogovernorsul.png"},
                  {:name => "Renner", :url => "http://lojavirtual.lojasrenner.com.br/", :image => "logorenner.png"},
                  {:name => "Gerdau", :url => "http://www.gerdau.com.br/", :image => "logogerdau.png"},
                  {:name => "Fundação de Assitência Social e Cidadania", :url => "", :image => "mauricio_sirotsky.jpg"},
                  {:name => "Ministério do Desenvolvimento", :url => "www.mds.gov.br/bolsafamilia ", :image => "dev_social_combate_fome.jpeg"},
                  {:name => "FIERGS SESI", :url => "http://www.fiergs.org.br/", :image => "logofiergssesi.png"},
                  {:name => "Educandário São Luis - Vila Jardim", :url => "", :image => ""},
                  {:name => "Associação de Moradores Vila Nova Tijuca", :url => "", :image => ""},
                  {:name => "Associação de Moradores do Ipê I", :url => "", :image => ""},
                  {:name => "CRAS Noroeste", :url => "", :image => ""},
                  {:name => "CRAS Norte", :url => "", :image => ""},
                  {:name => "CRAS Santa Rosa", :url => "", :image => ""}
                 ]

VOVO_BELINHA_PARTNERS = [{:name => "Prefeitura de Porto Alegre", :url => "http://www2.portoalegre.rs.gov.br/portal_pmpa_novo/", :image => "prefeiturapoa.png"},
                         {:name => "Renner", :url => "http://www.lojasrenner.com.br/", :image => "renner.png"}]

CEA_PARTNERS = [{:name => "Gerdau", :url => "http://wwww.gerdau.com.br", :image => "gerdau.png"},
                {:name => "Renner", :url => "http://www.lojasrenner.com.br/", :image => "renner.png"},
                {:name => "Vonpar SA", :url => "http://www.vonpar.com.br/corporativo/", :image => "vonpar.png"},
                {:name => "Sulgás", :url => "http://www.sulgas.rs.gov.br/", :image => "sulgas.png"},
                {:name => "Agiplan Financeira S.A.", :url => "http://ww2.agiplan.com.br/site/home/index.php", :image => "agiplan.png"}]

CEJAK_COMMUNITY_PROJECTS = [{:name => "Laboratório de Informática", :url => "laboratorio_de_informatica"},
                            {:name => "Cozinha Comunitária", :url => "cozinha_comunitaria"},
                            {:name => "SAF - Serviço de Atendimento Familiar", :url => "saf"},
                            {:name => "Biblioteca", :url => "biblioteca"},
                            {:name => "Programa Idoso", :url => "programa_idoso"}]

CEJAK_CHILDREN_AND_TEENAGERS_PROJECTS = [    {:name => "Programa SCFE", :url => "scfe"},
                                             {:name => "Projeto Novos Horizontes", :url => "novos_horizontes"},
                                             {:name => "Projovem Adolescente - Região Leste", :url => "projovem_leste"},
                                             {:name => "Projovem Adolescente - Região Norte", :url => "projovem_norte"},
                                             {:name => "Programa Trabalho Educativo", :url => "trabalho_educativo"},
                                             {:name => "Projeto Novo Despertar", :url => "novo_despertar"},
                                             {:name => "Projeto Jiu-Jitsu", :url => "jiu_jitsu"},
                                             {:name => "Projeto Tocando Sonhos", :url => "tocando_sonhos"}]


CTVP_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_CTVP
  if not partner[:image].blank?
    image = File.open(Rails.root.join('app','assets','images','ctvp','sprite',partner[:image]))
  else
    image = nil
  end
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_CTVP, :image => image
end

CEJAK_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_CEJAK
  if not partner[:image].blank?
    image = File.open(Rails.root.join('app','assets','images','cejak','sprite',partner[:image]))
  else
    image = nil
  end
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_CEJAK, :image => image
end

VOVO_BELINHA_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_VOVO_BELINHA
  if not partner[:image].blank?
    image = File.open(Rails.root.join('app','assets','images','ctvp','sprite',partner[:image]))
  else
    image = nil
  end
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_VOVO_BELINHA, :image => image
end

CEA_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_CEA
  if not partner[:image].blank?
    image = File.open(Rails.root.join('app','assets','images','cea','sprite',partner[:image]))
  else
    image = nil
  end
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_CEA, :image => image
end

id = 0

CEJAK_COMMUNITY_PROJECTS.each do |project|
  id = id + 1
  Project.create  :id => id, :description => "desc", :name => project[:name], :visible => true,
                  :url => project[:url], :category => Project::CATEGORY_COMMUNITY
end

CEJAK_CHILDREN_AND_TEENAGERS_PROJECTS.each do |project|
  id = id + 1
  Project.create  :id => id, :description => "desc", :name => project[:name], :visible => true,
                  :url => project[:url], :category => Project::CATEGORY_CHILDREN_AND_TEENAGERS
end
