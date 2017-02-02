namespace :deploy do
  desc 'This task is a hook to perform data fixes when deploying. DO NOT remove.'
  task after_migrate: :environment do
    # do not remove
  end

  desc "Deploys staging"
  task staging: :environment do |t, opts|
    git = Git.new("challengepost", "company_profiles")

    source_branch = (opts[:branch] || ENV['BRANCH'] || git.current_branch).to_s
    target_branch = "staging"

    puts "Deploying #{source_branch} to #{target_branch}..."

    git.merge_push(source_branch, target_branch)

    puts "Done."
  end
end
