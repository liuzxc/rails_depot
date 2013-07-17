class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  
  attr_accessible :description, :image_url, :price, :title
  validates :description, :image_url, :title, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, :length => { :minimum => 10 }

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items present')
      return false
    end
  end

  def self.search(search)
    if search
      where("title LIKE?", "%#{search}%")
    else
      all
    end
  end

end
