# frozen_string_literal: true

require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_render'
require_relative 'hexlet_code/tag'

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRender, 'hexlet_code/form_render.rb')
  autoload(:Tag, 'hexlet_code/tag')

  def self.form_for(user, options = {})
    url = options[:url] || '#'
    method = options[:method] || 'post'
    final_options = { action: url, method: method }

    form_builder = FormBuilder.new(user)
    yield form_builder if block_given?
    FormRender.build(form_builder.contents, final_options)
  end
end

# User = Struct.new(:name, :job, :gender, keyword_init: true)
# user = User.new name: 'rob', gender: 'm', job: 'hexlet'

# result = HexletCode.form_for user do |f|
#   f.input :name, class: 'user-input'
#   f.input :job, as: :text
#   f.submit
# end

# puts result
