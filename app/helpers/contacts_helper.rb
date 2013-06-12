module ContactsHelper
  def address_map
    gmaps(
      "markers" => {
        "data" => [
          {
            "lat" => "-30.0488979",
            "lng" => "-51.1564044",
            "description"=>"Avenida Joaquim Porto Villanova, 143, Vila Pinto<br/>Bairro Bom Jesus<br/>Porto Alegre - RS<br/>CEP 91410-400"
          }
        ].to_json
      },
      "map_options" => {
        "auto_zoom" => false,
        "zoom" => 14,
        "language" => I18n.locale.to_s
      }
    ) + content_for(:scripts)
  end
end
