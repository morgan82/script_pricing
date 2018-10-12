insert into DTV_PRICE_PRODUCT values(PRICE_PRODUCT_SEC.NEXTVAL,
                (select id from DTV_PRICE_CUSTOMER where DESCRIPTION ='Prepago'),
                (select id from DTV_PRICE_IBS_PRODUCTS where DESCRIPTION = 'FOR MAN'),
                '345.94',
                (select id from DTV_PRICE_COUNTRIES where CODE='AR'),
                1);
insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='TUCUMAN' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='CORRIENTES' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='BUENOS AIRES' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='Edificio - Trio' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='DEMOS' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='Bundle' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='Net' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_FINANCE
values((select finance_id from DTV_PRICE_FINANCE where DESCRIPTION='S - Sold' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT values(PRICE_PRODUCT_SEC.NEXTVAL,
                (select id from DTV_PRICE_CUSTOMER where DESCRIPTION ='Postpago'),
                (select id from DTV_PRICE_IBS_PRODUCTS where DESCRIPTION = 'FOR MAN'),
                '234.67',
                (select id from DTV_PRICE_COUNTRIES where CODE='AR'),
                1);
insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='TIERRA DEL FUEGO' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='CHUBUT' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='Prueba Catch Up' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Postpago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='Normal' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Postpago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='TV' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='Net' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_FINANCE
values((select finance_id from DTV_PRICE_FINANCE where DESCRIPTION='4 - 4to Mirror' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Postpago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT values(PRICE_PRODUCT_SEC.NEXTVAL,
                (select id from DTV_PRICE_CUSTOMER where DESCRIPTION ='Prepago'),
                (select id from DTV_PRICE_IBS_PRODUCTS where DESCRIPTION = 'BIG BROTHER'),
                '213.78',
                (select id from DTV_PRICE_COUNTRIES where CODE='AR'),
                1);
insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='SANTA CRUZ' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='EMPLEADOS/PERIODISTAS' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='Prepago' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='Bundle' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='TV' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_FINANCE
values((select finance_id from DTV_PRICE_FINANCE where DESCRIPTION='3 - 3er Mirror' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT values(PRICE_PRODUCT_SEC.NEXTVAL,
                (select id from DTV_PRICE_CUSTOMER where DESCRIPTION ='Prepago'),
                (select id from DTV_PRICE_IBS_PRODUCTS where DESCRIPTION = 'BIG BROTHER'),
                '456.67',
                (select id from DTV_PRICE_COUNTRIES where CODE='AR'),
                1);
insert into DTV_PRICE_PRODUCT_ZONE
values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='SANTA CRUZ' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR')) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='Edificio' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_AGREEMENT
values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='EMPLEADOS/PERIODISTAS' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='Bundle' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_SEGMENT
values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='TV' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' )) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

insert into DTV_PRICE_PRODUCT_FINANCE
values((select finance_id from DTV_PRICE_FINANCE where DESCRIPTION='S - Sold' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='AR' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='Prepago'))) ,
(SELECT last_number FROM user_sequences WHERE sequence_name = 'PRICE_PRODUCT_SEC'));

