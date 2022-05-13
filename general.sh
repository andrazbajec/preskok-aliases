# COLORS REGION #
COLOR_GREEN="\e[32m"
COLOR_LIGHT_GREEN="\e[92m"
COLOR_RED="\e[31m"
COLOR_YELLOW="\e[33m"
COLOR_LIGHT_YELLOW="\e[93m"
COLOR_ESCAPE="\033[0m"
# COLORS REGION END #

# GENERIC COMMANDS REGION #
alias gpfl="git push --force-with-lease"
alias claer="clear"

function find-changes {
	pwd=`pwd`
	cd vendor/base-carmarket
	changes=()

	ls | while read line ; do
		cd ${line}
        diff=$(git diff --name-only)

        if [ ${#diff} -gt 0 ]
        then
            echo "$COLOR_GREEN$line\n$COLOR_LIGHT_GREEN$diff\n"
			changes+=($line)
        fi

        cd ..
    done

	if [ ${#changes} -gt 0 ]
	then
		echo "$COLOR_YELLOW~ MODULES: $COLOR_LIGHT_YELLOW$changes$COLOR_ESCAPE"
	else
		echo "$COLOR_RED~ No changes found!$COLOR_ESCAPE"
	fi

	cd "${pwd}"
}

function find-branches {
    if [ ${#1} -eq 0 ]
    then
        echo "$COLOR_RED~ A branch name must be provided!$COLOR_ESCAPE"
        return
    fi

	pwd=`pwd`
	cd vendor/base-carmarket
	onProject=false

	ls | while read line ; do
        cd ${line}
        branch=`git branch | grep -w ${1}`

        if [ ${#branch} -gt 0 ]
        then
			echo "$COLOR_LIGHT_YELLOW~ Branch found on submodule $line$COLOR_ESCAPE"
        fi

        cd ..
    done

	cd "${pwd}"

	branch=`git branch | grep -w ${1}`

	if [ ${#branch} -gt 0 ]
	then
		echo "$COLOR_YELLOW~ Branch found on project$COLOR_ESCAPE"
	fi
}
# GENERIC COMMANDS END #