sfdx shane:org:create -f config/project-scratch-def.json -d 10 -s --json -u iot -o tdx.booth
sfdx force:source:push
sfdx force:user:permset:assign -n IoT_Perms
sfdx force:data:tree:import -p data/ImportPlan.json
sfdx shane:user:password:set -l User -g User -p sfdx1234
sfdx force:org:open

sfdx force:user:create -a iotUser firstname=Lippert lastname=IoT permsets=IoT_Perms profileName="System Administrator"
sfdx shane:user:password:set -l IoT -g Lippert -p sfdx1234

# sfdx force:data:record:create -s LippertComponentCode__e -v "ProductUniqueId__c='407645' DTC_Type__c='OK' DTC_Code__c=200"
# sfdx force:data:record:create -s LippertComponentCode__e -v "ProductUniqueId__c='4785' DTC_Type__c='OK' DTC_Code__c=200"
# sfdx force:data:record:create -s LippertComponentCode__e -v "ProductUniqueId__c='9944432' DTC_Type__c='OK' DTC_Code__c=200"
# sfdx force:data:record:create -s LippertComponentCode__e -v "ProductUniqueId__c='994443244' DTC_Type__c='OK' DTC_Code__c=200"
# sfdx force:data:record:create -s LippertComponentCode__e -v "ProductUniqueId__c='943444' DTC_Type__c='OK' DTC_Code__c=200"