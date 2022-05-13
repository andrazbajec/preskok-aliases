alias di="cd $PROJECT_PATH/di"
alias di-project="di && cd project"
alias di-push="di && gpfl"
alias di-docker="docker exec -it devenv2_digital-inspection_1 /bin/bash"

function di-find-changes {
	di
	diffCount=0

	if [ ${#$(git diff master)} -ne 0 ]
	then
		diffCount=$((diffCount + 1))
		echo "* Changes found on DI module"
	fi

	cd project/vendor/base-carmarket

	ls | while read submodule ; do
		cd ${submodule}
		if [ ${#$(git diff master)} -ne 0 ]
		then
			diffCount=$((diffCount + 1))
			echo "* Changes found on submodule $submodule"
		fi
		cd ..
	done

	if [ ${diffCount} -eq 0 ]
	then
		echo 'No changes found'
	fi

    di
}