include_recipe 'definitions/add_user_to_group'

include_recipe 'user'
include_recipe 'certificates'
include_recipe 'packages'
include_recipe 'repository'
include_recipe 'folders'
