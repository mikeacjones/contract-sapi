# System API - Contracts

![Build and Deploy - Production](https://github.com/mikeacjones/contract-sapi/workflows/Build%20and%20Deploy%20-%20Production/badge.svg?branch=master)
![Build and Deploy - Sandbox](https://github.com/mikeacjones/contract-sapi/workflows/Build%20and%20Deploy%20-%20Sandbox/badge.svg?branch=sandbox)

This service provides functionality around Contracts, allowing you to get/create/delete contracts.

View in Exchange: [https://anypoint.mulesoft.com/exchange/a8f5e5b7-17ab-4a7f-be14-9e390f9e3775/system-api-contracts/](https://anypoint.mulesoft.com/exchange/a8f5e5b7-17ab-4a7f-be14-9e390f9e3775/system-api-contracts/)

### Browse Contracts

To browse contracts, make a `GET` request to `/api/contracts`.

##### Supported Query Parameters

* limit:
  * Optional
  * Default: 500
  * NOT repeatable
  * Should be an integer indicating the number of records to be returned.
* offset:
  * Optional
  * Default: 0
  * NOT repeatable
  * Should be an integer indicating the number of records to skip.
* AccountId
  * Optional
  * Repeatable
  * To filter contracts by AccountId, provide repeated query parameter. EG: `/api/contracts?AccountId=AAAAAA&AccountId=BBBBBBB`
* ContactId
  * Optional
  * Repeatable
  * To filter contracts by ContactId, provide repeated query parameter. EG: `/api/contracts?ContactId=AAAAA&ContactId=BBBBBBB`

Example return from `/api/contracts?limit=4`

```JSON
[
  {
    "CustomerSignedDate": "2016-05-23",
    "AmendmentRenewalBehavior": "Earliest End Date",
    "RenewalOwnerId": "00533000004AnHRAA0",
    "AccountId": "00130000003aorzAAA",
    "Description": "kp2contract1.01 mdr 00863462;",
    "BillingCity": "Bixby",
    "BillingCountryCode": "",
    "AmendmentOwnerId": "00533000004AnHRAA0",
    "ContactId": "003f3000024KLe5AAG",
    "ContractTerm": "12",
    "PreserveBundleStructureUponRenewals": "true",
    "RenewalQuoted": "false",
    "BillingContactId": "003f3000024KLe5AAG",
    "StartDate": "2016-11-02",
    "SubscriptionQuantitiesCombined": "false",
    "AmendmentPricebookId": "01s40000000A6buAAC",
    "BillingPostalCode": "74008",
    "Status": "Draft",
    "LicenseCoordinatorId": "003f3000024KLe5AAG",
    "RenewalPricebookId": "01s40000000A6buAAC",
    "RenewalForecast": "false",
    "EndDate": "2017-11-02",
    "BillingStreet": "109 North Armstrong",
    "BillingStateCode": "",
    "BillId": "5184720",
    "RenewalTerm": 0,
    "Id": "80033000000ZtWFAA0",
    "Evergreen": "false",
    "DoNotRenewOrAmend": "true"
  },
  {
    "CustomerSignedDate": "2016-10-14",
    "AmendmentRenewalBehavior": "Earliest End Date",
    "RenewalOwnerId": "00533000004B04zAAC",
    "AccountId": "0014000000HuckOAAR",
    "Description": "kp2contract1.01 mdr 00744684;",
    "BillingCity": "Brooklyn",
    "BillingCountryCode": "",
    "AmendmentOwnerId": "00533000004B04zAAC",
    "ContactId": "003f3000024MPYnAAO",
    "ContractTerm": "7",
    "PreserveBundleStructureUponRenewals": "true",
    "RenewalQuoted": "false",
    "BillingContactId": "003f3000024MPYnAAO",
    "StartDate": "2016-11-02",
    "SubscriptionQuantitiesCombined": "false",
    "AmendmentPricebookId": "01s40000000A6buAAC",
    "BillingPostalCode": "11201",
    "Status": "Draft",
    "LicenseCoordinatorId": "003f3000024MPYnAAO",
    "RenewalPricebookId": "01s40000000A6buAAC",
    "RenewalForecast": "false",
    "EndDate": "2017-06-30",
    "BillingStreet": "65 Court ST room 1502",
    "BillingStateCode": "",
    "BillId": "5448338",
    "RenewalTerm": 0,
    "Id": "80033000000ZtbjAAC",
    "Evergreen": "false",
    "DoNotRenewOrAmend": "true"
  }
]
```

#### Specific Contract

To reach a specific contract, make a `GET` request to `/api/contracts/{id}`.

Example return from `/api/contracts/80033000000ZtbjAAC`

```JSON
{
  "CustomerSignedDate": "2016-10-14",
  "AmendmentRenewalBehavior": "Earliest End Date",
  "RenewalOwnerId": "00533000004B04zAAC",
  "AccountId": "0014000000HuckOAAR",
  "Description": "kp2contract1.01 mdr 00744684;",
  "BillingCity": "Brooklyn",
  "BillingCountryCode": "",
  "AmendmentOwnerId": "00533000004B04zAAC",
  "ContactId": "003f3000024MPYnAAO",
  "ContractTerm": "7",
  "PreserveBundleStructureUponRenewals": "true",
  "RenewalQuoted": "false",
  "BillingContactId": "003f3000024MPYnAAO",
  "StartDate": "2016-11-02",
  "SubscriptionQuantitiesCombined": "false",
  "AmendmentPricebookId": "01s40000000A6buAAC",
  "BillingPostalCode": "11201",
  "Status": "Draft",
  "LicenseCoordinatorId": "003f3000024MPYnAAO",
  "RenewalPricebookId": "01s40000000A6buAAC",
  "RenewalForecast": "false",
  "EndDate": "2017-06-30",
  "BillingStreet": "65 Court ST room 1502",
  "BillingStateCode": "",
  "BillId": "5448338",
  "RenewalTerm": 0,
  "Id": "80033000000ZtbjAAC",
  "Evergreen": "false",
  "DoNotRenewOrAmend": "true"
}
```

#### Delete Contract

Do delete a contract, make a `DELETE` request to `/api/contracts/{id}`.

Example return from `DELETE` on `/api/contracts/80033000000ZtbjAAC`

```JSON
{
  "message": "Contract deleted"
}
```

### Create Contract

To create a new Contract, make a `POST` request to `/api/contracts`.

The following fields are required and expected when creating a new contract; all other fields will be populated by the API based on current business logic. For more detailed information, please see the Exchange.

```JSON
{
  "AccountId": "STRING",
  "BillId": "STRING",
  "ContactId": "STRING",
  "BillingContactId": "STRING",
  "LicenseCoordinatorId": "STRING",
  "ContractTerm": NUMBER,
  "CustomerSignedDate": |DATE-ONLY|,
  "StartDate": |DATE-ONLY|,
  "EndDate": |DATE-ONLY|,
  "BillingStreet": "STRING",
  "BillingCity": "STRING",
  "BillingStateCode": "STRING", //TWO CHARACTER STATE CODE
  "BillingCountryCode": "STRING",
  "BillingPostalCode": "STRING", //MINIMUM 5 DIGIT POSTAL, SUPPORTS EXPANDED POSTAL
  "Description": "STRING",
  "DoNotRenewOrAmend": BOOLEAN,
  "AmendmentOwnerId": "STRING",
  "RenewalOwnerId": "STRING"
}
```
