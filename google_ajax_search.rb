# GoogleAjaxSearch
# by tszkan (tszkan at inspiresynergy.com)
require 'json'

class GoogleAjaxSearch

  def self.web_search(options={})
    hash = JSON.parse(GoogleAjaxSearch::get_web_search(options).scan(/\{.*\}/).first)

    if (hash.kind_of?(Hash) && hash['results'])
      return hash['results']
    end

    return []
  end
  private
  def self.get_web_search(options={})
    options[:callback] ||= 'google.search.WebSearch.RawCompletion'
    options[:context] ||= 0
    options[:lstkp] ||= 0
    options[:rsz] ||= 'large'
    options[:hl] ||= 'en'
    options[:gss] ||= '.com'
    options[:start] ||= 0
    options[:sig] ||= '582c1116317355adf613a6a843f19ece'
    options[:key] ||= 'notsupplied'
    options[:v] ||= '1.0'
    raise Exception, "q parameter cannot be blank" if options[:q].blank?

    url = URI("http://www.google.com/uds/GwebSearch?" + options.map { |key,value|
      "#{key}=#{value}"
    }.join('&'))

    return Net::HTTP.get(url)
  end
end
