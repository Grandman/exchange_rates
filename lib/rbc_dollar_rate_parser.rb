module RbcDollarRateParser
  extend self
  mattr_accessor(:client) { RestClient}

  XPATH = "//div[@class='indicators_vert__group'][1]/a[@class='indicators_vert__ticker']
           [5]/span[@class='indicators_vert__ticker__td indicators_vert__ticker__val1']"
  def perform
    page = Nokogiri::HTML(client.get('http://www.rbc.ru/'))
    page.xpath(XPATH).text
  end
end