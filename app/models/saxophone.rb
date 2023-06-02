class Saxophone < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :title, :details, :manufacturer, :sax_model, :serial_number, :category, :condition, presence: true
  include AlgoliaSearch

  MANUFACTURERS = ["Antigua", "B&S", "Berg Larsen", "Borgani", "Buffet Crampon", "Cannonball", "Chateau", "Claude Lakey", "Couesnon", "D'Addario", "Dörfler & Jörka", "Eastman", "F. Arthur Uebel", "Gemeinhardt", "Grafton", "Guardala", "H. Couf", "Hanson", "J. Keilwerth", "Jean Baptiste", "Jupiter", "Kanstul", "Keilwerth", "Kessler & Sons", "King", "LA Sax", "Lade", "Mauriat", "P. Mauriat", "Penzel", "Pierret", "Rampone & Cazzani", "Rico", "Rigotti", "Rousseau", "Sakkusu", "Sankyo", "Selmer", "SML", "Steinbach", "Trevor James", "Vandoren", "Vibrato", "Vito", "Warburton", "Weltklang", "Wurlitzer", "Yamaha", "Yanagisawa", "Zonda", "Outro"]
  CATEGORIES = ["Saxofone Soprillo", "Saxofone Sopranino", "Saxofone Soprano", "Saxofone Alto", "Saxofone Tenor", "Saxofone Barítono", "Saxofone Baixo", "Saxofone Contrabaixo"]
  MODELS = ["Selmer Mark VI", "Selmer Balanced Action", "Selmer Super Balanced Action", "Selmer SBA", "Selmer Mark VII", "Selmer Super Action 80", "Selmer Series II", "Selmer Series III", "Selmer Radio Improved", "Conn 6M", "Conn New Wonder Series I", "Conn New Wonder Series II", "Conn Chu Berry", "King Super 20", "King Zephyr", "King Zephyr Special", "Buescher Aristocrat", "Buescher True Tone", "Buescher 400", "Martin Handcraft", "Martin Committee", "Martin Committee II", "Martin Typewriter", "Yamaha YAS-62", "Yamaha YTS-62", "Yamaha YAS-82Z", "Yamaha YTS-82Z", "Yamaha YAS-875", "Yamaha YTS-875", "Yanagisawa S-880", "Yanagisawa T-880", "Yanagisawa S-991", "Yanagisawa T-991", "Keilwerth New King", "Keilwerth Toneking", "Keilwerth SX90", "Buescher 140", "Conn 10M", "Conn Naked Lady", "Martin Handcraft Committee", "Martin Indiana", "Selmer Modele 22", "Selmer Modele 26", "Buescher Big B", "Conn Transitional", "King Voll-True", "Martin Magna", "Selmer Modele 28", "Yamaha YSS-62", "Yamaha YTS-61", "Yanagisawa S-901", "Yanagisawa T-901", "Keilwerth SX90R"]
  CONDITIONS = ["Usado - Excelente estado", "Usado - Bom estado", "Usado - Condição justa", "Revisado", "Danificado - Pode ser consertado", "Danificado - Para peças de reposição"]

  algoliasearch do
    attribute :title, :manufacturer, :category, :sax_model, :condition, :serial_number, :details, :user_id
    attribute :user_name do
      user&.full_name
    end
    searchableAttributes [:title, :manufacturer, :category, :sax_model, :condition, :serial_number, :details, 'user_name']
    queryType 'prefixAll'
  end
end
