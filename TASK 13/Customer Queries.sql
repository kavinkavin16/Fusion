Customer/OM/AR :

1.       Build a query for Active Customer List

SELECT ACCOUNT_NAME AS CustomerName, STATUS AS Status FROM HZ_CUST_ACCOUNTS
WHERE 
STATUS IN ('A')

2.       List the Customer those are belongs to Country ‘US’

--NOTE: don't take account_name from hz_parties table , it has supplier name along with customer name

SELECT DISTINCT
B.PARTY_NAME AS Customer,
B.COUNTRY AS Country 
FROM 
HZ_CUST_ACCOUNTS A,
HZ_PARTIES B
WHERE A.PARTY_ID=B.PARTY_ID
AND B.COUNTRY IN ('US')

--or
SELECT PARTY_NAME,
COUNTRY
FROM HZ_PARTIES
WHERE COUNTRY IN
(
SELECT COUNTRY 
FROM HZ_LOCATIONS
WHERE COUNTRY='US')

3.       Build a query for Customer those who are Inactivated during last 6 months

SELECT 
A.PARTY_NAME ,
C.END_DATE AS END_DATE 
FROM 
HZ_PARTIES A, 
HZ_PARTY_SITES B, 
HZ_CUST_ACCT_SITES C 
WHERE 
A.PARTY_ID = B.PARTY_ID 
AND B.PARTY_SITE_ID = C.PARTY_SITE_ID 
AND C.END_DATE < SYSDATE 
AND C.END_DATE > ADD_MONTHS(SYSDATE, -6)

4.       Write a query for active customer Count based on the business Unit.

SELECT 
COUNT(A.ACCOUNT_NAME) AS CustomerName_Count ,
D.NAME AS BuName
FROM 
HZ_CUST_ACCOUNTS A,
HZ_PARTIES B,
HZ_PARTY_SITES C,
HR_ALL_ORGANIZATION_UNITS D
WHERE 
A.STATUS IN ('A')
AND
B.PARTY_ID=C.PARTY_ID
AND
C.LOCATION_ID=C.LOCATION_ID
GROUP BY D.NAME

5.       Build a query for Order count based on its status

SELECT COUNT(ORDER_NUMBER),STATUS_CODE  
FROM DOO_HEADERS_ALL
GROUP BY STATUS_CODE

6.       Build a query to get the Customer and its AR Invoice count which is based on Sales Order
SELECT A.PARTY_NAME AS CUSTOMER , 
			  D.SALES_ORDER AS ORDER_NUM, 
			  COUNT(C.CUSTOMER_TRX_ID) AS AR_INVOICE_COUNT 
			  FROM HZ_PARTIES A, 
			  HZ_CUST_ACCOUNTS B, 
			  RA_CUSTOMER_TRX_ALL C, 
			  RA_CUSTOMER_TRX_LINES_ALL D 
			  WHERE A.PARTY_ID = B.PARTY_ID 
			  AND B.CUST_ACCOUNT_ID = C.SOLD_TO_CUSTOMER_ID 
			  AND C.CUSTOMER_TRX_ID = D.CUSTOMER_TRX_ID 
			  GROUP BY A.PARTY_NAME, 
			  D.SALES_ORDER

7.       Build a query to get AR Invoices Due date more than 50 days

8.       Build a query to get the AR Invoice details with the following bucket details
		 Customer Name, Inv Count(0-30days), Inv Count(31-60days), Inv Count(>60days)


9.       List the Incomplete state invoices

10.   List the Customer which is not having Bill to Site.