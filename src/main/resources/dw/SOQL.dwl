var keys = {
	Contract: [
		"AccountId",
		"Id",
		"Contact__c",
		"BillingContact__c",
		"License_Coordinator__c",
		"ContractTerm",
		"CustomerSignedDate",
		"StartDate",
		"EndDate",
		"BillingStreet",
		"BillingCity",
		"BillingStateCode",
		"BillingCountryCode",
		"BillingPostalCode",
		"Description",
		"SBQQ__AmendmentRenewalBehavior__c",
		"SBQQ__RenewalTerm__c",
		"SBQQ__SubscriptionQuantitiesCombined__c",
		"SBQQ__Evergreen__c",
		"Status",
		"bill_id__c",
		"SBQQ__AmendmentPricebookId__c",
		"SBQQ__RenewalPricebookId__c",
		"SBQQ__AmendmentOwner__c",
		"SBQQ__RenewalOwner__c",
		"SBQQ__RenewalForecast__c",
		"SBQQ__RenewalQuoted__c",
		"DoNotRenewOrAmend__c",
		"SBQQ__PreserveBundleStructureUponRenewals__c"
	]
}

var toSOQLArray = (payload) ->
    payload reduce (e,s='') -> s ++ (if (not isEmpty(s)) ',' else '') ++ "'$(e)'"
    
var whereString = (whereClauses) ->
	if (sizeOf(whereClauses) > 0)
		" WHERE " ++ (whereClauses joinBy " AND ")
	else ""