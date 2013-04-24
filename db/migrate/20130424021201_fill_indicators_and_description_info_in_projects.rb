# encoding: utf-8
class FillIndicatorsAndDescriptionInfoInProjects < ActiveRecord::Migration
  def up

    cejak_community_projects = [
      {:name => "Laboratório de Informática", :url => "laboratorio_de_informatica", 
        :description => "<p>Dispõe de computadores com acesso a internet disponibilizados para a comunidade em geral, sendo uma ferramenta para a construção de novos conhecimentos e oportunidades de inclusão social.</p>"},
      {:name => "Cozinha Comunitária", :url => "cozinha_comunitaria", :meals_quantity_value => 145, :meals_quantity_unit => :day, :show_meals_quantity => true,
        :description => "<p>A cozinha comunitária oferece refeições diárias, aos funcionários do CEJAK, do CTVP (Centro de Triagem) e às crianças vinculadas ao SCFE, visando atender as necessidades de paladar e qualidade com baixo custo. As refeições são baseadas nos cardápios e laborados pela nutricionista, visando produzir uma alimentação adequada, equilibrada e segura.</p>"},
      {:name => "SAF - Serviço de Atendimento Familiar", :url => "saf", :attendance_goal_value => "5 turnos de acolhimento semanais", :show_attendance_goal => true,
        :description => "<p>O SAF  tem como objetivo o acolhimento e acompanhamento de famílias usuárias dos  serviços de Proteção Social Básica (PREVENÇÃO). A prioridade do Serviço é o atendimento aos beneficiários dos Programas de distribuição de renda vinculados ao Ministério do Desenvolvimento Social e Combate à Fome, dentre os serviços oferecidos estão:</p>
                <ul>
                  <li>Avaliação para ingresso em Serviço de Convivência e Fortalecimento de Vínculos (SCFE);</li>
                  <li> Acompanhamento de Famílias em situação de descumprimento de condicionalidades dos Programas de distribuição de renda visando a redução das vulnerabilidades sociais.</li>
                </ul>" },
      {:name => "Biblioteca", :url => "biblioteca", 
        :description => "<p>O objetivo principal é o de desenvolver o hábito da leitura, despertar e estimular o interesse pela contação de histórias e estender a comunidade local o acesso ao acervo da biblioteca.</p>
          <br /><p>Em dezembro de 2008 o CEJAK foi premiado no concurso nacional “Ludicidade” e reconhecido pelo Ministério da Cultura como Pontinho de Cultura devido a sua atuação nas áreas sócio-cultural-artístico-educacionais, no segmento da Criança e Adolescente.</p>
          <br /><p>Em dezembro de 2008 o Cejak também recebeu do Ministério da Cultura o Prêmio Nacional “Centenário Machado de Assis” o que transformou nossa Biblioteca em Ponto de Leitura.</p>"},
      {:name => "Programa Idoso", :url => "programa_idoso", 
        :attendance_goal_value => "25 idosos", :show_attendance_goal => true, 
        :meals_quantity_value => 1, :meals_quantity_unit => :day, :show_meals_quantity => true,
        :description => "<p>O programa tem como objetivo oferecer um espaço de convivência acolhedor que propicie o desenvolvimento de atividades de resgate da auto-estima, de potencialidades, de interações e promovedor de qualidade de vida.</p>"}
    ]


    cejak_children_and_teenagers_projects = [    
      {:name => "Programa SCFE", :url => "scfe",
        :attendance_goal_value => "92 crianças e adolescentes", :show_attendance_goal => true, 
        :meals_quantity_value => 2, :meals_quantity_unit => :day, :show_meals_quantity => true,
        :attendance_day_monday => true,:attendance_day_tuesday => true,:attendance_day_wednesday => true,:attendance_day_thursday => true, :attendance_day_friday => true, :show_attendance_days => true,
        :description => "<p>Atende crianças e adolescentes (06 a 15 anos) no turno inverso ao da escola. O serviço garante proteção social para crianças vulneráveis econômica e socialmente oferecendo alimentação, oficinas culturais, esportivas e atividades lúdicas para estimular o desenvolvimento afetivo social.</p>"},
      {:name => "Projeto Novos Horizontes", :url => "novos_horizontes",
        :description => "<p>O projeto Novos Horizontes tem como objetivo complementar as atividades do programa SCFE. Este projeto conta com a atuação de uma equipe multidisciplinar que visa o desenvolvimento integral, seja pelo caráter cognitivo, psicológico ou social, pensando na evolução destas crianças e adolescentes, para que se tornem cidadãos inseridos dentro de uma sociedade mais justa e homogênea.</p>"},
      {:name => "Projovem Adolescente - Região Leste", :url => "projovem_leste",
        :attendance_goal_value => "11 coletivos, com meta de 275 atendimentos", :show_attendance_goal => true, 
        :attendance_day_monday => true,:attendance_day_tuesday => true,:attendance_day_wednesday => true,:attendance_day_thursday => true, :attendance_day_friday => true, :show_attendance_days => true,
        :description => "<p>O programa tem como objetivo atender adolescentes na faixa etária de 15 à 18 anos incompletos. Os adolescentes participam de oficinas de esporte, cultura e lazer.</p>
          <p>O atendimento ocorre de forma descentralizada, ou seja, tem como objetivo contemplar todo o território da Região Leste. O objetivo é levar este programa para os locais onde haja demanda e priorizando as comunidades que possuem maior vazio de atendimento, oferecendo  as famílias usuárias dos serviços da assistência a garantia de  direito a um espaço de proteção e formação para seus filhos adolescentes.</p>
          <p>O Projovem Adolescente conta com alguns dirigentes que cedem espaço para a realização das atividades tendo como a única e tão importante contra partida o atendimento aos jovens de sua comunidade.</p>
          <br />
          <a href='http://projovempoaleste.blogspot.com.br/'>Visite nosso blog</a>"},
      {:name => "Projovem Adolescente - Região Norte", :url => "projovem_norte",
        :attendance_goal_value => "6 coletivos, com meta de 275 atendimentos", :show_attendance_goal => true, 
        :meals_quantity_value => 1, :meals_quantity_unit => :day, :show_meals_quantity => true,
        :attendance_day_monday => true,:attendance_day_tuesday => true,:attendance_day_wednesday => true,:attendance_day_thursday => true, :attendance_day_friday => true, :show_attendance_days => true,
        :description => "<p>O programa tem como objetivo atender adolescentes na faixa etária de 15 à 18 anos incompletos. Os adolescentes participam de oficinas de esporte, cultura e lazer.</p>
          <p>O atendimento ocorre de forma descentralizada, ou seja, tem como objetivo contemplar todo o território da Região Norte.O objetivo é levar este programa para os locais onde haja demanda e priorizando as comunidades que possuem maior vazio de atendimento, oferecendo  as famílias usuárias dos serviços da assistência a garantia de  direito a um espaço de proteção e formação para seus filhos adolescentes.</p>
          <br />
          <a href='http://projovempoanortenoroeste.blogspot.com.br'>Visite nosso blog</a>"},      
      {:name => "Programa Trabalho Educativo", :url => "trabalho_educativo",
        :attendance_goal_value => "20 adolescentes", :show_attendance_goal => true, 
        :meals_quantity_value => 1, :meals_quantity_unit => :day, :show_meals_quantity => true,
        :attendance_day_monday => true,:attendance_day_tuesday => true,:attendance_day_wednesday => true,:attendance_day_thursday => true, :attendance_day_friday => true, :show_attendance_days => true,
        :description => "<p>O programa tem como objetivo promover o protagonismo juvenil, através de ações sócio-educativas voltadas a adolescentes, na faixa etária dos 14 aos 18 anos, que propiciem reflexões críticas a jovens social, cultural e emocionalmente vulneráveis. Além de promover o fortalecimento da construção de projetos de vida e o exercício de cidadania, apresentada como estratégia de diminuição dos impactos da exclusão social.</p>
          <br />
          <p>Sendo organizado em dois Módulos:</p>
          <p>Específico:  Conteúdos relacionados à área de informática</p>
          <p>Básico: Desenvolvimento Pessoal e Social</p>"},
      {:name => "Projeto Novo Despertar", :url => "novo_despertar",
        :description => "<p>O objetivo do projeto é de disponibilizar meios para promover a inclusão social de crianças e adolescentes através do esporte. Serão desenvolvidas atividades esportivas e sociais em turno inverso à escola, fortalecendo o percurso escolar, bem como desenvolvendo a disciplina, iniciativa e domínio do corpo, visando diminuir a situação de exclusão social e aumentar a integração entre os membros da comunidade. O projeto visa também a cobertura da quadra poliesportiva.</p>"},
      {:name => "Projeto Jiu-Jitsu", :url => "jiu_jitsu",
        :attendance_goal_value => "96 vagas disponibilizadas", :show_attendance_goal => true, 
        :attendance_day_monday => true,:attendance_day_wednesday => true, :attendance_day_friday => true, :show_attendance_days => true,
        :description => "      <p>O objetivo do projeto é disponibilizar aulas de Jiu-jitsu para crianças e adolescentes, pois acredita-se que através do esporte seja possível resgatarmos a sua autoestima e terão uma oportunidade de enxergar um futuro no qual eles sejam sujeitos de uma história própria e bem sucedida.</p>
          <br />
          <p>O jiu-Jitsu é um esporte que contempla vários aspectos importantes para um desenvolvimento saudável, pois trabalha questões como disciplina, cumprimento de regras, cuidado com o próximo, trabalho em equipe, cuidados com o corpo, mente e saúde, buscando o equilíbrio de todos estes fatores.</p>
          <br />
          <p>A realidade já está se tornando diferente desde junho de 2011. A equipe, treinada pelos professores Alexandre Monteiro (XENCA MONTEIRO) e Gustavo Silvestro nas dependências do Cejak, em março disputou sei primeiro campeonato, o ABU DHABI PRO etapa Brasil, e dos 15 adolescente 3 medalharam e classificaram-se para o mundial em ABU DHABI nos Emirados Árabes.</p>
          <br />
          <p>A equipe hoje com 40 alunos, já está competindo no Estadual de Jiu Jitsu, tendo na 1º ETAPA conquistado 15 medalhas e na 2º ETAPA 22 medalhas. A parceria da Academia Sul Jiu  Jitsu, Federação Gaúcha de Jiu Jitsu e voluntários como Ricardo Cantalice, Fernando Castro Silva, Marcelo Oliveira, Rodrigo Flôres e Flavio Castelo Branco possibilitam 5 aulas semanais e 5 bolsas nas dependência da Academia Sul Jiu Jitsu.</p>"},
      {:name => "Projeto Tocando Sonhos", :url => "tocando_sonhos",
        :available_spots => 60, :show_available_spots => true,
        :frequency_value => 3, :frequency_unit => :week, :show_frequency => true,
        :description => "<p>O projeto visa oferecer oficinas de música direcionadas à crianças e adolescentes. São oferecidas oficinas de flauta, percussão, canto e teoria musical. Deseja-se trabalhar valores sociais, culturais e educacionais, fortalecendo o exercício da cidadania e a melhor qualidade de vida.</p>"}
    ]

    Project.where( :name => cejak_community_projects.map {|project| project[:name]} ).delete_all
    cejak_community_projects.each do |project_data|
      project = Project.new
      project.category = Project::CATEGORY_COMMUNITY
      project.visible = true
      project_data.keys.each { |key| project.send(key.to_s + "=", project_data[key])   }
      project.save!
    end

    Project.where( :name => cejak_children_and_teenagers_projects.map {|project| project[:name]} ).delete_all
    cejak_children_and_teenagers_projects.each do |project_data|
      project = Project.new
      project.category = Project::CATEGORY_CHILDREN_AND_TEENAGERS
      project.visible = true
      project_data.keys.each { |key| project.send(key.to_s + "=", project_data[key])   }
      project.save!
    end

  end

  def down
  end
end
