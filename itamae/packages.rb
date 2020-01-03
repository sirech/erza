%w[git docker-compose].each do |pkg|
  package pkg do
    action :install
  end
end
