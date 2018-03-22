public with sharing class demoToolsCtrl {


    @AuraEnabled
    public static void fullReset(){

        //set all the components back to "Normal"
        list<Component__c> Components = [select id, status__c from Component__c];
        for(Component__c c:components){
            c.Status__c = 'Normal';
        }
        update Components;

        //delete any cases
        delete [select id from Case];

        //delete all chatter
        delete [select id from FeedItem];
    }

    @AuraEnabled
    public static void allComponentsSendOK(){
        list<Component__c> Components = [select id, ProductUniqueId__c from Component__c];
        list<LippertComponentCode__e> events = new list<LippertComponentCode__e>();
        for(Component__c c:components){
            LippertComponentCode__e e = new LippertComponentCode__e();
            e.ProductUniqueId__c = c.ProductUniqueId__c;
            e.DTC_Type__c = 'OK';
            events.add(e);
        }

        Eventbus.publish(events);
    }
}
