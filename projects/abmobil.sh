alias abm-docker="docker exec -it devenv2_abmobil_1 /bin/bash"

alias abm="cd $PROJECT_PATH/abmobil"

function abm-branch {
	abm &&
	cd vendor/base-carmarket/${1}
}

abm_modules=("asset" "account" "backend" "core" "common" "consoleapp" "contract" "document" "easy-rent" "easy-rent-backend" "editor" "element-builder" "excel" "fleet-manager" "file" "generic-importer" "invoice" "notification" "rentacar-account" "rentacar-class" "rentacar-export" "rentacar-inspection" "rentacar-invoice" "tyre" "user" "vehicle-cost")

for module in ${abm_modules}
do
	alias "abm-${module}=abm-branch ${module}"
	alias "abm-${module}-push=abm-${module} && gpfl"
done

function abm-pull-all {
	abm && cd vendor/base-carmarket

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

function abm-find-branches {
    abm
    find-branches
}

function abm-add-linter {
	if [ ${#1} -eq 0 ]
    then
        echo "A module name must be provided!"
        return
    fi

	abm

	composer run-script create-linter ${1}
}

function abm-find-changes {
	abm
	find-changes
}
