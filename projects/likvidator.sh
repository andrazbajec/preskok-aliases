alias likvidator="cd $PROJECT_PATH/likvidator"
alias likvidator-push="likvidator && gpfl" 
alias likvidator-docker="docker exec -it devenv2_likvidator_1 /bin/bash"

function likvidator-pull-all {
	likvidator && cd vendor/base-carmarket

	ls | while read submodule ; do
		echo ----------
		echo $submodule
		echo ----------
		cd ${submodule}
		gcm
		ggpur
		cd ..
		echo
	done

	likvidator && cd vendor/b2bcarmarket

	ls | while read submodule ; do
		echo ----------
		echo $submodule
		echo ----------
		cd ${submodule}
		gcm
		ggpur
		cd ..
		echo
	done
}