# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  code       :string
#  stock      :integer          default(0)
#  price      :decimal(10, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  before_save
  after_save :send_notification

  def send_notification
    puts "un nuevo producto fue añadido al almacen: #{self.title} #{self.price}"
  end
end
