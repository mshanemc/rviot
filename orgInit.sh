sfdx force:org:create -f config/project-scratch-def.json -s
sfdx force:source:push
sfdx force:user:permset:assign -n IoT_Perms
sfdx force:data:tree:import -p data/ImportPlan.json
sfdx force:user:password:generate
sfdx force:org:open