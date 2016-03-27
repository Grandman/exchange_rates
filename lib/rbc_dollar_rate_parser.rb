module RbcDollarRateParser
  extend self

  XPATH = "//div[@class='indicators_vert__group'][1]/a[@class='indicators_vert__ticker']
           [5]/span[@class='indicators_vert__ticker__td indicators_vert__ticker__val1']"
  def perform
    page = Nokogiri::HTML(RestClient.get('http://www.rbc.ru/'))
    text = page.xpath(XPATH)&.text
    text.gsub(',', '.').to_f unless text.nil?
  end
end
