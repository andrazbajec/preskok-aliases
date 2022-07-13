alias abm-at="cd $PROJECT_PATH/abmobil-at"

function abm-at-branch {
	abm-at &&
	cd vendor/base-carmarket/${1}
}

abm_at_modules=("asset" "account" "backend" "core" "common" "consoleapp" "contract" "document" "easy-rent" "easy-rent-backend" "editor" "element-builder" "excel" "fleet-manager" "file" "generic-importer" "invoice" "notification" "rentacar-account" "rentacar-backend" "rentacar-class" "rentacar-export" "rentacar-inspection" "rentacar-invoice" "tyre" "user" "vehicle-cost")

for module in ${abm_at_modules}
do
	alias "abm-at-${module}=abm-at-branch ${module}"
	alias "abm-at-${module}-push=abm-at-${module} && gpfl"
done
