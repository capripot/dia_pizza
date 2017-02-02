# if Rails.env.test?
#   $ns = Redis::Namespace.new(Rails.env, redis: $redis)
#   $rollout = Rollout.new($ns)
# else
#   $rollout = Rollout.new($redis)
# end

# $rollout.define_group(:admin) do |user|
#   user.admin?
# end
