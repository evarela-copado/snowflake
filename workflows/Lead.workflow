<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Legal</fullName>
        <description>Notify Legal</description>
        <protected>false</protected>
        <recipients>
            <recipient>insightssecurity@00df4000000osnseau.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MarketingProductInquiryResponse</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assign_Operations</fullName>
        <field>OwnerId</field>
        <lookupValue>Operations</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Operations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Status</fullName>
        <field>Status</field>
        <literalValue>Business Review</literalValue>
        <name>Update Lead Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Status_Buss</fullName>
        <field>Status</field>
        <literalValue>Completed Internal Review</literalValue>
        <name>Update Lead Status Buss</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Operations</fullName>
        <actions>
            <name>Assign_Operations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Open - Not Contacted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Legal</fullName>
        <actions>
            <name>Notify_Legal</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Completed Internal Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Client_Type__c</field>
            <operation>equals</operation>
            <value>ICO</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
