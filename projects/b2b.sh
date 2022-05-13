alias b2b="cd $PROJECT_PATH/b2b-carmarket/project"
alias b2b-api="b2b && cd vendor/base-carmarket/b2b-api"
alias b2b-backend="b2b && cd vendor/base-carmarket/b2b-backend"
alias b2b-core="b2b && cd vendor/base-carmarket/b2b-core"
alias b2b-frontend="b2b && cd vendor/base-carmarket/b2b-frontend"

alias b2b-push="b2b && gpfl"
alias b2b-api-push="b2b-api && gpfl"
alias b2b-backend-push="b2b-backend && gpfl"
alias b2b-core-push="b2b-core && gpfl"
alias b2b-frontend-push="b2b-frontend && gpfl"

function b2b-pull-all {
	foreach x ( b2b b2b-api b2b-backend b2b-core b2b-frontend )
		gcm
		ggpur
	end
}

alias b2b-docker="docker exec -it devenv2_b2b-carmarket_1 /bin/bash"