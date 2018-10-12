DECLARE
  price_id NUMBER;
  price_hist_id NUMBER;

  count_f NUMBER;
  flag_s NUMBER;
  flag_st NUMBER;
  flag_pz NUMBER;
  flag_ct NUMBER;
  flag_a NUMBER;
  type arrayofnumbers IS VARRAY(50) OF NUMBER;
  count_f_array arrayofnumbers;
  flag_s_array arrayofnumbers;
  flag_st_array arrayofnumbers;
  flag_pz_array arrayofnumbers;
  flag_ct_array arrayofnumbers;
  flag_a_array arrayofnumbers;
  price_id_array arrayofnumbers;

begin

  select distinct price_id BULK COLLECT into price_id_array from DTV_PRICE_PRODUCT_HISTORY
  where CUSTOMER_CLASS=1
        and COUNTRY=1
        and ACTIVE=1;


  FOR j in 1 .. price_id_array.COUNT LOOP
    price_id := price_id_array(j);
    select ID into price_hist_id from DTV_PRICE_PRODUCT_HISTORY where price_id = price_id
    and change_date = (select max(change_date) from dtv_price_product_history where price_id = price_id);

    insert into DTV_PRICE_PRODUCT values((select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where id =price_hist_id),
                                         1,
                                         (select PRODUCT from DTV_PRICE_PRODUCT_HISTORY where id =price_hist_id),
                                         (select PRICE from DTV_PRICE_PRODUCT_HISTORY where id =price_hist_id),
                                         1,
                                         1);

    select count(*)  into count_f from  dtv_price_product_finance_hist where HISTORY_ID= price_hist_id ;
    select finance_id BULK COLLECT into count_f_array from  dtv_price_product_finance_hist where HISTORY_ID= price_hist_id ;

    if (count_f > 0) then
      FOR i in 1 .. count_f_array.count LOOP
        insert into DTV_PRICE_PRODUCT_FINANCE
        values (count_f_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;

    end if;

    select count(*)  into flag_s from  DTV_PRICE_PRODUCT_SEGMENT_HIST where HISTORY_ID= price_hist_id ;
    select SEGMENT_TYPE_ID BULK COLLECT into flag_s_array from  DTV_PRICE_PRODUCT_SEGMENT_HIST where HISTORY_ID= price_hist_id ;
    if (flag_s>0) then
      FOR i in 1 .. flag_s_array.count LOOP
        insert into DTV_PRICE_PRODUCT_SEGMENT
        values (flag_s_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;
    end if;

    select count(*)  into flag_st from  DTV_PRICE_PRODUCT_STRATUM_HIST where HISTORY_ID= price_hist_id ;
    select STRATUM_ID BULK COLLECT into flag_st_array from  DTV_PRICE_PRODUCT_STRATUM_HIST where HISTORY_ID= price_hist_id ;
    if (flag_st>0) then
      FOR i in 1 .. flag_st_array.count LOOP
        insert into DTV_PRICE_PRODUCT_STRATUM
        values (flag_st_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;
    end if;

    select count(*)  into flag_pz from  DTV_PRICE_PRODUCT_ZONE_HIST where HISTORY_ID= price_hist_id ;
    select ZONE_ID BULK COLLECT into flag_pz_array from  DTV_PRICE_PRODUCT_ZONE_HIST where HISTORY_ID= price_hist_id ;
    if (flag_pz>0) then
      FOR i in 1 .. flag_pz_array.count LOOP
        insert into DTV_PRICE_PRODUCT_ZONE
        values (flag_pz_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;

    end if;
    select count(*)  into flag_ct from  DTV_PRICE_PROD_CUST_TYPE_HIST where HISTORY_ID= price_hist_id ;
    select CUSTOMER_TYPE_ID BULK COLLECT into flag_ct_array from  DTV_PRICE_PROD_CUST_TYPE_HIST where HISTORY_ID= price_hist_id ;
    if (flag_ct>0) then
      FOR i in 1 .. flag_ct_array.count LOOP
        insert into DTV_PRICE_PROD_CUST_TYPE
        values (flag_ct_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;


    end if;

    select count(*)  into flag_a from  DTV_PRICE_PROD_AGREEMENT_HIST where HISTORY_ID= price_hist_id ;
    select AGREEMENT_ID BULK COLLECT into flag_a_array from  DTV_PRICE_PROD_AGREEMENT_HIST where HISTORY_ID= price_hist_id ;
    if (flag_a>0) then
      FOR i in 1 .. flag_a_array.COUNT LOOP
        insert into DTV_PRICE_PRODUCT_AGREEMENT
        values(flag_a_array(i),(select PRICE_ID from DTV_PRICE_PRODUCT_HISTORY where ID=price_hist_id ));
      END LOOP;

    end if;

  END LOOP;
end;



