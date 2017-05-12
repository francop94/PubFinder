class Menu < ApplicationRecord
has_attached_file :document
validates_attachment :document, :content_type => {:content_type => %w(application/pdf)}
end
