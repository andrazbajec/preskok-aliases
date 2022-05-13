alias abm-hr="cd $PROJECT_PATH/abmobil-hr"

function abm-hr-branch {
	abm-hr &&
	cd vendor/base-carmarket/${1}
}

abm_hr_modules=("asset" "account" "backend" "core" "common" "consoleapp" "contract" "document" "easy-rent" "easy-rent-backend" "editor" "element-builder" "excel" "fleet-manager" "file" "generic-importer" "invoice" "notification" "rentacar-account" "rentacar-backend" "rentacar-class" "rentacar-export" "rentacar-inspection" "rentacar-invoice" "tyre" "user" "vehicle-cost")

for module in ${abm_hr_modules}
do
	alias "abm-hr-${module}=abm-hr-branch ${module}"
	alias "abm-hr-${module}-push=abm-hr-${module} && gpfl"
done
