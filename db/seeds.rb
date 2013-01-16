# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

VOVO_BELINHA_PARTNERS = [{:name => "Prefeitura de Porto Alegre", :url => "http://www2.portoalegre.rs.gov.br/portal_pmpa_novo/", :image => "prefeiturapoa.png"},
                         {:name => "Renner", :url => "http://www.lojasrenner.com.br/", :image => "renner.png"}]

CEA_PARTNERS = [{:name => "Gerdau", :url => "http://wwww.gerdau.com.br", :image => "gerdau.jpg"},
                {:name => "Renner", :url => "http://www.lojasrenner.com.br/", :image => "renner.png"},
                {:name => "Vonpar SA", :url => "http://www.vonpar.com.br/corporativo/", :image => "vonpar.jpg"},
                {:name => "Sulgás", :url => "http://www.sulgas.rs.gov.br/", :image => "sulgas.jpeg"},
                {:name => "Agiplan Financeira S.A.", :url => "http://ww2.agiplan.com.br/site/home/index.php", :image => "agiplan.jpg"}]


CTVP_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_CTVP
  image = File.open(Rails.root.join('app','assets','images','ctvp','sprite',partner[:image]))
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_CTVP, :image => image
end

VOVO_BELINHA_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_VOVO_BELINHA
  image = File.open(Rails.root.join('app','assets','images','ctvp','sprite',partner[:image]))
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_VOVO_BELINHA, :image => image
end

CEA_PARTNERS.each do |partner|
  next if Partner.exists? :image => partner[:image], :type => Partner::TYPE_CEA
  image = File.open(Rails.root.join('app','assets','images','cea','sprite',partner[:image]))
  Partner.create :name => partner[:name], :url => partner[:url], :type => Partner::TYPE_CEA, :image => image
end
