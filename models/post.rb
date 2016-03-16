class Post < ActiveRecord::Base
  belongs_to :group
  has_many :pages, :dependent => :destroy

  def self.pages
    super.order :number
  end

  def create_page
    pages.create :number => next_page_number, :layout => Layout.default
  end

  def next_page_number
    pages.count
  end

  def url_string
    title.gsub(" ", "_")
  end
end
