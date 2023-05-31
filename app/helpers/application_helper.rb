module ApplicationHelper
  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end
  def convert_to_brazilian_date(date)
    date.strftime("%d/%m/%Y")
  end
end
