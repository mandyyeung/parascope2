require 'open-uri'

class ReadabilityValidator < ActiveModel::Validator
  def validate(record)
    result = record.get_data
    # if result["content"].empty?
    if !result
      record.errors[:readability] << 'Stuff Broke man'
    end
  end
end

class Article < ActiveRecord::Base
  has_many :collection_articles
  has_many :collections, through: :collection_articles
  accepts_nested_attributes_for :collections

  validates_presence_of :url
  validates_with ReadabilityValidator

  def archive
    self.archived = true
    self.save
  end

  def archived?
    !!archived
  end

  def upvote
    self.priority += 1
    self.save
  end

  def downvote
    self.priority -= 1
    self.save
  end

  def vote_links
    if self.priority < 1
      upvote
    elsif self.priority < 2
      dowvote
    end
  end

  def linkify
    link = self.url.gsub(/^(https|http):\/\//, "")
    "http://#{link}"
  end

  def get_data
    @data ||= begin
      url = "https://www.readability.com/api/content/v1/parser?url=#{self.linkify}&token=1d8b4f869348fc78387fbcd7fc495dba8890be85"
      response = RestClient.get(url)
      parsed_response = JSON.parse(response)
    end
    rescue RestClient::Exception => e
      {"content" => "", "lead_image_url" => ""}
  end

  def read
    get_data["content"].html_safe
  end

  def article_image
    get_data["lead_image_url"]
  end

  # def article_title
  #   uri = "#{title}"
  #   doc = Nokogiri::HTML(open(uri))
  #   if doc.title.size > 51
  #     doc.title[0,51] + "..."
  #   else
  #     doc.title
  #   end
  # end

end
