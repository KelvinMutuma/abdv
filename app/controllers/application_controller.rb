class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def call_rake(task, options={})
  	options[:rails_env] = Rails.env
  	args = options.map {|n,v| "#{n.to_s.upcase}='#{v}'"}
  	system "rake #{task} #{args.join(' ')} --trace >> #{Rails.root}/log/rake.log &"
  end
end
