# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'

module HexletCode
  # autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  def self.form_for(user, options = {})
    url = options[:url] || '#'
    final_options = { action: url, method: 'post' }
    form_builder = FormBuilder.new(user, final_options)
    yield form_builder if block_given?
    # puts form_builder.final   
    form_builder.final   
  end
end

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

puts HexletCode.form_for user do |f|
  f.input :name
  # f.input :job, as: :text
end