class CustomersController < ApplicationController
  def index
    @customers = Customer.with_attached_image.all
  end

  def alphabetized
    @customers = Customer.with_attached_image
                         .order(Arel.sql("LOWER(full_name) ASC"))
  end

  def missing_email
    @customers = Customer.with_attached_image
                         .where("email_address IS NULL OR TRIM(email_address) = ?", "")
  end
end